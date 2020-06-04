<template>
  <no-ssr>
    <div class="d-flex align-items-center bg-auth border-top border-top-2 border-primary">
      <!-- CONTENT
      ==================================================-->
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-md-6 offset-xl-2 offset-md-1 order-md-2 mb-5 mb-md-0">
            <!-- Image -->
            <div class="text-center">
              <img src="/img/illustrations/happiness.svg" alt="..." class="img-fluid" />
            </div>
          </div>
          <div class="col-12 col-md-5 col-xl-4 order-md-1 my-5">
            <!-- Heading -->
            <h1 class="display-4 text-center mb-3">Welcome To Influway</h1>

            <!-- Subheading -->
            <p class="text-muted text-center mb-5">Sign up for your account.</p>

            <!-- Form -->
            <form v-on:submit.prevent="regsitrationUser">
              <!-- select career -->
              <div class="form-group">
                <!-- Label -->
                <label>Select Career</label>
                <!-- Input -->
                <!-- <input type="email" class="form-control" placeholder="name@address.com" /> -->
                <select class="form-control"  @change="selectedCareer" v-model="formData.role" required>
                  <option  selected :value="0">Select Career</option>
                  <option :value="1">Retail</option>
                  <option :value="2">Influencer</option>
                </select>
              </div>
              <!-- name field -->
              <div class="form-group">
                <!-- Label -->
                <label v-if="career_retail">Shop Name</label>
                <label v-else>Name</label>
                <!-- Input -->
                <input v-model="formData.name" type="text" class="form-control" placeholder="Name" />
              </div>
              <!-- username field -->
              <div class="form-group">
                <!-- Label -->
                <label >Username</label>
                <!-- Input -->
                <input v-model="formData.username" type="text" class="form-control" placeholder="username" />
              </div>
              <!-- Email address -->
              <div class="form-group">
                <!-- Label -->
                <label>Email Address</label>
                <!-- Input -->
                <input v-model="formData.email" type="email" class="form-control" placeholder="name@address.com" />
              </div>
              <template v-if="career_retail">
                <!-- select shop category -->
                <div class="form-group">
                  <!-- Label -->
                  <label>Shop Category</label>
                  <!-- Input -->
                  <select class="form-control" v-model="formData.shop_category_id">
                    <option selected :value="0">Select category</option>
                    <option
                      v-for="category in categories"
                      :key="category.id"
                      :value="category.id"
                    >{{category.name}}</option>
                  </select>
                </div>
                <!-- shop description field -->
                <div class="form-group">
                  <!-- Label -->
                  <label>Shop Description</label>
                  <!-- Input -->
                  <!-- <input v-model="formData.email" type="email" class="form-control" placeholder="name@address.com" /> -->
                  <Input
                        class
                        type="textarea"
                        :autosize="{minRows: 5,maxRows: 15}"
                        placeholder="Shop description..."
                        v-model="formData.shop_description"
                      />
                </div>
                <!-- shop logo field -->
                <div class="form-group">
                  <!-- Label -->
                  <label >Upload Shop Logo</label>
                  <!-- Input -->
                  <div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
                        <template v-if="item.status === 'finished'">
                          <img :src="item.url" />
                          <div class="demo-upload-list-cover">
                            <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                            <Icon type="ios-trash-outline" @click.native="handleRemove(item,index)"></Icon>
                          </div>
                        </template>
                        <template v-else>
                          <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
                        </template>
                      </div>
                      <Upload
                        ref="upload"
                        :show-upload-list="false"
                        :on-success="handleSuccess"
                        :format="['jpg','jpeg','png']"
                        :max-size="2048"
                        :on-format-error="handleFormatError"
                        :on-exceeded-size="handleMaxSize"
                        :before-upload="handleBeforeUpload"
                        type="drag"
                        action="/uploadImages"
                        style="display: inline-block;width:58px;"
                      >
                        <div style="width: 58px;height:58px;line-height: 58px;">
                          <Icon type="ios-camera" size="20"></Icon>
                        </div>
                      </Upload>
                      <Modal title="View Image" v-model="visible">
                        <!-- <img :src="'https://o5wwk8baw.qnssl.com/' + imgURL + '/large'" v-if="visible" style="width: 100%"> -->
                        <img :src="imgURL" v-if="visible" style="width: 100%" />
                      </Modal>
                </div>

              </template>

              <!-- Password -->
              <div class="form-group">
                <!-- Label -->
                <label>Password</label>
                <!-- Input group -->
                <div class="input-group input-group-merge">
                  <!-- Input -->
                  <input v-model="formData.password"
                    type="password"
                    class="form-control form-control-appended"
                    placeholder="Enter your password"
                  />
                  <!-- Icon -->
                  <div class="input-group-append">
                    <span class="input-group-text">
                      <i class="fas fa-lock"></i>
                    </span>
                  </div>
                </div>
              </div>
              <!-- confirm Password -->
              <div class="form-group">
                <!-- Label -->
                <label>Confirm Password</label>
                <!-- Input group -->
                <div class="input-group input-group-merge">
                  <!-- Input -->
                  <input v-model="formData.password_confirmation"
                    type="password"
                    class="form-control form-control-appended"
                    placeholder="confirm password"

                  />
                  <!-- Icon -->
                  <div class="input-group-append">
                    <span class="input-group-text">
                      <i class="fas fa-lock"></i>
                    </span>
                  </div>
                </div>
              </div>

              <!-- Submit -->
              <button class="btn btn-lg btn-block btn-primary mb-3" type="submit">Sign up</button>

              <!-- Link -->
              <div class="text-center">
                <small class="text-muted text-center">
                  Already have an account?
                  <!-- <a href="sign-in-illustration.html">Log in</a>. -->
                  <a href="https://influway.com/">Log in</a>
                </small>
              </div>
            </form>
          </div>
        </div>
        <!-- / .row -->
      </div>
      <!-- / .container -->
    </div>
  </no-ssr>
</template>

<script>
export default {
  middleware: "guest",
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([app.$axios.get(`/getCategories`)]);
      // console.log(data)
      return {
        categories: res1.data
        // categories: null
        // categories: {}
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      career_retail: false,
      formData: {
        name: "",
        username: "",
        email: "",
        password: "",
        password_confirmation: "",
        role: 0,
        shop_category_id: 0,
        image: null,
        shop_description: null
      },
      termCondition: false,

      imgURL: "",
      visible: false,
      uploadList: [],
      loading: false,
    };
  },
  methods: {
    async regsitrationUser() {
      // if (
      //   this.formData.email == "" ||
      //   this.formData.password == "" ||
      //   this.formData.name == "" ||
      //   this.formData.password_confirmation == "" ||
      //   this.formData.role == ""
      // ) {
      //   this.in("All fields are required !");
      //   return;
      // }
      this.loading= true
      if (!this.categories.length) {
        this.e("Please reload the page!");
        this.loading= false
        return;
      }

      if (this.formData.role == 0) {
        this.e("Select a career!");
        this.loading= false
        return;
      }
       else if (this.formData.name == "") {
        this.e("Name field can not be empty!");
        this.loading= false
        return;
      }
       else if (this.formData.username == "") {
        this.e("Username field can not be empty!");
        this.loading= false
        return;
      }
       else if(/\s/.test(this.formData.username)) {
        this.e("Username can not contain space!");
        this.loading= false
        // this.e("username can not contain only alphabet and number!");
        return;
      }

       else if (this.formData.email == "") {
        this.e("Email field can not be empty!");
        this.loading= false
        return;
      } else if (this.formData.password == "") {
        this.e("Password field can not be empty!");
        this.loading= false
        return;
      } else if (this.formData.password.length < 6) {
        this.e("Password must be at least 6 characters!");
        this.loading= false
        return;
      } else if (this.formData.password_confirmation == "") {
        this.e("Confirm Password field can not be empty!");
        this.loading= false
        return;
      }

      if (this.career_retail) {
        if (this.formData.shop_category_id == 0) {
          this.e("Select shop category!");
          this.loading= false
          return;
        } else if (this.formData.shop_description == "") {
          this.e("Shop description can not be empty!");
          this.loading= false
          return;
        } else if (!this.uploadList.length) {
          this.e("Upload shop logo!");
          this.loading= false
          return;
        }
        if (this.uploadList.length) {
          // console.log(this.uploadList[0].url)
          this.formData.image = this.uploadList[0].url;
        }
      } else {
        this.formData.shop_category_id = null;
        this.formData.shop_description = null;
        // this.formData.image = null
        // rmove image from backend
      }

      if (this.formData.password_confirmation !== this.formData.password) {
        this.in("Password Doesn't match !");
        this.loading= false
        return;
      }
      // if(!this.termCondition){
      //     this.in("Please agree with our condition !")
      //     return
      // }
      // console.log(this.formData);
      // return;

      const res = await this.callApi("post", "/register", this.formData);
      if (res.status == 200) {
        this.s("Registration Successfull !");
        this.in("Please Login !");
        this.$router.push("/login");
        this.loading= false
        return
      } else if (res.status === 400) {
        // console.log(res);
        for (let d of res.data) {
          this.e(d.message);
        }
        this.loading= false
        return
      } else if (res.status === 401) {
        // console.log(res);
        for (let d of res.data) {
          this.e(d.message);
        }
        this.loading= false
        return
      } else {
        // console.log(res);
        this.loading= false
        this.e("There is an Error!");
      }
    },

    selectedCareer() {
      // console.log('selectedCareer')
      // console.log(this.formData.role)
      if (this.formData.role == 0) {
        this.career_retail = false;
        return;
      } else if (this.formData.role == 2) {
        this.career_retail = false;
        return;
      } else if (this.formData.role == 1) {
        this.career_retail = true;
        return;
      }
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    async handleRemove(file, index) {
      // console.log('remove image')
      // console.log(file)
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: file.url
      });
      if (res.status === 200) {
        // console.log(res);
      } else {
        this.swr();
      }
      // remove image from folder
      this.uploadList.splice(index, 1);
      // console.log(this.uploadList);
    },
    handleSuccess(res, file) {
      // console.log(res);
      // console.log(file);
      if (res) {
        let img = {
          name: file.name,
          percentage: file.percentage,
          status: file.status,
          // uid:1234567,
          url: res.image_path
        };
        this.uploadList.push(img);
        // console.log(this.custom_product_image_create)
      }
      // console.log(this.uploadList);
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
      const check = this.uploadList.length < 1;
      if (!check) {
        this.$Notice.warning({
          title: "1 image can be uploaded."
        });
      }
      return check;
    }
  }
};
</script>


