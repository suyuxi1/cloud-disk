<template>
	<view class=""><video :src="url" controls autoplay style="width: 750rpx; height: 100vh;" @ended="back"></video></view>
</template>

<script>
export default {
	data() {
		return {
			url: ''
		};
	},
	onLoad(e) {
		//非法地址的处理
		console.log('进入video');
		if (!e.url) {
			uni.showToast({
				title: '非法参数',
				icon: 'none'
			});
			return uni.navigateBack({
				delta: 1
			});
		}
		this.url = e.url;
		if (e.title) {
			//把视频文件名作为页面的导航标题
			uni.setNavigationBarTitle({
				title: e.title
			});
		}
	},
	methods: {
		back() {
			uni.navigateBack({
				delta: 1
			});
		}
	}
};
</script>

<style></style>
