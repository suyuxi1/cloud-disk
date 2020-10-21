<template>
	<view>
		<nav-bar>
			<text slot="left" class="font-md ml-3">首页</text>
			<template slot="right">
				<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3"><text class="iconfont icon-zengjia"></text></view>
				<view style="width: 60rpx;height: 60rpx;" class="flex align-center justify-center bg-icon rounded-circle mr-3"><text class="iconfont icon-gengduo"></text></view>
			</template>
		</nav-bar>
		<view class="bg-info" style="height: 1000px;">
			<!-- 设置搜索框 -->
			<uni-search-bar placeholder="搜索网盘文件" maxlength="100" :radius="20"></uni-search-bar>
			123
		</view>
	</view>
</template>

<script>
import navBar from '../../components/common/nav-bar.vue';
import uniSearchBar from '../../components/uni-search-bar/uni-search-bar.vue';
export default {
	components: {
		navBar,
		uniSearchBar
	},
	data() {
		return {};
	},
	onLoad() {},
	methods: {}
};
</script>

<style></style>
