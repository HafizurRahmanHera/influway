<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <head-section :owner='owner'></head-section>
      </div>

      <!-- CONTENT -->
      <div class="container">
        <template v-if="collage_products.length">
          <!-- Tab content -->
          <div class="tab-content">
            <div class="tab-pane fade active show">
              <div class="row listAlias">
                <div
                  class="col-12 col-md-6 col-xl-6"
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
import HeadSection from '~/components/ItemOwnerHeadSectionWithProps.vue'
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["authenticated"],
  components:{
    HeadSection
  },
  data() {
    return {
      pagination: {},
      page: 1
    };
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getUserCollageProductsById/${params.username}`),
        app.$axios.get(`/getOwnerProfileById/${params.username}`)
      ]);
      // console.log(data)
      // if (!data) {
      //   redirect('/retail')
      // }
      return {
        collage_products: res1.data.data,
        pagination: res1.data,
        owner: res2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  async created() {},
  methods: {
    setPage(index) {
      this.page = index;
      this.pageniateAllCollageProducts();
    },
    async pageniateAllCollageProducts() {
      const res = await this.callApi(
        "get",
        `/getUserCollageProductsById/${this.$route.params.username}?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0,0);
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

