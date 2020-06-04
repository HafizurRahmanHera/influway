<template>
<no-ssr>
  <div>
    <div class="container">
      <div class="banner_img">
        <!-- Image -->
        <!-- <img src="/img/covers/profile-cover-1.jpg" class="header-img-top" alt="..." /> -->
        <img v-if="owner.cover_image" :src="owner.cover_image" class="header-img-top" alt="..." />
        <img v-else src="/img/covers/profile-cover-1.jpg" class="header-img-top" alt="..." />

        <!-- <div class="banner_upload">
          <i class="fa fa-camera" aria-hidden="true"></i>
          <p>Upload Image</p>
        </div> -->
      </div>
    </div>

    <div class="container">
      <!-- Body -->
      <div class="header-body mt-n5 mt-md-n6">
        <div class="row align-items-end">
          <div class="col-auto">
            <!-- Avatar -->
            <div class="upload_img">
              <div class="avatar avatar-xxl header-avatar-top">
                <img
                  v-if="owner.image"
                  :src="owner.image"
                  :alt="owner.name"
                  class="avatar-img rounded-circle border border-4 border-body"
                />
                <img
                  v-else
                  src="/images/default.jpg"
                  :alt="owner.name"
                  class="avatar-img rounded-circle border border-4 border-body"
                />
                <!-- <div class="pro_img_upload">
                  <i class="fa fa-camera" aria-hidden="true"></i>
                </div> -->
                <div v-if="owner.verification_status==4" class="_active"><i class="fas fa-check"></i></div>
              </div>
            </div>
          </div>
          <div class="col mb-3 ml-n3 ml-md-n2">
            <!-- Pretitle -->
            <!-- <h6 class="header-pretitle">Members</h6> -->
            <h6 v-if="owner.role==2" class="header-pretitle">Influencer</h6>
            <h6 v-else-if="owner.role==1" class="header-pretitle">Seller</h6>

            <!-- Title -->
            <h1 class="header-title">{{owner.name}}</h1>
          </div>
          <div class="col-12 col-md-auto mt-2 mt-md-0 mb-md-3">
            <div class="all_token_sec">
              <div class="right_section_two">
                <!-- <div class="right_section_three">
                  <h3 class="right_section_three_text">Token</h3>
                  <p class="right_section_text_three_h3">{{currentTotalToken(userTokens)}}</p>
                </div> -->
                <div class="right_section_three">
                  <h3 class="right_section_three_text">Followers</h3>
                  <p class="right_section_text_three_h3">{{owner.__meta__.follower_count}}</p>
                </div>
                <div class="right_section_three">
                  <h3 class="right_section_three_text">Followling</h3>
                  <p class="right_section_text_three_h3">{{owner.__meta__.following_count}}</p>
                </div>
              </div>
              <div class="token_btn" style="text-align:center">
                <!-- Button -->
                <!-- <a href="#" class="btn btn-primary d-block d-md-inline-block lift">Subscribe</a> -->
                <template v-if="authInfo.id!=owner.id && owner.follower">
                  <button class="btn btn-primary d-block d-md-inline-block lift" type="button" :disabled='loading' @click="unfollowUser()">{{loading ? 'wait..' : 'Unfollow' }}</button>
                </template>
                <template v-else-if="authInfo.id!=owner.id && owner.follower==null">
                  <button class="btn btn-primary d-block d-md-inline-block lift" type="button" :disabled='loading' @click="followUser()">{{loading ? 'wait..' : 'Follow' }}</button>
                </template>
              </div>
            </div>
          </div>
        </div>
        <!-- / .row -->
        <div class="row align-items-center">
          <div class="col">
            <!-- Nav -->
            <ul class="nav nav-tabs nav-overflow header-tabs">
              <li class="nav-item">
                <!-- <nuxt-link
                  :class="($route.path==`/lookbook/user/${owner.username}`)?'active':''"
                  :to="`/lookbook/user/${owner.username}`"
                  class="nav-link"
                >Lookbook</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${owner.username}`)?'active':''"
                  :to="`/${owner.username}`"
                  class="nav-link"
                >Lookbook</nuxt-link>
              </li>
              <!-- <li class="nav-item">
                <nuxt-link
                  :class="($route.path==`/collage/user/${owner.username}`)?'active':''"
                  :to="`/collage/user/${owner.username}`"
                  class="nav-link"
                >Collage</nuxt-link>
              </li> -->
              <li class="nav-item">
                <!-- <nuxt-link
                  :class="($route.path==`/blog/user/${owner.username}`)?'active':''"
                  :to="`/blog/user/${owner.username}`"
                  class="nav-link"
                >Blog</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${owner.username}/blog`)?'active':''"
                  :to="`/${owner.username}/blog`"
                  class="nav-link"
                >Blog</nuxt-link>
              </li>
              <li class="nav-item">
                <!-- <nuxt-link
                  :class="($route.path==`/vlog/user/${owner.username}`)?'active':''"
                  :to="`/vlog/user/${owner.username}`"
                  class="nav-link"
                >Vlog</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${owner.username}/vlog`)?'active':''"
                  :to="`/${owner.username}/vlog`"
                  class="nav-link"
                >Vlog</nuxt-link>
              </li>
              <!-- <li class="nav-item">
                <nuxt-link
                  :class="($route.path==`/status/user/${owner.username}`)?'active':''"
                  :to="`/status/user/${owner.username}`"
                  class="nav-link"
                >Status</nuxt-link>
                <nuxt-link
                  :class="($route.path==`/${owner.username}/status`)?'active':''"
                  :to="`/${owner.username}/status`"
                  class="nav-link"
                >Status</nuxt-link>
              </li> -->
              <li class="nav-item" v-if="owner.user_own_site">
                <!-- <a :href="`https://localhost/influwaymaker/sites/${owner.username}`" class="nav-link" > -->
                <a :href="`https://site.influway.com/sites/${owner.username}`" class="nav-link" >
                  Visit site
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- / .header-body -->
    </div>
  </div>
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  props:['owner'],
  data(){
    return {
      loading:false
    }
  },
  methods: {
    async unfollowUser(){
      // console.log('unfollowUser')
      this.loading=true
      const res = await this.callApi("post", "/unfollowUser", {
        id: this.owner.follower.id,
        following_user_id: this.owner.id,
      });
      if (res.status === 200) {
        this.s("Unfollowing user Successfully!");
        // null the follower
        this.owner.follower = null
        // minus owner follower count
        if (this.owner.__meta__.follower_count>0) {
          this.owner.__meta__.follower_count--
        }
        // minus user following count
        this.$store.dispatch('updateUserFollowingCount', 'minus')
        this.loading=false
      } else {
        // console.log(res)
        this.swr();
        this.loading=false
        return;
      }
    },
    async followUser(){
      // console.log('followUser')
      this.loading=true
      // console.log(this.owner)
      const res = await this.callApi("post", "/followUser", {
        following_user_id: this.owner.id,
      });

      if (res.status === 200) {
        this.s("Following user Successfully!");
        // console.log(res.data)
        // add folower object
        this.owner.follower = res.data
        // add owner follower count
        this.owner.__meta__.follower_count++
        // add user following count
        this.$store.dispatch('updateUserFollowingCount', 'add')
        this.loading=false
        // console.log(this.owner)
      } else {
        // console.log(res)
        this.swr();
        this.loading=false
        return;
      }
    }
  }
};
</script>

<style scoped>

</style>
