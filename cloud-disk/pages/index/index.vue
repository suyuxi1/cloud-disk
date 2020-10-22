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
				<view slot="left" class="font-md ml-3 text-primary">取消</view>
				<text class="font-md font-weight-bold">已选中{{ checkCount }}个</text>
				<view class="font-md mr-3 text-primary" slot="right">全选</view>
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

		<!-- 调用f-list组件 -->
		<f-list v-for="(item, index) in list" :key="index" :item="item" :index="index" @select="select"></f-list>
	</view>
</template>

<script>
import navBar from '../../components/common/nav-bar.vue';
import uniSearchBar from '../../components/uni-search-bar/uni-search-bar.vue';
import indexCard from '../../components/index-card/index-card.vue';
import fList from '../../components/common/f-list.vue';
export default {
	components: {
		navBar,
		uniSearchBar,
		indexCard,
		fList
	},
	data() {
		return {
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
		}
	},
	computed: {
		//选中列表
		checkList() {
			return this.list.filter(item => item.checked);
		},
		checkCount() {
			return this.checkList.length;
		}
	}
};
</script>

<style></style>
