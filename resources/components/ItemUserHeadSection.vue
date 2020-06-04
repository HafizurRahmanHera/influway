<template>
<no-ssr>
  <div>
    <div class="container">
      <div class="banner_img">
        <!-- Image -->
        <img v-if="authInfo.cover_image" :src="authInfo.cover_image" class="header-img-top" alt="..." />
        <img v-else src="/img/covers/profile-cover-1.jpg" class="header-img-top" alt="..." />
        <div class="banner_upload" @click="cover_modal=true">
          <i class="fa fa-camera" aria-hidden="true"></i>
          <p>Update cover image</p>
        </div>
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
                  v-if="authInfo.image"
                  :src="authInfo.image"
                  :alt="authInfo.name"
                  class="avatar-img rounded-circle border border-4 border-body"
                />
                <img
                  v-else
                  src="/images/default.jpg"
                  :alt="authInfo.name"
                  class="avatar-img rounded-circle border border-4 border-body"
                />
                <div class="pro_img_upload" @click="img_modal=true">
                  <i class="fa fa-camera" aria-hidden="true"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col mb-3 ml-n3 ml-md-n2">
            <!-- Pretitle -->
            <!-- <h6 class="header-pretitle">Members</h6> -->
            <h6 class="header-pretitle">Influencer</h6>

            <!-- Title -->
            <h1 class="header-title">{{authInfo.name}}</h1>
          </div>
          <div class="col-12 col-md-auto mt-2 mt-md-0 mb-md-3">
            <div class="all_token_sec">
              <div class="right_section_two">
                <div class="right_section_three">
                  <h3 class="right_section_three_text">Token</h3>
                  <p class="right_section_text_three_h3">{{currentTotalToken(userTokens)}}</p>
                </div>
                <div class="right_section_three">
                  <h3 class="right_section_three_text">Followers</h3>
                  <p class="right_section_text_three_h3">{{userFollowInfo.follower_count}}</p>
                </div>
                <div class="right_section_three">
                  <h3 class="right_section_three_text">Followling</h3>
                  <p class="right_section_text_three_h3">{{userFollowInfo.following_count}}</p>
                </div>
              </div>
              <div class="token_btn" style="text-align:center">
                <!-- <nuxt-link
                  v-if="$route.path=='/lookbook'"
                  to="/create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create lookbook</nuxt-link> -->
                <nuxt-link
                  v-if="$route.path==`/${authInfo.username}`"
                  to="/create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create lookbook</nuxt-link>
                <nuxt-link
                  v-else-if="$route.path=='/collage'"
                  to="/create_collage"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create collage</nuxt-link>
                <!-- <nuxt-link
                  v-else-if="$route.path=='/blog'"
                  to="/blog_create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create blog</nuxt-link> -->
                <nuxt-link
                  v-else-if="$route.path==`/${authInfo.username}/blog`"
                  to="/blog_create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create blog</nuxt-link>
                <!-- <nuxt-link
                  v-else-if="$route.path=='/vlog'"
                  to="/vlog_create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create vlog</nuxt-link> -->
                <nuxt-link
                  v-else-if="$route.path==`/${authInfo.username}/vlog`"
                  to="/vlog_create"
                  class="btn btn-primary d-block d-md-inline-block lift"
                >Create vlog</nuxt-link>
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
                  :class="($route.path=='/lookbook')?'active':''"
                  to="/lookbook"
                  class="nav-link"
                >Lookbook</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${authInfo.username}`)?'active':''"
                  :to="`/${authInfo.username}`"
                  class="nav-link"
                >Lookbook</nuxt-link>
              </li>
              <!-- <li class="nav-item">
                <nuxt-link
                  :class="($route.path=='/collage')?'active':''"
                  to="/collage"
                  class="nav-link"
                >Collage</nuxt-link>
              </li> -->
              <li class="nav-item">
                <!-- <nuxt-link
                  :class="($route.path=='/blog')?'active':''"
                  to="/blog"
                  class="nav-link"
                >Blog</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${authInfo.username}/blog`)?'active':''"
                  :to="`/${authInfo.username}/blog`"
                  class="nav-link"
                >Blog</nuxt-link>
              </li>
              <li class="nav-item">
                <!-- <nuxt-link
                  :class="($route.path=='/vlog')?'active':''"
                  to="/vlog"
                  class="nav-link"
                >Vlog</nuxt-link> -->
                <nuxt-link
                  :class="($route.path==`/${authInfo.username}/vlog`)?'active':''"
                  :to="`/${authInfo.username}/vlog`"
                  class="nav-link"
                >Vlog</nuxt-link>
              </li>
              <!-- <li class="nav-item">
                <nuxt-link
                  :class="($route.path=='/status')?'active':''"
                  to="/status"
                  class="nav-link"
                >Status</nuxt-link>
                <nuxt-link
                  :class="($route.path==`/${authInfo.username}/status`)?'active':''"
                  "to="`/${authInfo.username}/status`"
                  class="nav-link"
                >Status</nuxt-link>
              </li> -->
            </ul>
          </div>
        </div>
      </div>
      <!-- / .header-body -->
    </div>
    <Modal v-model="img_modal" title="Update profile image" width="600px" :mask-closable="false">
      <!-- Modal -->
      <div class="row justify-content-md-center">
        <!-- image section -->
        <div class="col-12 col-md-6 col-lg-6">
          <template v-if="!uploaded_user_img_path">
            <img
              v-if="authInfo.image"
              :src="authInfo.image"
              class="_1profile_img"
              :alt="authInfo.name"
              :title="authInfo.name"
            />
            <img v-else src="/images/default.jpg" class="_1profile_img" alt="Image" />
          </template>
          <template v-else>
            <img :src="uploaded_user_img_path" class="_1profile_img" alt="Image" />
          </template>

          <div class="_upload">
            <!-- <button class>Upload</button> -->
            <Upload
              :show-upload-list="false"
              :on-success="handleImageUpload"
              :format="['jpg','jpeg','png']"
              :max-size="2048"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              action="/uploadImages"
            >
              <Button icon="ios-cloud-upload-outline">Select Image</Button>
            </Upload>
          </div>

          <div class="save">
            <button
              :disabled="loading"
              @click="updateImage"
              class="btn btn-success d-block d-md-inline-block lift"
              type="button"
            >Update</button>
            <span style="margin-right:5px"></span>
            <button
              :disabled="loading"
              @click="cancelImgUpload"
              class="btn btn-danger d-block d-md-inline-block lift"
              type="button"
            >Cancel</button>
          </div>
        </div>
      </div>
      <!-- Modal -->
    </Modal>

    <Modal v-model="cover_modal" title="Update cover image" width="800px" :mask-closable="false">
      <!-- Modal -->
      <div class="row justify-content-md-center">
        <!-- image section -->
        <div class="col-12 col-md-10 col-lg-10">
          <div class="demo-upload-list">
          <template v-if="!uploaded_cover_img_path">
            <img
              v-if="authInfo.cover_image"
              :src="authInfo.cover_image"
              alt="cover_image"
            />
            <img v-else src="/img/covers/profile-cover-1.jpg"  alt="cover Image" />
          </template>
          <template v-else>
            <img :src="uploaded_cover_img_path" alt="cover Image" />
          </template>
          <br>
          <div class="_upload">
            <!-- <button class>Upload</button> -->
            <Upload
              :show-upload-list="false"
              :on-success="handleImageUpload2"
              :format="['jpg','jpeg','png']"
              :max-size="2048"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              action="/uploadImages"
            >
              <Button icon="ios-cloud-upload-outline">Select Image</Button>
            </Upload>
          </div>

          <div class="save">
            <button
              :disabled="loading"
              @click="updateCoverImage"
              class="btn btn-success d-block d-md-inline-block lift"
              type="button"
            >Update</button>
            <span style="margin-right:5px"></span>
            <button
              :disabled="loading"
              @click="cancelCoverImgUpload"
              class="btn btn-danger d-block d-md-inline-block lift"
              type="button"
            >Cancel</button>
          </div>
          </div>
        </div>
      </div>
      <!-- Modal -->
    </Modal>
  </div>
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  data() {
    return {
      img_modal: false,
      cover_modal: false,
      loading: false,
      uploaded_user_img_path: "",
      uploaded_cover_img_path: ""
    };
  },
  methods: {
    async handleImageUpload(res, file) {
      if (res) {
        if (this.uploaded_user_img_path) {
          const res = await this.callApi("post", "/deleteImageFromFolder", {
            image: this.uploaded_user_img_path
          });
          // console.log(res);
          if (res.status === 200) {
            // console.log(res);
          } else {
            // this.swr();
          }
        }
        // console.log(res);
        this.uploaded_user_img_path = res.image_path;
        // console.log(this.custom_product_image_create)
      }
      //console.log(res);
    },
    async handleImageUpload2(res, file) {
      if (res) {
        if (this.uploaded_cover_img_path) {
          const res = await this.callApi("post", "/deleteImageFromFolder", {
            image: this.uploaded_cover_img_path
          });
          // console.log(res);
          if (res.status === 200) {
            // console.log(res);
          } else {
            // this.swr();
          }
        }
        // console.log(res);
        this.uploaded_cover_img_path = res.image_path;
        // console.log(this.custom_product_image_create)
      }
      //console.log(res);
    },
    handleFormatError(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc:
          "File format of " +
          file.name +
          " is incorrect, please select jpg or png."
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "File  " + file.name + " is too large, no more than 2M."
      });
    },
    handleBeforeUpload() {
      // const check = this.form.custom_product_image;
      // if (check) {
      //   this.wr("One pictures can be uploaded.");
      // }
      // return check;
    },
    async updateImage() {
      if (this.uploaded_user_img_path == "") {
        this.wr("No image selected");
        return;
      }
      this.loading = true;
      // console.log(this.uploaded_user_img_path);
      // return
      const res = await this.callApi("post", "/uploadUserImage", {
        image: this.uploaded_user_img_path
      });
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch("setAuthInfo", res.data);
        this.s("Image updated successfully!");
        // this.$router.push("/profile");
        this.loading = false;
        this.img_modal = false;
        return;
      } else if (res.status === 401) {
        // console.log(res)
        return this.e(res.data.message);
        this.loading = false;
        return;
      } else if (res.status === 400) {
        // console.log(res);
        for (let e of res.data) {
          this.e(e.message);
        }
        this.loading = false;
        return;
      } else {
        return this.swr();
        this.loading = false;
      }
    },
    async updateCoverImage() {
      if (this.uploaded_cover_img_path == "") {
        this.wr("No image selected");
        return;
      }
      this.loading = true;
      // console.log(this.uploaded_cover_img_path);
      // return
      const res = await this.callApi("post", "/uploadCoverImage", {
        image: this.uploaded_cover_img_path
      });
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch("setAuthInfo", res.data);
        this.s("Cover Image updated successfully!");
        // this.$router.push("/profile");
        this.loading = false;
        this.cover_modal = false;
        return;
      } else if (res.status === 401) {
        // console.log(res)
        return this.e(res.data.message);
        this.loading = false;
        return;
      } else if (res.status === 400) {
        // console.log(res);
        for (let e of res.data) {
          this.e(e.message);
        }
        this.loading = false;
        return;
      } else {
        return this.swr();
        this.loading = false;
      }
    },
    async cancelImgUpload() {
      if (this.uploaded_user_img_path == "") {
        // this.$router.push("/profile");
        this.img_modal = false;
        return;
      }
      this.loading = true;
      // console.log("remove image");
      // console.log(file)
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: this.uploaded_user_img_path
      });
      // console.log(res);
      if (res.status === 200) {
        // console.log(res);
      } else {
        // this.swr();
      }
      // remove image from folder
      // this.$router.push("/profile");
      this.loading = false;
      this.img_modal = false;
      this.uploaded_user_img_path = "";
    },
    async cancelCoverImgUpload() {
      if (this.uploaded_cover_img_path == "") {
        // this.$router.push("/profile");
        this.cover_modal = false;
        return;
      }
      this.loading = true;
      // console.log("remove image");
      // console.log(file)
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: this.uploaded_cover_img_path
      });
      // console.log(res);
      if (res.status === 200) {
        // console.log(res);
      } else {
        // this.swr();
      }
      // remove image from folder
      // this.$router.push("/profile");
      this.loading = false;
      this.cover_modal = false;
      this.uploaded_cover_img_path = "";
    }
  }
};
</script>

<style scoped>
</style>
