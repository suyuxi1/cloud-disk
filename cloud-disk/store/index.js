import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

import $H from '../common/request.js'

export default new Vuex.Store({
	state: {
		uploadList: [],
		downlist: [],
		user: null,
		token: null
	},
	actions: {
		//首先读取到剪切板的内容
		//从之前的剪贴板中解析出key的值，就是share表中的sharedUrl，真正的链接地址和它有关
		getShareUrl({
			state
		}) {

			uni.getClipboardData({
				success: (res) => {
					//通过前面结果可以看到剪贴的链接是以http://127.0.0.1:7001/开头的，接口上线了这个地址要改
					if (res.data.includes('http://127.0.0.1:7001/')) {
						//需要从完整的链接截取出key的值，数据库应该知道真正的链接就是和这个有关的
						let key = res.data.substring(res.data.lastIndexOf('\/') + 1, res.data.length)
						if (!key) {
							return
						}
						uni.showModal({
							content: '检测到有分享内容，是否打开？',
							success: (res) => {
								if (res.confirm) {
									uni.navigateTo({
										url: "/pages/shareurl/shareurl?key=" + key
									})
									//清空剪切板
									uni.setClipboardData({
										data: ''
									});
								}
							}
						});
					}
				}
			});

		},
		// //清除传输记录
		clearList({
			state
		}) {
			if (state.user) {
				state.downlist = []
				state.uploadList = []
				uni.removeStorageSync("downlist_" + state.user.id)
				uni.removeStorageSync("uploadList_" + state.user.id)
			}
		},

		// 创建一个下载任务
		createDownloadJob({
			state
		}, obj) {
			state.downlist.unshift(obj)
			uni.setStorage({
				key: "downlist_" + state.user.id,
				data: JSON.stringify(state.downlist)
			})
		},
		//更新下载任务进度
		updateDownLoadJob({
			state
		}, obj) {
			let i = state.downlist.findIndex(item => item.key === obj.key)
			if (i !== -1) {
				state.downlist[i].progress = obj.progress
				state.downlist[i].status = obj.status
				uni.setStorage({
					key: "downlist_" + state.user.id,
					data: JSON.stringify(state.downlist)
				})
			}
		},

		//创建一个上传任务
		createUploadJob({
			state
		}, obj) {
			//添加到上传队列的最前面
			state.uploadList.unshift(obj)
			//异步设置本地存储，记录键值对为：上传人和上传内容
			uni.setStorage({
				key: "uploadList_" + state.user.id,
				data: JSON.stringify(state.uploadList)
			})
		},
		//更新上传任务进度
		updateUploadJob({
			state
		}, obj) {
			//在上传队列中查找用户的上传任务
			let i = state.uploadList.findIndex(item => item.key === obj.key)
			//如果存在
			if (i !== -1) {
				//更新progress属性的值和上传状态的值
				state.uploadList[i].progress = obj.progress
				state.uploadList[i].status = obj.status
				//异步更新本地存储
				uni.setStorage({
					key: "uploadList_" + state.user.id,
					data: JSON.stringify(state.uploadList)
				})
			}
		},
		//退出登录
		logout({
			state
		}) {
			$H.post('/logout', {}, {
				token: true
			})
			state.user = null
			state.token = null
			uni.removeStorageSync('user')
			uni.removeStorageSync('token')
			uni.removeStorageSync('dirs');
			//重启应用
			uni.reLaunch({
				url: '/pages/login/login'
			});
		},
		login({
			state
		}, user) {
			state.user = user
			state.token = user.token

			uni.setStorageSync('user', JSON.stringify(user))
			uni.setStorageSync('token', user.token)
		},
		initUser({
			state
		}) {
			let user = uni.getStorageSync('user')
			if (user) {
				state.user = JSON.parse(user)
				state.token = state.user.token
			}
		},
		initList({
			state
		}) {
			let user = uni.getStorageSync('user')
			if (!user) {
				
			}
		},
		updateSize({
			state
		}, e) {
			state.user.total_size = e.total_size
			state.user.used_size = e.used_size
		}
	}
})
