import Vue from 'vue'
import App from './App'

//引入封装的请求库并挂载在vue原型上，使用时候：this.SH
//Vue.prototype.$appName = 'My App', 这样各个Vue实例就可以通过$appName的方式应用
//这样做不会引起污染全局作用域
import $H from 'common/request.js';
Vue.prototype.$H = $H

//引入VueX并挂载在Vue原型上
import store from 'store/index.js';
Vue.prototype.$store = store

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
	store,
	...App
})
app.$mount()
