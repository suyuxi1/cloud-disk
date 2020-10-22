<template>
	<view>
		<nav-bar>
			<text slot="left" class="font-md ml-3">首页</text>
			<template slot="right">
				<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3"><text class="iconfont icon-zengjia"></text></view>
				<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3"><text class="iconfont icon-gengduo"></text></view>
			</template>
		</nav-bar>
		<view>
			<!-- 设置搜索框 -->
			<uni-search-bar placeholder="搜索网盘文件" maxlength="100" :radius="20"></uni-search-bar>
			
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
			<block v-for="(item, index) in items" :key="index"><index-card :item="item" :index="index"></index-card></block>
		</view>
	</view>
</template>

<script>
import navBar from '../../components/common/nav-bar.vue';
import uniSearchBar from '../../components/uni-search-bar/uni-search-bar.vue';
import indexCard from '../../components/index-card/index-card.vue';
export default {
	components: {
		navBar,
		uniSearchBar,
		indexCard
	},
	data() {
		return {
			items: [
				{
					icon: '../../static/home/file.png',
					name: '我的笔记',
					time: '2020-10-21'
				},
				{
					icon: '../../static/home/picture.png',
					name: '图片',
					time: '2020-10-21'
				},
				{
					icon: '../../static/home/video.png',
					name: '视频',
					time: '2020-10-21'
				},
				{
					icon: '../../static/home/text.png',
					name: '笔记',
					time: '2020-10-21'
				},
				{
					icon: '../../static/home/package.png',
					name: '压缩文件',
					time: '2020-10-21'
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
	methods: {}
};
</script>

<style></style>
