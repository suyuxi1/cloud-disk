<template>
	<view style="height: 100vh;" class="flex flex-column">
		<view class="flex border-bottom border-light-secondary" style="height: 100rpx;">
			<view
				class="flex-1 flex flex-column align-center justify-center"
				v-for="(item, index) in tabBars"
				:key="index"
				:class="index === tabIndex ? 'text-main' : ''"
				@click="changeTab(index)"
			>
				<text class="font-md">{{ item.name }}</text>
				<text class="rounded" :class="tabIndex === index ? 'bg-main' : 'bg-white'" style=" height: 8rpx; width: 140rpx"></text>
			</view>
		</view>

		<!-- swiper内容随着上面的tab的切换联动 -->
		<swiper :duration="250" class="flex-1 flex" :current="tabIndex" @change="changeTab($event.detail.current)">
			<swiper-item class="flex-1 flex" v-for="(item, index) in tabBars" :key="index">
				<scroll-view scroll-y="true" class="flex-1">
					<template v-if="index === 0">
						<view></view>
					</template>
					<!-- 上传列表 -->
					<template v-else>
						<view class="p-2 border-bottom border-light-secondary font text-muted">上传中({{ uploading.length }})</view>
						<!-- 这里要注意，因为下面同级还有个f-list中绑定key为index，会冲突，所以分别给它们加上不同的前缀区分，否则会报错 -->
						<f-list v-for="(item, index) in uploading" :key="'i' + index" :item="item" :index="index">
							<view class="flex align-center text-main" style="height: 70rpx;">
								<text class="iconfont icon-zanting"></text>
								<text class="ml-1">{{ item.progress }}%</text>
							</view>
							<!-- 进度条组件，uniapp自带的无须引入，percent属性绑定下载的百分比数值 -->
							<progress slot="bottom" :percent="item.progress" activeColor="#009CFF" :stroke-width="4" />
						</f-list>
						<view class="p-2 border-bottom border-light-secondary font text-muted">上传完成({{ uploaded.length }})</view>
						<f-list v-for="(item, index) in uploaded" :key="'d' + index" :item="item" :index="index" :showRight="false"></f-list>
					</template>
				</scroll-view>
			</swiper-item>
		</swiper>
	</view>
</template>

<script>
import fList from '../../components/common/f-list.vue';
import { mapState } from 'vuex';
export default {
	components: {
		fList
	},
	data() {
		return {
			tabIndex: 0,
			tabBars: [
				{
					name: '下载列表'
				},
				{
					name: '上传列表'
				}
			]
			// list: [
			// 	{
			// 		type: 'image',
			// 		name: '图片1.jpg',
			// 		data: 'https://images.pexels.com/photos/5327007/pexels-photo-5327007.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
			// 		create_time: '2020-10-21 08:00',
			// 		checked: false,
			// 		download: 100
			// 	},
			// 	{
			// 		type: 'image',
			// 		name: '图片2.jpg',
			// 		data: 'https://images.pexels.com/photos/5327931/pexels-photo-5327931.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
			// 		create_time: '2020-10-21 08:00',
			// 		checked: false,
			// 		download: 80
			// 	},
			// 	{
			// 		type: 'image',
			// 		name: '图片3.jpg',
			// 		data: 'https://images.pexels.com/photos/5327007/pexels-photo-5327007.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
			// 		create_time: '2020-10-21 08:00',
			// 		checked: false,
			// 		download: 100
			// 	},
			// 	{
			// 		type: 'image',
			// 		name: '图片4.jpg',
			// 		data: 'https://images.pexels.com/photos/5327931/pexels-photo-5327931.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
			// 		create_time: '2020-10-21 08:00',
			// 		checked: false,
			// 		download: 70
			// 	}
			// ]
		};
	},
	computed: {
		...mapState({
			uploadList: state => state.uploadList
		}),
		uploading() {
			return this.uploadList.filter(item => {
				return item.progress < 100;
			});
		},
		uploaded() {
			return this.uploadList.filter(item => {
				return item.progress === 100;
			});
		},
		downing() {
			return this.list.filter(item => {
				return item.download < 100;
			});
		},
		downed() {
			return this.list.filter(item => {
				return item.download === 100;
			});
		}
	},
	methods: {
		changeTab(index) {
			this.tabIndex = index;
		}
	}
};
</script>

<style></style>
