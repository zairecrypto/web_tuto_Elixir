import {Socket} from "phoenix"
import Vue from 'vue'
import MyApp from "web/static/components/my-app.vue"

let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

// Create the main component
Vue.component('my-app', MyApp)

// And create the top-level view model:
new Vue({
  el: '#app',
  render(createElement) {
    return createElement(MyApp, {})
  }
});