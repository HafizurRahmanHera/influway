<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <head-section></head-section>
      </div>

      <!-- CONTENT -->
      <div class="container">
        <template v-if="collage_products.length">
          <!-- Tab content -->
          <div class="tab-content">
            <div class="tab-pane fade active show">
              <div class="row listAlias">
                <div
                  class="col-12 col-md-12 col-xl-6"
                  v-for="(product,index) in collage_products"
                  :key="product.id"
                >
                  <!-- Card -->
                  <div class="card">
                    <div class="_collage">
                      <div class="row">
                        <div class="col-12 col-md-12 col-lg-12">
                          <!-- <div class="_box_shadow _border_radious _mar_b20 _padd15"> -->
                          <!-- <div style="background-color:##eae4e4;border:1px solid black"> -->
                          <grid-layout
                            style="cursor:pointer"
                            :layout.sync="product.linkedProducts"
                            :col-num="6"
                            :row-height="15"
                            :is-draggable="false"
                            :is-resizable="false"
                            :is-mirrored="false"
                            :vertical-compact="true"
                            :margin="[10, 10]"
                            :use-css-transforms="true"
                          >
                            <grid-item
                              v-for="(item) in product.linkedProducts"
                              :key="item.i"
                              :x="item.x"
                              :y="item.y"
                              :w="item.w"
                              :h="item.h"
                              :i="item.i"
                            >
                              <img
                                :src="item.product.productImages[0].image"
                                style="width:100%;height:100%;"
                                @click="$router.push(`/collage/details/${product.id}`)"
                              />
                            </grid-item>
                          </grid-layout>
                          <!-- </div> -->
                          <!-- <br /> -->
                          <!-- </div> -->
                        </div>
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
                          <p class="card-text small text-muted">{{product.created_at | myDate}}</p>
                        </div>
                        <div class="col-auto">
                          <!-- Dropdown -->
                          <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
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
                            <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                              <!-- <a href="#!" class="dropdown-item">Action</a> -->
                              <nuxt-link
                                :to="`/collage_edit/${product.id}`"
                                class="dropdown-item"
                              >Edit</nuxt-link>
                              <!-- <a href="#!" class="dropdown-item">Another action</a> -->
                              <button
                                @click="confirmDelete(product.id,index)"
                                class="dropdown-item"
                              >Delete</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- / .row -->

                      <!-- Divider -->
                    </div>
                  </div>
                  <!-- / .card-body -->
                </div>
              </div>
            </div>
            <!-- / .row -->
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
                    <h3>No Collage</h3>
                  </div>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <!-- / .tab-content -->
        </template>
        <div class="profile-fill-more" v-if="collage_products.length>0">
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
    </div>
    <!-- / .main-content -->
  </no-ssr>
</template>

<script>
import HeadSection from "~/components/ItemUserHeadSection.vue";
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["influencer"],
  components: {
    HeadSection
  },
  data() {
    return {
      pagination: {},
      page: 1,
      selected_index:-1
    };
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let { data } = await app.$axios.get(`/getUserCollageProducts`);
      // console.log(data)
      // if (!data) {
      //   redirect('/retail')
      // }
      return {
        collage_products: data.data,
        pagination: data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  methods: {
    confirmDelete(id, index) {
      this.$Modal.confirm({
        title: "Delete collage",
        content: "<p>Confirm to delete collage</p>",
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
      const res = await this.callApi("post", "/deleteCollageProduct", {
        id: id
      });
      if (res.status === 200) {
        this.collage_products.splice(index, 1);
        this.s("Collage deleted...");
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

    setPage(index) {
      this.page = index;
      this.pageniateAllCollageProducts();
    },
    async pageniateAllCollageProducts() {
      const res = await this.callApi(
        "get",
        `/getUserCollageProducts/?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.collage_products = res.data.data;
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
  .post_img {
    min-width: 290px;
  }

  .post_img img {
    width: 290px;
    height: 450px;
  }

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
</style>

