<template>
	<view>
		<nav-bar>
			<template v-if="checkCount === 0">
				<text slot="left" class="font-md ml-3">首页</text>
				<template slot="right">
					<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3">
						<text class="iconfont icon-zengjia"></text>
					</view>
					<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3">
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
				<input type="text" style="height: 70rpx; padding-left: 70rpx;" value="" class="bg-light font rounded-circle" placeholder="搜素网盘文件" />
			</view>
		</view>
		<!-- 调用f-list组件 -->
		<f-list v-for="(item, index) in list" :key="index" :item="item" :index="index" @select="select"></f-list>

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
		<f-dialog ref="dialog">是否删除选中的文件？</f-dialog>

		<!-- 重命名，通过ref定义不同的对话框对象，不同操作弹出的dialog是不同的对象 -->
		<f-dialog ref="rename"><input type="text" value="" v-model="renameValue" class="flex-1 bg-light rounded px-2" style="height: 95rpx;" placeholder="重命名" /></f-dialog>

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
export default {
	components: {
		navBar,
		uniSearchBar,
		indexCard,
		fList,
		fDialog
	},
	data() {
		return {
			renameValue: '',
			list: [
				{
					type: 'dir',
					name: '我的笔记',
					create_time: '2020-10-21 08:00',
					checked: false
				},
				{
					type: 'image',
					name: '风景.jpg',
					create_time: '2020-10-21 08:00',
					checked: false
				},
				{
					type: 'video',
					name: 'uniapp实战教程.mp4',
					create_time: '2020-10-21 08:00',
					checked: false
				},
				{
					type: 'text',
					name: '记事本.txt',
					create_time: '2020-10-21 08:00',
					checked: false
				},
				{
					type: 'none',
					name: '压缩包.rar',
					create_time: '2020-10-21 08:00',
					checked: false
				}
			]
		};
	},
	onLoad() {
		uni.request({
			url: 'http://127.0.0.1:7001/list',
			method: 'GET',
			success: res => {
				console.log(res.data);
			}
		});
	},
	methods: {
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
					this.$refs.dialog.open(close => {
						//对list进行过滤，留下未被选中的
						this.list = this.list.filter(item => !item.checked);
						close();
						uni.showToast({
							title: '删除成功',
							icon: 'none'
						});
						//在这里可以写点击删除需要做的回调事件，这里先在控制台模拟，实际需要把checkList移除掉
						// console.log('删除文件');
						// console.log(this.checkList);
					});
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
						//更新改元素name值，实时看到效果
						this.checkList[0].name = this.renameValue;
						close();
					});
					break;
				default:
					break;
			}
		}
	},
	computed: {
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
