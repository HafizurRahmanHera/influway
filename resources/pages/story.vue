<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <!-- <head-section :owner='owner'></head-section> -->
      </div>

      <!-- CONTENT -->
      <div class="container">
        <!-- Tab content -->
        <template v-if="custom_products.length">
          <div class="tab-content">
            <div class="tab-pane fade active show">
              <div class="row listAlias">
                <div
                  class="col-12 col-md-6 col-xl-4"
                  v-for="(product) in custom_products"
                  :key="product.id"
                >
                  <!-- Card -->
                  <div class="card">
                    <div class="lookbook_plus">
                      <div class="single_fashion _lookbook_card _po_rel">
                        <img
                          @click="showFModal(product)"
                          :src="product.image"
                          alt="product"
                          style="cursor: pointer;"
                        />
                        <ul class="post_img_link" style="cursor: pointer;">
                          <li
                            v-for="(item,index) in product.linkedProducts"
                            :key="index"
                            :style="{'left':item.x_cor+'%','top':item.y_cor+'%'}"
                          >
                            <span @click="showFModal(product)">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li>
                        </ul>

                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row align-items-center">
                        <div class="col">
                          <!-- Title -->
                          <h4 class="card-title mb-2 name">
                            <!-- <nuxt-link v-if="product.user" :to="`/lookbook/user/${product.user.username}`">
                              @{{product.user.name}}
                            </nuxt-link> -->
                            <nuxt-link v-if="product.user" :to="`/${product.user.username}`">
                              @{{product.user.name}}
                            </nuxt-link>
                          </h4>

                          <!-- Subtitle -->
                          <!-- <p class="card-text small text-muted">Updated 4hr ago</p> -->
                          <p class="card-text small text-muted">{{product.created_at}}</p>
                        </div>
                        <div class="col-auto">
                          <!-- Dropdown -->

                        </div>
                      </div>
                      <!-- / .row -->
                    </div>
                    <!-- / .card-body -->
                  </div>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <!-- / .tab-content -->
        </template>
        <template v-else>
          <div class="tab-content">
            <div class="tab-pane fade active show">
              <div class="row listAlias">
                <div class="col-12 col-md-12 col-xl-12">
                  <!-- Card -->
                  <div class="lookbook_plus">
                    <h3>No Lookbook</h3>
                  </div>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <!-- / .tab-content -->
        </template>

        <div class="profile-fill-more" v-if="custom_products.length>0">
          <!-- <hr /> -->
          <div class="text-center">
            <div class="pagination-padding">
              <Page
                :current="pagination.page"
                :total="pagination.total"
                @on-change="setPage($event)"
                :page-size="pagination.perPage"
              />
            </div>
          </div>
          <hr />
        </div>
      </div>

      <!-- <Modal v-model="modal6" title="Details" width="750px" :mask-closable="false"> -->
      <Modal v-model="modal6" title="Details" width="1000px" :mask-closable="false">
        <div class v-if="f_modal_product">
          <!-- Modal -->
          <div class="row justify-content-md-center">
            <div class="col-lg-12 col-md-12 col-sm-10">
              <div class="post_main_area">
                <div class="row no-gutters">
                  <!-- Left -->
                  <div class="col-12 col-md-6 col-lg-7">
                    <div class="_modal_img">
                      <div class="_po_rel">
                        <img @click="someMethod" :src="f_modal_product.image" alt="product" />
                        <ul class="post_img_link">
                          <li
                            v-for="(item,index) in f_modal_product.linkedProducts"
                            :key="index"
                            :style="{'left':item.x_cor+'%','top':item.y_cor+2+'%'}"
                          >
                            <span style="cursor:pointer" @click="showSModal(item.product)">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li>
                        </ul>
                      </div>
                      <template v-if="sModal">
                        <div class="post_img_effect post_img_effect1">
                          <div class="post_img_effect_pic">
                            <img :src="s_modal_product.productImages[0].image" alt="product" />
                          </div>
                          <h3 class="post_img_effect_title">{{s_modal_product.title}}</h3>
                          <p class="post_img_effect_price">${{s_modal_product.price}}</p>
                          <div class="post_img_effect_btm _border_color">
                            <!-- <Button @click="$router.push(`/product_details/${s_modal_product.id}`)">Details</Button> -->
                            <Button @click="productDetailsPage(s_modal_product.id)">Details</Button>
                          </div>
                          <span
                            @click="sModalCheck"
                            class="cross_modal"
                            style="color: black;height: 20px;width: 20px;"
                          >
                            <i class="fas fa-times cross_modal"></i>
                          </span>
                        </div>
                      </template>
                    </div>
                  </div>
                  <!-- Left -->

                  <!-- Right -->
                  <div class="col-12 col-md-6 col-lg">
                    <div class="_1comment _modal_comment">
                      <div class="_border_color _all_comment _flex_space">
                        <!-- Items -->
                        <div class="_1comment_list _border_color" style="display:flex" v-for="comment in f_modal_product.comments"
                          :key="comment.id">
                          <div class="_1comment_list_left">
                            <img v-if="comment.user.image"
                              :src="comment.user.image" alt="user pic" class="image-one" />
                          </div>
                          <div class="_1comment_list_right">
                            <div class="_1comment_all">
                                 <h3 class="_1comment_list_right_text _title _cursor">{{comment.user.name}}</h3>

                              </div>
                              <p class="_1comment_list_right_text_p_one">{{comment.created_at}}</p>
                              <p class="_1comment_list_right_text_p_two">{{comment.text}}</p>

                          </div>
                        </div>
                        <!-- Items -->
                      </div>

                      <!-- Textarea -->
                      <div class="_1comment_textarea _border_color">
                        <div class="row">
                          <div class="col-auto">
                            <!-- Avatar -->
                            <div class="avatar avatar-sm">
                              <img
                                v-if="authInfo.image"
                                :src="authInfo.image"
                                :alt="authInfo.name"
                                class="avatar-img rounded-circle"
                              />
                              <img
                                v-else
                                src="/images/default.jpg"
                                :alt="authInfo.name"
                                class="avatar-img rounded-circle"
                              />
                            </div>
                          </div>
                          <div class="col ml-n2">
                            <!-- Input -->
                            <form class="mt-1">
                              <label class="sr-only">Leave a comment...</label>
                              <textarea
                                class="form-control form-control-flush"
                                data-toggle="autosize"
                                rows="2"
                                placeholder="Leave a comment"
                                v-model="comment_text"
                              ></textarea>
                            </form>
                          </div>
                          <div class="col-auto align-self-end">
                            <!-- Icons -->
                            <div class="text-muted mb-2">
                              <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Add photo">
                                <i class="fe fe-camera"></i>
                              </a>-->
                              <button
                                v-if="!loading"
                                @click="commentText(f_modal_product.feed_id)"
                                type="button"
                                class="conmment_send"
                              >
                                <!-- <i class="fas fa-caret-right"></i> -->
                                <i class="fas fa-paper-plane"></i>
                              </button>
                              <Button v-if=" loading" loading shape="circle" type="primary"></Button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- Textarea -->
                    </div>
                  </div>
                  <!-- Right -->
                </div>
              </div>
            </div>
          </div>
          <!-- Modal -->
        </div>
      </Modal>
    </div>
    <!-- / .main-content -->
  </no-ssr>
</template>

<script>
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["influencer"],

  data() {
    return {
      // custom_products: [],
      fModal: false,
      f_modal_product: null,
      s_modal_product: null,
      sModal: false,
      num: 3,
      left: "10px",
      top: "10px",
      img_cordinate: [
        { x_cor: 157, y_cor: 75 },
        { x_cor: 120, y_cor: 284 },
        { x_cor: 140, y_cor: 417 }
      ],
      comment_text: "",
      loading: false,
      modal6: false,
      pagination: {},
      page: 1
    };
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([
        app.$axios.get(`/getUserFollowingCustomProducts`),
      ]);
      // console.log(data)
      // if (res2 && res2.data && (res2.data.role==1 || res2.data.role==5)) {
      //   redirect('/')
      // }
      return {
        custom_products: res1.data.data,
        pagination: res1.data,
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  methods: {
    someMethod(event) {},

    sModalCheck() {
      // console.log('fModalCheck')
      this.sModal = false;
    },

    showFModal(product) {
      this.f_modal_product = product;
      // this.fModal = true;
      this.sModal = false;
      this.modal6 = true;
      // console.log(product);
      // this.sModal=false
    },
    async showSModal(product) {
      // this.showPointProduct = true
      // const res = await this.callApi('get', `/getPointProduct/${pro_id}`)
      // if(res.status===200){
      //   this.point_product = res.data
      //   // console.log(this.point_product)
      //   // this.loading = false
      // } else{
      //     this.swr()
      //     // this.loading = false
      // }
      this.s_modal_product = product;
      this.sModal = true;
    },

    async commentText(feed_id) {
      if (this.comment_text == "") {
        return;
      }
      if (this.comment_text.length>3000) {
        this.wr('Comment character limit is 3,000, your comment is '+this.comment_text.length+' character long!')
        return;
      }
      // console.log("feed_id= " + feed_id);
      // console.log(this.comment_text);
      if (feed_id == 0) {
        this.e("This item was not added on feed page !");
        this.comment_text = "";
        return;
      }
      // return
      this.loading=true

      const res = await this.callApi("post", "/postComment", {
        feed_id: feed_id,
        text: this.comment_text
      });
      if (res.status === 200) {
        this.s("Comment posted Successfully !");
        // console.log(res);
        // this.$router.push(`/product_details/${res.data.id}`);
      } else {
        this.swr();
        this.loading=false
        return;
      }

      let today = new Date();
      let date =
        today.getFullYear() +
        "-" +
        (today.getMonth() + 1) +
        "-" +
        today.getDate();
      let time =
        today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

      let item = {
        id: this.f_modal_product.comments.length + 1,
        text: this.comment_text,
        created_at: date + " " + time,
        user: {
          name: this.authInfo.name,
          username: this.authInfo.username,
          image: this.authInfo.image
        }
      };
      this.f_modal_product.comments.push(item);

      this.comment_text = "";
      this.loading=false
    },

    productDetailsPage(pro_id) {
      // this.sModal = false;
      this.modal6 = false;
      this.$router.push(`/product_details/${pro_id}`);
    },

    setPage(index) {
      this.page = index;
      this.pageniateAllCustomProducts();
    },
    async pageniateAllCustomProducts() {
      const res = await this.callApi(
        "get",
        `/getUserFollowingCustomProducts?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0,0);
        this.custom_products = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    }
  }
};
</script>


<style scoped>

/* letf is x, top is y */
/* Hafiz code */
.post_img_link li span {
  background-color: #ea38d3;
  color: #fff;
  height: 20px;
  width: 20px;

  line-height: 20px;
  border-radius: 50%;
  text-align: center;
  display: inline-block;
  font-size: 13px;
  box-shadow: 0px 0px 4px 1px #ea38d3;
}

.lookbook_main_area.cross {
  height: 100vh;
  position: fixed;
}
.ivu-btn-primary {
		color: #fff;
		background-color: #28b9b9;
		border-color: #28b9b9;
	}
</style>

