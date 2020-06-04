<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <userhead-section v-if="owner.id==authInfo.id"></userhead-section>
        <ownerhead-section v-else :owner="owner"></ownerhead-section>
        <!-- <head-section></head-section> -->
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
                  v-for="(product,index) in custom_products"
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
                        <!-- <div class="_5card_edit">
                          <div class="_5card_button _eidt"></div>
                          <div class="_5card_button _delete"></div>
                        </div>-->
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="row align-items-center">
                        <div class="col">
                          <!-- Title -->
                          <!-- <h4 class="card-title mb-2 name">
                            <a href="project-overview.html">Homepage Redesign</a>
                          </h4>-->

                          <!-- Subtitle -->
                          <!-- <p class="card-text small text-muted">Updated 4hr ago</p> -->
                          <p class="card-text small text-muted">{{product.created_at | myDate}}</p>
                        </div>
                        <div class="col-auto" v-if="owner.id==authInfo.id">
                          <!-- Dropdown -->
                          <div
                            class="dropdown _cursor"
                            :class="{'show':selected_index==index}"
                            @click="selected_index=index"
                          >
                            <!-- <a -->
                            <div
                              class="dropdown-ellipses dropdown-toggle"
                              role="button"
                              data-toggle="dropdown"
                              aria-haspopup="true"
                              :aria-expanded="selected_index==index"
                            >
                              <i class="fas fa-ellipsis-v"></i>
                            </div>
                            <!-- </a> -->
                            <div
                              class="dropdown-menu dropdown-menu-right"
                              :class="{'show':selected_index==index}"
                            >
                              <nuxt-link
                                :to="`/lookbook_edit/${product.id}`"
                                class="dropdown-item"
                              >Edit</nuxt-link>
                              <button
                                @click="confirmDelete(product.id,index)"
                                class="dropdown-item"
                              >Delete</button>
                            </div>
                          </div>
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
      <Modal v-model="modal6" title="Details" width="1000px" :mask-closable="false" :footer-hide="true">
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
                      <div class="_border_color _all_comment _flex_space img_cmnt">
                        <!-- Items -->
                        <div
                          class="_1comment_list _border_color"
                          style="display:flex"
                          v-for="comment in f_modal_product.comments"
                          :key="comment.id"
                        >
                          <div class="_1comment_list_left">
                            <!-- <div v-if="comment.user" class="avatar avatar-sm _cursor" @click="modal6=false, comment.user.role==2? $router.push(`/lookbook/user/${comment.user.username}`) : $router.push(`/store/${comment.user.username}`) "> -->
                            <div v-if="comment.user" class="avatar avatar-sm _cursor" @click="modal6=false, comment.user.role==2? $router.push(`/${comment.user.username}`) : $router.push(`/store/${comment.user.username}`) ">
                            <img
                              v-if="comment.user.image"
                              :src="comment.user.image"
                              alt="user pic"
                              class="image-one"
                            />
                            <img
                              v-else
                              src="/images/default.jpg"
                              alt="user_pic"
                              class="image-one"
                            />
                            <div v-if="comment.user.verification_status==4" class="_active"><i class="fas fa-check"></i></div>
                            </div>
                            <!-- </nuxt-link> -->
                          </div>
                          <div class="_1comment_list_right">
                            <div class="_1comment_all">
                              <h3
                                class="_1comment_list_right_text _title"
                              >{{comment.user.name}}</h3>
                              <p
                                class="_1comment_list_right_text_p_one"
                              >{{comment.created_at | myDate}}</p>
                            </div>
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
import UserheadSection from "~/components/ItemUserHeadSection.vue";
import OwnerheadSection from "~/components/ItemOwnerHeadSectionWithProps.vue";
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["authenticated"],
  components: {
    UserheadSection,
    OwnerheadSection,
  },
  data() {
    return {
      // custom_products: [],
      fModal: false,
      f_modal_product: null,
      s_modal_product: null,
      num: 3,
      left: "10px",
      top: "10px",
      img_cordinate: [
        { x_cor: 157, y_cor: 75 },
        { x_cor: 120, y_cor: 284 },
        { x_cor: 140, y_cor: 417 }
      ],
      showPointProduct: false,
      point_product: null,

      show_user_img_box: true,
      show_user_img_uploaded_preview_box: false,
      show_user_img_upload_box: false,
      show_user_img_submit_cancel_box: false,
      uploaded_user_img_path: "",

      comment_text: "",

      loading: false,
      pagination: {},
      page: 1,
      modal6: false,
      sModal: false,
      selected_index: -1
    };
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      // let { data } = await app.$axios.get(`/getUserCustomProducts`);
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getUserCustomProductsById/${params.username}`),
        app.$axios.get(`/getOwnerProfileById/${params.username}`)
      ]);
      // console.log(res2.data)
      if (!res2.data) {
        redirect("/");
      }
      else if (res2.data && (res2.data.role == 1 || res2.data.role == 5)){
        redirect("/");
      }

      return {
        // custom_products: data.data,
        // pagination: data
        custom_products: res1.data.data,
        pagination: res1.data,
        owner: res2.data
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
      // this.showPointProduct = false
    },

    showFModal(product) {
      this.f_modal_product = product;
      // this.fModal = true;
      this.sModal = false;
      this.modal6 = true;
      // console.log(product);
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

    confirmDelete(id, index) {
      this.$Modal.confirm({
        title: "Delete lookbook",
        content: "<p>Confirm to delete lookbook</p>",
        onOk: () => {
          // this.$Message.info('Clicked ok');
          // console.log('ok')
          this.deleteProduct(id, index);
          return;
        },
        onCancel: () => {
          // this.$Message.info('Clicked cancel');
          // console.log('cancel')
        }
      });
    },

    async deleteProduct(id, index) {
      // console.log('delete pro')
      // console.log(id)
      // return
      const res = await this.callApi("post", "/deleteCustomProduct", {
        id: id
      });
      if (res.status === 200) {
        this.custom_products.splice(index, 1);
        this.s("Lookbook deleted...");
        if (res.data.token_value) {
          this.$store.dispatch(
            "updateUserDeductedTokens",
            res.data.token_value
          );
          this.in(res.data.token_value + " tokens is deducted!");
        }
        // this.$router.go(0)

        // window.location.href = '/login'
      } else {
        // console.log(res);
        this.swr();
      }
      return;
    },

    async commentText(feed_id) {
      if (this.comment_text == "") {
        return;
      }
      if (this.comment_text.length > 3000) {
        this.wr(
          "Comment character limit is 3,000, your comment is " +
            this.comment_text.length +
            " character long!"
        );
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
      this.loading = true;

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
        this.loading = false;
        return;
      }

      res.data.user = {
        name: this.authInfo.name,
        username: this.authInfo.username,
        verification_status: this.authInfo.verification_status,
        role: this.authInfo.role,
        image: this.authInfo.image
      };
      this.f_modal_product.comments.push(res.data);

      this.comment_text = "";
      this.loading = false;
    },

    productDetailsPage(pro_id) {
      // this.sModal = false;
      this.modal6 = false;
      this.$router.push(`/product_details/${pro_id}`);

      // this.fModal = true;
      // this.sModal=false

      // this.f_modal_product = null;
      // this.s_modal_product = null;
      // return
    },

    setPage(index) {
      this.page = index;
      this.pageniateAllCustomProducts();
    },
    async pageniateAllCustomProducts() {
      const res = await this.callApi(
        "get",
        `/getUserCustomProducts/?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
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

  /* ._po_rel{
        position: unset
      } */
</style>

