<template>
	<view>
		<!-- 自定义导航栏 -->
		<nav-bar>
			<template v-if="checkCount === 0">
				<template slot="left">
					<view style="width: 60rpx; height: 60rpx;" class="flex align-center justify-center bg-light rounded-circle ml-3" @tap="backUp" v-if="current">
						<image src="../../static/arrow-left.png" style="width:40rpx;height: 40rpx;" mode=""></image>
					</view>
					<text class="font-md ml-3">{{ current ? current.name : '首页' }}</text>
				</template>
				<template slot="right">
					<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3" @tap="openAddDialog">
						<text class="iconfont icon-zengjia"></text>
					</view>
					<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3" @click="openSortDialog">
						<text class="iconfont icon-gengduo"></text>
					</view>
				</template>
			</template>
			<template v-else>
				<view slot="left" class="font-md ml-3 text-primary" @click="handleCheckAll(false)">取消</view>
				<text class="font-md font-weight-bold">已选中{{ checkCount }}个</text>
				<view class="font-md mr-3 text-primary" slot="right" @click="handleCheckAll(true)">全选</view>
			</template>
		</nav-bar>
		<!-- 设置搜索框 -->
		<!-- <uni-search-bar placeholder="搜索网盘文件" maxlength="100" :radius="20"></uni-search-bar> -->
		<view class="px-3 py-2">
			<view class="position-relative">
				<view class="flex align-center justify-center text-light-muted" style="height: 70rpx; width: 70rpx; position: absolute; top: 0; left: 0;">
					<text class="iconfont icon-sousuo"></text>
				</view>
				<input type="text" style="height: 70rpx; padding-left: 70rpx;" value="" class="bg-light font rounded-circle" placeholder="搜素网盘文件" @input="search" />
			</view>
		</view>

		<!-- 调用f-list组件 -->
		<f-list v-for="(item, index) in list" :key="index" :item="item" @click="doEvent(item)" :index="index" @select="select"></f-list>

		<!-- 底部操作条 -->
		<!-- 选中个数大于0才会出现这个操作条 -->
		<view v-if="checkCount > 0">
			<!-- 这里要留出一定的高度，因为底部操作条需要被固定在底部，并空出底部tabbar高度的地方 -->
			<view class="" style="height: 115rpx;"></view>
			<!-- 操作条容器的样式，高度，颜色，固定在底部，垂直方向拉升效果 -->
			<view class="flex align-stretch bg-primary text-white fixed-bottom" style="height: 115rpx;">
				<!-- 根据元素个数等分容器，所以要么四个等分，要么两个等分，行高的修改可距离变得合理，点击还会变色：hover-class -->
				<view
					class="flex-1 flex flex-column align-center justify-center"
					style="line-height: 1.5;"
					v-for="(item, index) in actions"
					:key="index"
					hover-class="bg-hover-primary"
					@click="handleBottomEvent(item)"
				>
					<text class="iconfont" :class="item.icon"></text>
					{{ item.name }}
				</view>
			</view>
		</view>

		<!-- 是否要删除 -->
		<f-dialog ref="delete">是否删除选中的文件？</f-dialog>

		<!-- 重命名，通过ref定义不同的对话框对象，不同操作弹出的dialog是不同的对象 -->
		<f-dialog ref="rename"><input type="text" value="" v-model="renameValue" class="flex-1 bg-light rounded px-2" style="height: 95rpx;" placeholder="重命名" /></f-dialog>

		<!-- 新建文件夹，使用自定义弹出层，使用input作为插槽，绑定data中的newdirname变量 -->
		<f-dialog ref="newdir">
			<input type="text" value="" v-model="newdirname" class="flex-1 bg-light rounded px-2" style="height: 95rpx;" placeholder="新建文件夹名称" />
		</f-dialog>

		<!-- 添加操作条，type表示弹出的位置类型，具体取值都在popup子组件中 -->
		<uni-popup ref="add" type="bottom">
			<view class="bg-white flex" style="height: 200rpx;">
				<!-- 遍历addList数组，纵向flex，为每个操作分配等高的空间，每个操作有图标和名称组成 -->
				<view class="flex-1 flex align-center justify-center flex-column" hover-class="bg-light" v-for="(item, index) in addList" :key="index" @tap="handleAddEvent(item)">
					<text class="rounded-circle bg-light iconfont flex align-center justify-center" :class="item.icon + ' ' + item.color"></text>
					<!-- 每个操作的名称 -->
					<text class="font text-muted">{{ item.name }}</text>
				</view>
			</view>
		</uni-popup>

		<!-- 排序框，底部弹出，遍历排序操作数组，为当前索引项绑定文字蓝色样式 -->
		<uni-popup ref="sort" type="bottom">
			<view class="bg-white">
				<view
					v-for="(item, index) in sortOptions"
					:key="index"
					class="flex align-center justify-center py-3 font border-bottom border-light-secondary"
					:class="index === sortIndex ? 'text-main' : 'text-dark'"
					hover-class="bg-light"
					@click="changSort(index)"
				>
					{{ item.name }}
				</view>
			</view>
		</uni-popup>

		<!-- <view v-for="(item, index) in items" :key="index">
				<view class="flex align-center p-2 border-bottom border-light-secondary">
					<image :src="item.icon" mode="" style="width: 80rpx; height: 80rpx" class="px-3"></image>
					<view class="flex flex-column">
						<text>{{ item.name }}</text>
						<text class="uni-h6">{{ item.time }}</text>
					</view>
				</view>
			</view> -->

		<!-- 调用index-card组件 -->
		<!-- <block v-for="(item, index) in items" :key="index"><index-card :item="item" :index="index"></index-card></block> -->
	</view>
</template>

<script>
import navBar from '../../components/common/nav-bar.vue';
import uniSearchBar from '../../components/uni-search-bar/uni-search-bar.vue';
import indexCard from '../../components/index-card/index-card.vue';
import fList from '../../components/common/f-list.vue';
import fDialog from '../../components/common/f-dialog.vue';
import uniPopup from '../../components/uni-ui/uni-popup/uni-popup.vue';
export default {
	components: {
		navBar,
		uniSearchBar,
		indexCard,
		fList,
		fDialog,
		uniPopup
	},
	data() {
		return {
			renameValue: '',
			newdirname: '',
			list: [],
			addList: [
				{
					icon: 'icon-file-b-6',
					color: 'text-success',
					name: '上传图片'
				},
				{
					icon: 'icon-file-b-9',
					color: 'text-primary',
					name: '上传视频'
				},
				{
					icon: 'icon-file-b-8',
					color: 'text-muted',
					name: '上传文件'
				},
				{
					icon: 'icon-file-b-2',
					color: 'text-warning',
					name: '新建文件夹'
				}
			],
			dirs: [], //这里的dirs是记录路由的，sortOptions数组记录排序方式，其中的key可以作为查询参数传到后台，
			sortIndex: 0,
			sortOptions: [
				{
					name: '按名称排列',
					key: 'name'
				},
				{
					name: '按时间排序',
					key: 'created_time'
				}
			]
		};
	},
	onLoad() {
		// uni.request({
		// 	url: 'http://127.0.0.1:7001/list',
		// 	method: 'GET',
		// 	success: res => {
		// 		console.log(res.data);
		// 	}
		// });

		//页面加载的时候，从本地存储读取dirs，如果不清空，会从上次离开的地方继续
		let dirs = uni.getStorageSync('dirs');
		if (dirs) {
			this.dirs = JSON.parse(dirs);
		}
		this.getData();
	},
	methods: {
		//生成唯一ID
		genID(length) {
			return Number(
				Math.random()
					.toString()
					.substr(3, length) + Date.now()
			).toString(36);
		},
		//上传
		upload(file, type) {
			//上传文件类型
			let t = type;
			//上传的key，用来区分每个文件
			const key = this.genID(8);
			//构建上传文件的对象，文件名，类型，大小，唯一的key，进度，状态，创建时间
			let obj = {
				name: file.name,
				type: t,
				size: file.size,
				key,
				progress: 0,
				status: true,
				create_time: new Date().getTime()
			};
			//创建上传任务，分发给Vuex的Actions，异步上传调度，主要是实现上传进度的回调
			this.$store.dispatch('createUploadJob', obj);
			//上传，查询参数为当前位置所在目录的id，body参数为文件路径
			this.$H
				.upload(
					'/upload?file_id=' + this.file_id,
					{
						filePath: file.path
					},
					p => {
						//更新上传任务进度
						this.$store.dispatch('updateUploadJob', {
							status: true,
							progress: p,
							key
						});
					}
				)
				.then(res => {
					//上传成功，请求数据更新列表
					this.getData();
				});
		},

		//搜索功能，关键字为空就请求所有数据的接口，否则就将文本框实时输入的内容进行搜索
		search(e) {
			if (e.detail.value == '') {
				return this.getData();
			}
			this.$H
				.get('/file/search?keyword=' + e.detail.value, {
					token: true
				})
				.then(res => {
					this.list = this.formatList(res.rows);
				});
		},
		//将数据格式化为我们需要显示的样子，不同的文件类型，是否选中
		formatList(list) {
			return list.map(item => {
				let type = 'none';
				if (item.isdir === 1) {
					type = 'dir';
				} else {
					type = item.ext.split('/')[0] || 'none';
				}
				return {
					type,
					checked: false,
					...item
				};
			});
		},
		getData() {
			//每次请求API接口的时候，把最新的file_id和选取的orderby排序方式带上
			console.log(this.file_id + '>>>>>>>>>>>>>>>>>');
			let orderby = this.sortOptions[this.sortIndex].key;
			console.log(orderby + ',<<<<<<<<<<<<<<<<<<');
			this.$H
				.get(`/file?file_id=${this.file_id}&orderby=${orderby}`, {
					token: true
				})
				.then(res => {
					console.log(res);
					this.list = this.formatList(res.rows);
				});
		},
		select(e) {
			this.list[e.index].checked = e.value;
		},
		//全选/取消全选
		handleCheckAll(checked) {
			this.list.forEach(item => {
				item.checked = checked;
			});
		},
		//处理底部操作条事件，这里仅对删除做了处理
		handleBottomEvent(item) {
			switch (item.name) {
				case '删除':
					this.$refs.delete.open(close => {
						//加载框过渡
						uni.showLoading({
							title: '删除中...',
							mask: false
						});
						//删除接口需要传"1,2,3"这样，用map取出checkList中每条数据的id，然后用join拼接上逗号
						let ids = this.checkList.map(item => item.id).join(',');
						this.$H
							.post(
								'/file/delete',
								{
									ids
								},
								{ token: true }
							)
							.then(res => {
								//重新请求下数据
								this.getData();
								uni.showToast({
									title: '删除成功',
									icon: 'none'
								});
								//结束loading
								uni.hideLoading();
							})
							.catch(err => {
								uni.hideLoading();
							});
						close();
					});
					// this.$refs.dialog.open(close => {
					// 	//对list进行过滤，留下未被选中的
					// 	this.list = this.list.filter(item => !item.checked);
					// 	close();
					// 	uni.showToast({
					// 		title: '删除成功',
					// 		icon: 'none'
					// 	});
					// 	//在这里可以写点击删除需要做的回调事件，这里先在控制台模拟，实际需要把checkList移除掉
					// 	// console.log('删除文件');
					// 	// console.log(this.checkList);
					// });
					break;
				case '重命名':
					// 重命名只能对单个文件进行,所以this.checkList[0],也就是选中的唯一元素
					this.renameValue = this.checkList[0].name;
					this.$refs.rename.open(close => {
						if (this.renameValue == '') {
							return uni.showToast({
								title: '文件名称不能为空',
								icon: 'none'
							});
						}
						// //更新改元素name值，实时看到效果
						// this.checkList[0].name = this.renameValue;
						//重命名接口需要三个参数，自身id，目录id，新名称
						console.log(this.checkList[0].id + '>>>>>>>' + this.file_id);
						this.$H
							.post(
								'/file/rename',
								{
									id: this.checkList[0].id,
									file_id: this.file_id,
									name: this.renameValue
								},
								{ token: true }
							)
							.then(res => {
								this.checkList[0].name = this.renameValue;
								uni.showToast({
									title: '重命名成功',
									icon: 'none'
								});
							});
						close();
					});
					break;
				default:
					break;
			}
		},

		//打开添加操作条
		openAddDialog() {
			this.$refs.add.open();
		},

		//处理添加操作条的各种事件
		handleAddEvent(item) {
			this.$refs.add.close();
			switch (item.name) {
				case '新建文件夹':
					this.$refs.newdir.open(close => {
						if (this.newdirname == '') {
							return uni.showToast({
								title: '文件夹名称不能为空',
								icon: 'name'
							});
						}
						//请求新增文件夹接口
						this.$H
							.post(
								'/file/createdir',
								{
									file_id: this.file_id,
									name: this.newdirname
								},
								{ token: true }
							)
							.then(res => {
								this.getData();
								uni.showToast({
									title: '新建文件夹成功',
									icon: 'none'
								});
							});
						// //模拟请求服务器，这里先添加到list数组中
						// this.list.push({
						// 	type: 'dir',
						// 	name: this.newdirname,
						// 	create_time: '2020-10-22 17:00'
						// });
						// uni.showToast({
						// 	title: '新建文件夹成功',
						// 	icon: 'name'
						// });
						close();
						this.newdirname = '';
					});
					break;
				case '上传图片':
					//选择图片，，限制为9张
					uni.chooseImage({
						count: 9,
						success: res => {
							//选择图片成功，就循环异步调用上传接口
							res.tempFiles.forEach(item => {
								this.upload(item, 'image');
							});
						}
					});
					break;
				default:
					break;
			}
		},

		// 列表点击事件处理
		doEvent(item) {
			console.log(item);
			//对文件类型进行各种情况处理
			switch (item.type) {
				//预览图片
				case 'image':
					let images = this.list.filter(item => {
						return item.type === 'image';
					});
					uni.previewImage({
						current: item.url,
						urls: images.map(item => item.url)
					});
					break;
				//视频播放
				case 'video':
					console.log('进入视频');
					uni.navigateTo({
						url: '../video/video?url=' + item.url + '&title=' + item.name
					});
					break;
				default:
					//把当前元素push到路由数组中去，然后用这个目录的id，去请求它的层级里的数据，同时存到本地存储中
					this.dirs.push({
						id: item.id,
						name: item.name
					});
					this.getData();
					uni.setStorage({
						key: 'dirs',
						data: JSON.stringify(this.dirs)
					});
					break;
			}
		},
		//切换排序
		changSort(index) {
			// this.sortIndex = index;
			// this.$refs.sort.close();
			this.sortIndex = index;
			this.getData();
			this.$refs.sort.close();
		},
		openSortDialog() {
			this.$refs.sort.open();
		},
		// 返回上一个目录
		//顶部导航栏在子目录的时候，会有返回箭头，它的事件如下，路由出栈，再获取回到上一层的最新数据，存储
		backUp() {
			this.dirs.pop();
			this.getData();
			uni.setStorage({
				key: 'dirs',
				data: JSON.stringify(this.dirs)
			});
		}
	},

	computed: {
		//两个计算属性，实时根据当前dirs数组的变化，
		//file_id计算属性取得应该传到后端的file_id参数（就是当前目录），
		//current计算属性则用来切换导航栏样式
		file_id() {
			let l = this.dirs.length;
			if (l == 0) {
				return 0;
			}
			return this.dirs[l - 1].id;
		},
		current() {
			let l = this.dirs.length;
			if (l === 0) {
				return false;
			}
			return this.dirs[l - 1];
		},
		//选中列表
		checkList() {
			return this.list.filter(item => item.checked);
		},
		checkCount() {
			return this.checkList.length;
		},
		actions() {
			if (this.checkCount > 1) {
				return [
					{
						icon: 'icon-xiazai',
						name: '下载'
					},
					{
						icon: 'icon-shanchu',
						name: '删除'
					}
				];
			}
			return [
				{
					icon: 'icon-xiazai',
					name: '下载'
				},
				{
					icon: 'icon-fenxiang-1',
					name: '分享'
				},
				{
					icon: 'icon-shanchu',
					name: '删除'
				},
				{
					icon: 'icon-chongmingming',
					name: '重命名'
				}
			];
		}
	}
};
</script>

<style></style>
