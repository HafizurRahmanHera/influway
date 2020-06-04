<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header">
      </div>
      <div class="container">
        <div class="row">
          <!-- Left Section -->
          <div class="col-md-12">
            <div class="card _border_radious _mar_b20 _padd25">
              <h3 class="creat_section_h3">Create Collage</h3>
              <div class="row">
                <div class="col-md-12">
                  <div class="create_tools_area _mar_b20">
                    <div class="create_btn">
                      <p>Click a product from right side to add on board</p>
                    </div>
                  </div>
                </div>

                <div class="col-12 col-md-12 col-lg-auto">
                  <div class>
                    <div
                      class
                      style="width:550px;min-height:230px;max-height:460px;     border: 1px solid #dddd;"
                    >
                      <!-- <div style=" background-color:gray" > -->
                      <grid-layout
                        :layout.sync="linked_pro"
                        :col-num="6"
                        :row-height="15"
                        :is-draggable="true"
                        :is-resizable="true"
                        :is-mirrored="false"
                        :vertical-compact="true"
                        :margin="[10, 10]"
                        :use-css-transforms="true"
                      >
                        <grid-item
                          v-for="(item,index) in linked_pro"
                          :key="item.i"
                          :x="item.x"
                          :y="item.y"
                          :w="item.w"
                          :h="item.h"
                          :i="item.i"
                        >
                          <!-- <div class="_pic"> -->

                          <template v-if="is_remove_linked_pro">
                            <img
                              :src="item.image"
                              :style="{'width':'100%','height':'100%'}"
                              @click="gridImgClicked(index)"
                            />
                          </template>
                          <template v-else>
                            <img :src="item.image" :style="{'width':'100%','height':'100%'}" />
                          </template>
                          <!-- <p class="_pic_close"><i class="fas fa-times"></i></p> -->
                          <!-- </div> -->
                        </grid-item>
                      </grid-layout>
                    </div>
                  </div>

                  <div class="_input_button _btn_pro">
                    <template v-if="is_remove_linked_pro">
                      <button class="border_btn" @click="cancelRemove">Cancel</button>
                    </template>

                    <template v-else>
                      <button class="btn btn-primary lift" @click="removeImage" type="button">Remove image</button>
                      <button :disabled="loading" class="btn btn-primary lift" @click="createCollageLinks" type="button">Create</button>
                      <button class="btn btn-default lift" @click="reset" type="button">Reset</button>
                    </template>
                  </div>
                </div>

                <!-- start: show products -->
                <div class="col-12 col-md-12 col-lg">
                  <div class="create_right">
                    <div class="creat_input_main only_ipad">
                      <Input v-model="search" @on-enter="searchPorduct" placeholder="Search">
                        <Icon @click="searchPorduct" type="ios-search" slot="suffix" />
                      </Input>
                    </div>

                    <div class="_1look_images">
                      <template v-if="products.length">
                        <div class="row" v-if="products">
                          <div
                            class="col-6 col-md-4 col-lg-4 _mar_b30"
                            v-for="(pro,index) in products"
                            :key="index"
                          >
                            <div class="_5card_img">
                              <template v-if="pro.productImages.length">
                                <img
                                  style="cursor:pointer"
                                  @click="proImgClicked(pro)"
                                  :src="pro.productImages[0].image"
                                  alt="product"
                                />
                              </template>
                            </div>
                          </div>
                        </div>
                      </template>
                      <template v-else>
                        <p>No product found</p>
                      </template>
                    </div>
                  </div>
                </div>
                <!-- end: show products -->
              </div>
            </div>
          </div>
          <!-- Left Section -->
        </div>
      </div>
    </div>
  </no-ssr>
</template>


<script>
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["influencer"],
  async asyncData({ app, store, redirect, params }) {
    try {
      let { data } = await app.$axios.get(`/getProducts`);
      // console.log(data)
      return {
        products: data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      loading: false,
      layout2: [
        // { x: 0, y: 2, w: 2, h: 6, i: "1", image: "/products_image/pant.jpg" },
        // { x: 1, y: 4, w: 2, h: 6, i: "2", image: "/products_image/pant2.jpg" },
        // { x: 2, y: 6, w: 2, h: 6, i: "3", image: "/products_image/pant3.jpg" },
        // { x: 2, y: 8, w: 2, h: 6, i: "4", image: "/products_image/pant4.jpg" },
        // { x: 2, y: 10, w: 2, h: 6, i: "5", image: "/products_image/pant5.jpg" },
        // { x: 2, y: 12, w: 2, h: 6, i: "6", image: "/products_image/pant6.jpg" }
      ],
      search: "",
      linked_pro: [],
      is_remove_linked_pro: false,
      remove_linked_pro: null
    };
  },
  methods: {
    gridImgClicked(index) {
      this.linked_pro.splice(index, 1);
      this.is_remove_linked_pro = false;
    },

    proImgClicked(product) {
      if (this.is_remove_linked_pro == true) {
        this.in("Click an image from board to remove");
        return;
      }
      // this.s("img= "+index)
      // console.log(product);

      let pro_exist = false;
      this.linked_pro.filter(pro => {
        // console.log(pro.por_id)
        if (pro.i == product.id) {
          this.wr("Product already added on board");
          pro_exist = true;
          return;
        }
      });
      if (pro_exist == true) {
        return;
      }

      let x_val = 0;
      if (this.linked_pro.length > 2 && this.linked_pro.length <= 5) {
        // console.log(">2");
        x_val = 2;
      } else if (this.linked_pro.length > 5) {
        // console.log(">4");
        x_val = 4;
      }

      let item = {
        x: x_val,
        y: 0,
        w: 2,
        h: 6,
        i: product.id,
        image: product.productImages[0].image
      };
      this.linked_pro.push(item);
      this.s("Product added to board");
      // console.log(this.linked_pro);
      // console.log(this.linked_pro.length);
    },

    removeImage() {
      this.is_remove_linked_pro = true;
      this.in("Click an image from board to remove");
    },

    reset() {
      this.linked_pro.splice(0, this.linked_pro.length);
      // this.s('Board is clear')
    },

    cancelRemove() {
      this.is_remove_linked_pro = false;
    },

    async searchPorduct() {
      // console.log(this.search)
      if (this.search == "") {
        const res = await this.callApi("get", "/getProducts");
        this.products = res.data;
        return;
      } else if (this.search.length < 3) {
        this.wr("Type minimum 3 character");
        return;
      }
      const res = await this.callApi("post", "/searchProducts", {
        search: this.search
      });
      // console.log(res);
      if (res.status === 200) {
        this.products = res.data;
        // console.log(res.data);
        // this.loading = false
      } else {
        this.swr();
        // this.loading = false
      }
    },

    async createCollageLinks() {
      // console.log("create collage");
      // console.log(this.linked_pro);
      this.loading= true

      if (!this.linked_pro.length) {
        this.e("No product added");
        this.loading= false
        return;
      }
      let ok = true;
      this.linked_pro.forEach(element => {
        let l = element.y + element.h;
        if (l > 18) {
          ok = false;
          return;
        }
      });
      if (!ok) {
        this.e("All Products must be inside the board");
        this.loading= false
        return;
      }
      // return
      const res = await this.callApi("post", "/createCollageLinks", {
        collage_product_links: this.linked_pro
      });
      // console.log(res);
      if (res.status === 200) {
        // this.products = res.data
        // console.log(res);
        this.s("Collage created successfully!");
        if (res.data.token_value) {
          this.$store.dispatch('updateUserReceivedTokens', res.data.token_value)
          this.s("You have received "+res.data.token_value + " tokens");
        }else{
          this.wr("To get token you have to verify your account!");
        }
        this.$router.push("/collage");
        this.loading = false
      } else {
        this.swr();
        this.loading = false
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

.create_content {
  margin: 0px;
}
</style>
