<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div class="main-content">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-lg-12 col-xl-12">
            <!-- Header -->
            <div class="header mt-md-5"></div>

            <!-- Content -->
            <div class="card card-body p-5">
              <div class="row">
                <div class="col-12 col-md-7 col-lg-7">
                  <img
                    v-if="authInfo.image"
                    :src="authInfo.image"
                    :alt="authInfo.name"
                    :title="authInfo.name"
                    class="_1profile_img"
                  />
                  <img
                    v-else src="/images/default.jpg"
                    :alt="authInfo.name"
                    :title="authInfo.name"
                    class="_1profile_img"
                  />
                  <div  class="_1profile_share" v-if="authInfo.role==2">
                    <div  class="right_section_three">
                      <h3 class="right_section_three_text">Followers</h3>
                      <p class="right_section_text_three_h3">{{userFollowInfo.follower_count}}</p>
                    </div>
                    <div class="right_section_three">
                      <h3 class="right_section_three_text">Followling</h3>
                      <p class="right_section_text_three_h3">{{userFollowInfo.following_count}}</p>
                    </div>
                  </div>
                  <div class="card_all">
                    <div class="_bg">
                      <img src="/images/Layer3.png" alt="image" />
                    </div>
                    <div class="top_logo">
                      <img class="_logo_card" src="/images/influway.png" alt="image" />
                      <img src="/images/Layer4.png" alt="image" />
                    </div>
                    <div class="main_content">
                      <div class="address_main">
                        <div class="address">
                          <p class="address_title"><span>B</span>ALANCE</p>
                          <!-- <p class="blance blance2">349795734 <span>IWAY</span></p> -->
                          <!-- <p class="blance blance2">{{currentTotalToken(userTokens)}} <span> IWAY</span></p> -->
                          <p class="blance blance2">{{ numberWithCommas(currentTotalToken(userTokens)) }} <span> IWAY</span></p>
                        </div>
                        <div class="address">
                          <p class="address_title"><span>W</span>ALLET</p>
                          <!-- <p class="blance" v-if="authInfo.ethereum_address">{{authInfo.ethereum_address}}</p> -->
                          <p class="blance" v-if="authHiddenInfo.ethereum_address">{{authHiddenInfo.ethereum_address}}</p>
                        </div>
                        <div class="row">
                          <div class="col-4">
                            <div class="address">
                              <p class="address_title"><span>C</span>ARD <span>H</span>OLDER</p>
                              <!-- <p class="name"><span>J</span>anngo shela</p> -->
                              <p class="name">{{authInfo.name}}</p>
                            </div>
                          </div>
                          <div class="col-4">
                            <div class="address">
                              <p class="address_title"><span>D</span>ATE <span>C</span>REATED</p>
                              <!-- <p class="blance" v-if="authInfo.ethereum_address">{{formatDate(authInfo.created_at)}}</p> -->
                              <p class="blance" v-if="authHiddenInfo.ethereum_address">{{formatDate(authInfo.created_at)}}</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-12 col-md-5 col-lg-5">
                  <div class="_1profile_top">
                    <p class="_1profile_title">Account Information</p>

                    <!-- <button class="_1btn">
                      <img src="/img/edit.png" alt title />
                      Edit profile
                    </button> -->
                    <!-- <button class="btn btn-primary d-block d-md-inline-block lift" type="button"  @click="$router.push(`/profile/edit`)">Edit profile</button> -->
                    <nuxt-link to="/profile/edit" class="btn btn-primary d-block d-md-inline-block lift">Edit profile</nuxt-link>
                  </div>

                  <!-- account section -->
                  <p class="_1profile_subtitle _border_color">Account</p>
                  <!-- shop details-->
                  <div class="_1profile_main_all" v-if="authInfo.role==1">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop name</p>
                      <p class="_1profile_vbalue">: {{authInfo.name}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Username:</p>
                      <p class="_1profile_vbalue">: {{authInfo.username}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Category</p>
                      <p class="_1profile_vbalue" v-if="category" >: {{category.name}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Description</p>
                      <p class="_1profile_vbalue">: {{authInfo.shop_description}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Address</p>
                      <p class="_1profile_vbalue">: {{authInfo.address}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Shop Phone</p>
                      <p class="_1profile_vbalue">: {{authInfo.phone}}</p>
                    </div>
                    <!-- <div class="_1profile_main">
                      <p class="_1profile_label">Shop Subcategories</p>

                      <p v-for="(item,index) in subcategory" :key="index" class=""> {{item.subcategory.name}} {{index==subcategory.length-1?'':', '}}</p>
                    </div> -->
                  </div>
                  <!-- user details-->
                  <div class="_1profile_main_all" v-else-if="authInfo.role==2">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Name</p>
                      <p class="_1profile_vbalue">: {{authInfo.name}}</p>
                    </div>
                    <div class="_1profile_main">
                      <p class="_1profile_label">Username</p>
                      <p class="_1profile_vbalue">: {{authInfo.username}}</p>
                    </div>
                  </div>

                  <!-- email section -->
                  <p class="_1profile_subtitle _border_color">Email</p>
                  <div class="_1profile_main_all">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Email</p>
                      <p class="_1profile_vbalue">: {{authHiddenInfo.email}}</p>
                    </div>
                  </div>
                  <template v-if="authInfo.role==2">
                  <!-- account verify section -->
                  <p class="_1profile_subtitle _border_color">Account Verification Status</p>

                  <div class="_1profile_main_all">
                    <div class="_1profile_main">
                      <p class="_1profile_label">Stauts</p>
                        <p
                          class="_1profile_vbalue"
                          v-if="authInfo.verification_status==0"
                        >: Unverified</p>
                        <p
                          class="_1profile_vbalue"
                          v-else-if="authInfo.verification_status==1"
                        >: In Progress</p>
                        <p
                          class="_1profile_vbalue"
                          v-else-if="authInfo.verification_status==2"
                        >: Information Missing</p>
                        <p
                          class="_1profile_vbalue"
                          v-else-if="authInfo.verification_status==3"
                        >: Rejected</p>
                        <p
                          class="_1profile_vbalue"
                          v-else-if="authInfo.verification_status==4"
                        >: Verified</p>
                        <!-- >: Approved</p> -->
                      <!-- <br/> -->
                      <br>
                    </div>
                    <div class="_1profile_main" v-if="authInfo.message">
                      <p class="_1profile_label">Message:</p>
                      <p class="_1profile_vbalue">: {{authInfo.message}}</p>
                    </div>
                    <Button
                        v-if="authInfo.verification_status==0 || authInfo.verification_status==2 || authInfo.verification_status==3"
                        type="info"
                        @click="$router.push(`/user/kyc/form`)"
                      >Submit form</Button>
                  </div>
                  </template>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <div class="col-12 col-md-12"></div>
        </div>
        <!-- / .row -->
      </div>
    </div>
    <!-- / .main-content -->
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  data() {
    return {
      category: {},
      subcategory: {},
    };
  },
  async created() {
    if (this.authInfo.role == 1 && this.authInfo.shop_category_id) {
      // const res = await this.callApi(
      //   "get",
      //   `/getCategoryById/${this.authInfo.shop_category_id}`
      // );
      // if (res.status === 200) {
      //   this.category = res.data;
      // } else {
      //   this.swr();
      // }
      let [res1] = await Promise.all([
        this.callApi('get', `/getCategoryById/${this.authInfo.shop_category_id}`),
        // this.callApi('get', `/getStoreSubcategoriesById/${this.authInfo.id}`),
      ]);
      if (res1.status === 200) {
        this.category = res1.data;
      } else {
        this.swr();
      }
      // if (res2.status === 200) {
      //   this.subcategory = res2.data;
      //   console.log(res2.data)
      // } else {
      //   this.swr();
      // }
    }
  },
  methods: {
    formatDate(date) {
      var d = new Date(date),
        month = "" + (d.getMonth() + 1),
        day = "" + d.getDate(),
        year = d.getFullYear();

      if (month.length < 2) month = "0" + month;
      if (day.length < 2) day = "0" + day;
      // return day + "/" + month + "-" + year;
      return day + "/" + month;
      // return [day,month,year].join('-');
    },
    numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    },
  }
};
</script>

<style  scoped>
</style>
