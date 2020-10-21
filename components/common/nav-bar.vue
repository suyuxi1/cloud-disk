韩源 niupi 韩源 list 郑亮 ？？？ 韩源 组件的有吗 郑亮 我用的就是 韩源 不是要自己写个组件吗 郑亮 不是 郑亮 用他现成的 韩源 晓得了 郑亮 快点弄了给交了吧 韩源 我没哪个中间的屠 韩源 图
郑亮 0:09 妈的，我都是他妈截图截截他们晚上早上发的第一个首页图，截了首首页的图，然后我保存到本地。 由机器转文字 郑亮 0:03 那个图我也没有，他早上群里发了，我没保存。 由机器转文字
郑亮 0:05 你直接从他那个首页，然后用截图软件截一下就行了。 由机器转文字 韩源 嗯嗯 郑亮 0:02 或者你自己随便找个图给塞上去。 由机器转文字 韩源 嗯嗯 43分钟前 苏玉溪
<template>
	<view>
		<uni-status-bar></uni-status-bar>
		<view style="height: 44px;" class="flex border-bottom align-center">
			<view class="flex-1 flex"><text class="font-md ml-3">首页</text></view>
			<view class="flex-1 flex justify-center"></view>
			<view class="flex-1 flex justify-end">
				<view style="width: 60rpx; height: 60rpx;" class="flex align-center justify-center bg-light rounded-circle mr-3"><text class="iconfont icon-zengjia"></text></view>
				<view style="width: 60rpx; height: 60rpx;" class="flex align-center justify-center bg-danger rounded-circle mr-3"><text class="iconfont icon-gengduo"></text></view>
			</view>
		</view>
	</view>
</template>

<script>
import uniStatusBar from '../../components/uni-ui/uni-status-bar/uni-status-bar.vue';
export default {
	comments: {
		uniStatusBar
	},
	data() {
		return {};
	},
	onLoad() {},
	methods: {}
};
</script>

<style>
.content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.logo {
	height: 200rpx;
	width: 200rpx;
	margin-top: 200rpx;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50rpx;
}

.text-area {
	display: flex;
	justify-content: center;
}

.title {
	font-size: 36rpx;
	color: #8f8f94;
}
</style>
全部已读 刚刚 郑亮 nav-bar.vue 706 B 下载 郑亮
<template>
	<view>
		<view class="fixed-top bg-white">
			<uni-status-bar></uni-status-bar>
			<view style="height: 44px;" class="flex align-center">
				<view class="flex-1 flex"><slot name="left"></slot></view>
				<view class="flex-1 flex justify-center"><slot></slot></view>
				<view class="flex-1 flex justify-end"><slot name="right"></slot></view>
			</view>
		</view>
		<view>
			<uni-status-bar></uni-status-bar>
			<view style="height: 44px;"></view>
		</view>
	</view>
</template>

<script>
import uniStatusBar from '@/components/uni-ui/uni-status-bar/uni-status-bar.vue';
export default {
	components: {
		uniStatusBar
	}
};
</script>

<style></style>
