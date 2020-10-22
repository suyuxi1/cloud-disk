<template>
	<view class="flex align-center p-2 border-bottom border-light-secondary">
		<image :src="item.icon" mode="" style="width: 80rpx; height: 80rpx" class="px-3"></image>
		<view class="flex flex-column">
			<text>{{ item.name }}</text>
			<text class="uni-h6">{{ item.time }}</text>
		</view>
	</view>
</template>

<script>
export default {
	props: {
		item: Object
	},
	data() {
		return {};
	}
};
</script>

<style></style>
