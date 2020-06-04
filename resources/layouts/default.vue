<template>
  <div >
    <template v-if="authInfo">
      <my-menu></my-menu>
    </template>

    <div class="main-content">
      <nuxt/>
    </div>
  </div>
</template>

<script>
import MyMenu from '~/components/Menu.vue'
export default {
  components: {
    MyMenu,
  },
  async created(){
    if (this.authInfo) {
      const res = await this.callApi('get','/getUserDetails')
      if (res.status===200) {
        // console.log(res.data)
        let item = {
          receivedTokens: res.data.receivedTokens,
          deductedTokens: res.data.deductedTokens
        }
        this.$store.dispatch('setUserTokens', item)
        let item2 = {
          follower_count: res.data.__meta__.follower_count,
          following_count: res.data.__meta__.following_count
        }
        this.$store.dispatch('setUserFollowInfo', item2)
      }else{
        // console.log(res);
        this.swr();
      }

      // store token like value in store
      const res1 = await this.callApi('get','/getLikeTokenValue')
      if (res1.status===200) {
        // console.log(res1.data)
        this.$store.dispatch('setLikeTokenValue', res1.data.user_like_deducted_value)
        // console.log(this.likeTokenValue)
      }else{
        // console.log(res1);
        this.swr();
      }

    }
  },
  mounted() {

  },
  methods:{

  }
}
</script>

<style>
/* .container
{
  margin: 0;
  width: 100%;
  padding: 100px 0;
  text-align: center;
}

.button, .button:visited
{
  display: inline-block;
  color: #744d82;
  letter-spacing: 1px;
  background-color: #fff;
  border: 2px solid #744d82;
  text-decoration: none;
  text-transform: uppercase;
  padding: 15px 45px;
}

.button:hover, .button:focus
{
  color: #fff;
  background-color: #744d82;
}

.title
{
  color: #505153;
  font-weight: 300;
  font-size: 2.5em;
  margin: 0;
} */
</style>
