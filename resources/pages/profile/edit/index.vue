<template>
<no-ssr>
  <!-- <div> -->
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="container">
        <div class="row justify-content-center">
          <!-- Left Section -->
          <div class="col-12 col-md-12 col-lg-12">
            <div class="card _border_radious _mar_b20 _1pro" style="margin-top:20px;">
              <div class="row">
                <!-- image section -->
                <div class="col-12 col-md-4 col-lg-4">
                  <template v-if="!uploaded_user_img_path">
                  <img
                    v-if="authInfo.image"
                    :src="authInfo.image"
                    class="_1profile_img"
                    :alt="authInfo.name"
                    :title="authInfo.name"
                  />
                  <img
                    v-else
                    src="/images/default.jpg"
                    class="_1profile_img"
                    alt="Image"
                  />
                  </template>
                  <template v-else>
                  <img
                    :src="uploaded_user_img_path"
                    class="_1profile_img"
                    alt="Image"
                  />
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
                    <button @click="updateImage" class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                    <span style="margin-right:5px"></span>
                    <button @click="cancelImgUpload" class="btn btn-default  d-block d-md-inline-block lift" type="button">Cancel</button>
                  </div>
                </div>

                <div class="col-12 col-md-8 col-lg-8">
                  <div class="_1profile_top">
                    <p class="_1profile_title">Account Information</p>
                  </div>
                  <!-- account section -->
                  <p class="_1profile_subtitle _border_color">Account</p>
                  <!-- shop details-->
                  <div class="_1profile_main_all" v-if="authInfo.role==1">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop name</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type='text' name /> -->
                        <Input v-model="shop_info_form.name" type="text" placeholder="shop name" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Username</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type='text' name /> -->
                        <Input v-model="shop_info_form.username" type="text" placeholder="Username" />
                      </div>
                    </div>

                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Category</p>
                      <div class="_1profile_vbalue">
                        <Select v-model="shop_info_form.shop_category_id">
                          <!-- <Option selected :value="0">Select category</Option> -->
                          <Option
                            v-for="category in categories"
                            :key="category.id"
                            :value="category.id"
                          >{{category.name}}</Option>
                        </Select>
                      </div>
                    </div>

                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Description</p>
                      <div class="_1profile_vbalue">
                        <Input
                          type="textarea"
                          :autosize="{minRows: 5,maxRows: 15}"
                          placeholder="Shop description..."
                          v-model="shop_info_form.shop_description"
                        />
                      </div>
                    </div>

                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Address</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type='text' name /> -->
                        <Input v-model="shop_info_form.address" type="text" placeholder="Store address e,g Store no,Street address.State" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Phone</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type='text' name /> -->
                        <Input v-model="shop_info_form.phone" type="text" placeholder="+880811111168" />
                      </div>
                    </div>


                    <!-- <div class="_1profile_main">
                      <p class="_1profile_label">Shop Subcategory</p>
                      <div class="_1profile_vbalue">
                        <Select v-model="selected_subcategory" multiple >
                          <Option v-for="item in subcategoryList" :value="item.value" :key="item.value">{{ item.label }}</Option>
                        </Select>
                      </div>
                    </div> -->




                    <div class="_1profile_main">
                      <p class="_1profile_label"></p>
                      <div class="_1profile_vbalue">
                        <button :disabled='loading_shop_info' @click="updateShopInfo" class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                      </div>
                    </div>
                  </div>






                  <!-- user details-->
                  <div class="_1profile_main_all" v-else-if="authInfo.role==2">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Name</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type name /> -->
                        <Input v-model="user_info_form.name" type="text" placeholder="Name" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Username</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type name /> -->
                        <Input v-model="user_info_form.username" type="text" placeholder="Username" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label"></p>
                      <div class="_1profile_vbalue">
                        <button :disabled='loading_user_info' @click="updateUserInfo" class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                      </div>
                    </div>
                  </div>

                  <!-- email section -->
                  <p class="_1profile_subtitle _border_color">Email</p>
                  <div class="_1profile_main_all">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Email</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway@gmail.com" type name /> -->
                        <Input v-model="email_form.email" type="email" placeholder="email" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label"></p>
                      <div class="_1profile_vbalue">
                        <button :disabled='loading_email' @click="updateEmail"  class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                      </div>
                    </div>
                  </div>

                  <!-- password section -->
                  <p class="_1profile_subtitle _border_color">Password</p>
                  <div class="_1profile_main_all">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Current password</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway" type name /> -->
                        <Input v-model="password_form.current_password" type="password" placeholder="current password" />
                      </div>
                    </div>

                    <div class="_1profile_main">
                      <p class="_1profile_label">New password</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="category" type name /> -->
                        <Input v-model="password_form.password" type="password" placeholder="new password" />
                      </div>
                    </div>

                    <div class="_1profile_main">
                      <p class="_1profile_label">Confirm password</p>
                      <div class="_1profile_vbalue">
                        <!-- <textarea placeholder="Description"></textarea> -->
                        <Input v-model="password_form.password_confirmation" type="password" placeholder="confirm password" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label"></p>
                      <div class="_1profile_vbalue">
                        <button :disabled='loading_password' @click="updatePassword" class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                      </div>
                    </div>
                  </div>

                  <!-- ethereum_address section -->
                  <p class="_1profile_subtitle _border_color">Ethereum address</p>
                  <div class="_1profile_main_all">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Address</p>
                      <div class="_1profile_vbalue">
                        <!-- <input placeholder="Influway@gmail.com" type name /> -->
                        <Input v-model="ethereum_form.ethereum_address" type="text" placeholder="0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae" />
                      </div>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label"></p>
                      <div class="_1profile_vbalue">
                        <button :disabled='loading_ethereum_address' @click="updateEthereumAddress"  class="btn btn-primary d-block d-md-inline-block lift" type="button">Update</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Left Section -->
        </div>
      </div>
    </div>
  <!-- </div> -->
</no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  data(){
    return{
      categories:{},
      user_info_form:{
        name: '',
        username: ''
      },
      shop_info_form:{
        name: '',
        username: '',
        shop_category_id: '',
        shop_description: '',
        address: '',
        phone: '',
        // selected_subcategory:[]
      },
      email_form:{
        email: ''
      },
      ethereum_form:{
        ethereum_address: ''
      },
      password_form:{
        current_password:'',
        password:'',
        password_confirmation:'',
      },
      uploaded_user_img_path:'',
      loading_shop_info: false,
      loading_user_info: false,
      loading_email: false,
      loading_password: false,
      loading_ethereum_address: false,

      subcategoryList: [
            // {
            //     value: 'New York',
            //     label: 'New York'
            // },
            // {
            //     value: 'London',
            //     label: 'London'
            // },
        ],
      selected_subcategory: []
    }
  },
  async created(){
    if (this.authInfo.role==1) {
      // const res = await this.callApi('get', `/getCategories`)
      // if(res.status===200){
      //   this.categories = res.data
      // } else{
      //     this.swr()
      // }

      let [res1] = await Promise.all([
        this.callApi('get',`/getCategories`),
        // this.callApi('get',`/getSubcategories`),
        // this.callApi('get',`/getStoreSubcategoriesById/${this.authInfo.id}`),
      ]);
      if (res1.status===200) {
        this.categories = res1.data
      }else{
        this.swr()
      }
      // if (res2.status===200) {
      //   // this.categories = res2.data
      //   // console.log(res2.data)
      //   res2.data.forEach(element => {
      //     let item = {
      //       value: element.id,
      //       label: element.name
      //     }
      //     this.subcategoryList.push(item)
      //   });
      // }else{
      //   this.swr()
      // }
      // if (res3.status===200) {
      //   // this.categories = res2.data
      //   // console.log(res3.data)
      //   res3.data.forEach(element => {
      //     this.selected_subcategory.push(element.subcategory.id)
      //   });
      //   // console.log(this.selected_subcategory)
      // }else{
      //   this.swr()
      // }

    }

    if (this.authInfo.role==2) {
      this.user_info_form.name = this.authInfo.name
      this.user_info_form.username = this.authInfo.username
    }else if(this.authInfo.role==1){
      this.shop_info_form.name = this.authInfo.name
      this.shop_info_form.username = this.authInfo.username
      this.shop_info_form.shop_category_id = this.authInfo.shop_category_id
      this.shop_info_form.shop_description = this.authInfo.shop_description
      this.shop_info_form.address = this.authInfo.address
      this.shop_info_form.phone = this.authInfo.phone
    }

    // this.email_form.email = this.authInfo.email
    this.email_form.email = this.authHiddenInfo.email
    // this.ethereum_form.ethereum_address = this.authInfo.ethereum_address
    this.ethereum_form.ethereum_address = this.authHiddenInfo.ethereum_address
  },
  methods: {
    async updateUserInfo(){
      this.loading_user_info= true
      if (this.user_info_form.name==this.authInfo.name && this.user_info_form.username==this.authInfo.username) {
        this.loading_user_info= false
        return
      }
      else if(this.user_info_form.name==''){
        this.loading_user_info= false
        return this.e("Name can not be empty");
      }
      else if(this.user_info_form.username==''){
        this.loading_user_info= false
        return this.e("Username can not be empty");
      }
      else if(/\s/.test(this.user_info_form.username)) {
        this.e("Username can not contain space!");
        this.loading_user_info= false
        // this.e("Name can not contain only alphabet and number!");
        return;
      }
      else if(this.user_info_form.name.length<5){
        this.loading_user_info= false
        return this.e("Name must be atlest 5 character long");
      }
      // console.log(this.user_info_form)
      // return

      const res = await this.callApi("post", "/updateUserInfo", this.user_info_form);
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch('setAuthInfo',res.data)
        this.s("Account info updated successfully!");
        this.$router.push("/profile");
        this.loading_user_info= false
        return
      } else if(res.status === 401) {
        // console.log(res)
        this.loading_user_info= false
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        this.loading_user_info= false
        return
      } else {
        this.loading_user_info= false
        return this.swr();
      }

    },

    async updateShopInfo(){
      // console.log(this.selected_subcategory)


      this.loading_shop_info= true
      if (this.shop_info_form.name==this.authInfo.name && this.shop_info_form.username==this.authInfo.username && this.shop_info_form.shop_category_id==this.authInfo.shop_category_id && this.shop_info_form.shop_description==this.authInfo.shop_description && this.shop_info_form.address==this.authInfo.address && this.shop_info_form.phone==this.authInfo.phone) {
        this.loading_shop_info= false
        return
      }
      if(this.shop_info_form.name==''){
        this.loading_shop_info= false
        return this.e("Shop Name can not be empty");
      }
      else if(this.shop_info_form.username==''){
        this.loading_shop_info= false
        return this.e("Username can not be empty");
      }
      else if(/\s/.test(this.shop_info_form.username)) {
        this.e("Username can not contain space!");
        // this.e("Name can not contain only alphabet and number!");
        this.loading_shop_info= false
        return;
      }
      else if(this.shop_info_form.shop_category_id==''){
        this.loading_shop_info= false
        return this.e("Shop Category can not be empty");
      }
      else if(this.shop_info_form.shop_description==''){
        this.loading_shop_info= false
        return this.e("Shop Description can not be empty");
      }

      // if (this.selected_subcategory.length) {
      //   this.shop_info_form.selected_subcategory = this.selected_subcategory
      // }

      // console.log(this.shop_info_form)
      // return

      const res = await this.callApi("post", "/updateShopInfo", this.shop_info_form);
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch('setAuthInfo',res.data)
        this.s("Account info updated successfully!");
        this.$router.push("/profile");
        this.loading_shop_info= false
      } else if(res.status === 401) {
        // console.log(res)
        this.loading_shop_info= false
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        this.loading_shop_info= false
        return
      } else {
        this.loading_shop_info= false
        return this.swr();
      }

    },

    async updateEmail(){
      this.loading_email= true
      // if (this.email_form.email==this.authInfo.email) {
      if (this.email_form.email==this.authHiddenInfo.email) {
        this.loading_email= false
        return
      }
      else if(this.email_form.email==''){
        this.loading_email= false
        return this.e("Email can not be empty");
      }

      // console.log(this.email_form)
      // return

      const res = await this.callApi("post", "/updateEmail", this.email_form);
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch('setAuthHiddenInfo',res.data)
        // this.$store.dispatch('setAuthInfo',res.data)
        this.s("Email updated successfully!");
        this.$router.push("/profile");
        this.loading_email= false
      } else if(res.status === 401) {
        // console.log(res)
        this.loading_email= false
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        this.loading_email= false
        return
      } else {
        this.loading_email= false
        return this.swr();
      }

    },

    async updatePassword(){
      this.loading_password= true
      if (this.password_form.current_password=='' || this.password_form.password=='' || this.password_form.password_confirmation=='') {
        this.loading_password= false
        return this.e("All Fields are required!");
      }
      else if(this.password_form.password.length<6){
        this.loading_password= false
        return this.e("New Password must be atlest 6 character long!");
      }
      else if(this.password_form.password!=this.password_form.password_confirmation){
        this.loading_password= false
        return this.e("Confirm Password does not match!");
      }

      // console.log(this.password_form)
      // return

      const res = await this.callApi("post", "/updatePassword", this.password_form);
      if (res.status === 200) {
        // console.log(res)
        // this.$store.dispatch('setAuthInfo',res.data)
        this.s("Password updated successfully!");
        this.password_form.current_password = ''
        this.password_form.password = ''
        this.password_form.password_confirmation = ''
        this.$router.push("/profile");
        this.loading_password= false
      } else if(res.status === 401) {
        // console.log(res)
        this.loading_password= false
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        this.loading_password= false
        return
      } else {
        this.loading_password= false
        return this.swr();
      }

    },

    async updateEthereumAddress(){
      this.loading_ethereum_address= true
      // if (this.ethereum_form.ethereum_address==this.authInfo.ethereum_address) {
      if (this.ethereum_form.ethereum_address==this.authHiddenInfo.ethereum_address) {
        this.loading_ethereum_address= false
        return
      }
      else if(this.ethereum_form.ethereum_address==''){
        this.loading_ethereum_address= false
        return this.e("Address can not be empty");
      }

      // console.log(this.ethereum_form)
      // return

      const res = await this.callApi("post", "/updateEthereumAddress", this.ethereum_form);
      if (res.status === 200) {
        // console.log(res)
        // this.$store.dispatch('setAuthInfo',res.data)
        this.$store.dispatch('setAuthHiddenInfo',res.data)
        this.s("Address updated successfully!");
        this.$router.push("/profile");
        this.loading_ethereum_address= false
      } else if(res.status === 401) {
        // console.log(res)
        this.loading_ethereum_address= false
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        this.loading_ethereum_address= false
        return
      } else {
        this.loading_ethereum_address= false
        return this.swr();
      }

    },



    async cancelImgUpload() {
      if (this.uploaded_user_img_path=='') {
        this.$router.push("/profile");
        return
      }
      // console.log('remove image')
      // console.log(file)
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: this.uploaded_user_img_path
      });
      // console.log(res)
      if (res.status === 200) {
        // console.log(res);
      } else {
        // this.swr();
      }
      // remove image from folder
      this.$router.push("/profile");
      this.uploaded_user_img_path = ''
    },

    async handleImageUpload(res, file) {
      if (res) {
        if (this.uploaded_user_img_path) {
          const res = await this.callApi("post", "/deleteImageFromFolder", {
            image: this.uploaded_user_img_path
          });
          // console.log(res)
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

    async updateImage(){
      if (this.uploaded_user_img_path=='') {
        this.wr('No image selected')
        return
      }
      // console.log(this.uploaded_user_img_path)
      // return
      const res = await this.callApi("post", "/uploadUserImage", {image:this.uploaded_user_img_path});
      if (res.status === 200) {
        // console.log(res)
        this.$store.dispatch('setAuthInfo',res.data)
        this.s("Image updated successfully!");
        this.$router.push("/profile");
      } else if(res.status === 401) {
        // console.log(res)
        return this.e(res.data.message)
      } else if(res.status === 400) {
        // console.log(res)
        for (let e of res.data) {
          this.e(e.message)
        }
        return
      } else {
        return this.swr();
      }
    },
  }
};
</script>

<style scoped>
</style>
