<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header">
      </div>
      <div class="container">
        <div class="row">
          <!-- Left Section -->
          <div class="col-12 col-md-12 col-lg-12">
            <div class="card _border_radious _mar_b20 _padd25">
              <h3 class="creat_section_h3">Edit Lookbook</h3>
              <div class="row">
                <div class="col-12 col-md-6 col-lg-5">
                  <!-- test div -->
                  <template v-if="form.custom_product_image">
                    <div class="create_left">
                      <div class="post_img _po_rel">
                        <img @click="createPoint" :src="form.custom_product_image" alt="product" />
                        <ul class="post_img_link">
                          <li
                            v-for="(item,index) in img_cordinate"
                            :key="index"
                            :style="{'left':item.x+'%','top':item.y+'%'}"
                          >
                            <span @click="pointClick(item.id)">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li>
                        </ul>
                      </div>
                      <div class="_input_button _btn_pro">
                        <template v-if="is_remove_point">
                          <button class="_2btn" @click="cancelRemovePoint">Cancel</button>
                        </template>

                        <template v-else>
                          <button class="btn btn-primary lift" @click="removePoint" type="button">Remove a point</button>
                          <button :disabled="loading"
                            class="btn btn-primary lift"
                            @click="updateCustomProductLinks"
                            type="button"
                          >Update</button>
                          <button class="btn btn-default lift" @click="cancelUpdate" type="button">Cancel</button>
                        </template>
                      </div>
                    </div>
                  </template>
                  <!-- upload image -->

                  <!-- show linked image modal -->
                  <Modal title="View Image" v-model="visible">
                    <img :src="imgURL" v-if="visible" style="width: 100%" />
                  </Modal>
                </div>

                <!-- start: show products -->
                <div class="col-12 col-md-6 col-lg">
                  <div class="create_right">
                    <div class="creat_input_main">
                      <Input v-model="search" @on-enter="searchPorduct" placeholder="Search">
                        <Icon @click="searchPorduct" type="ios-search" slot="suffix" />
                      </Input>
                    </div>

                    <div class="_1look_images">
                      <template v-if="products.length">
                        <div class="row" v-if="products">
                          <!-- Item -->
                          <div
                            class="col-6 col-md-6 col-lg-4 _mar_b30"
                            v-for="(pro,index) in products"
                            :key="index"
                          >
                            <div class="_5card_img">
                              <template v-if="pro.productImages.length">
                                <img
                                  @click="proImgClicked(pro)"
                                  :src="pro.productImages[0].image"
                                  alt="product"
                                />
                              </template>
                            </div>
                          </div>
                          <!-- Item -->
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
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getProducts`),
        app.$axios.get(`/getUserCustomProduct/${params.id}`)
      ]);
      if (!res2.data) {
        // redirect("/lookbook");
        redirect("/");
      }
      // console.log(data)
      return {
        products: res1.data,
        custom_product: res2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      generate_cor_id: 0,
      point_created: false,
      point_clicked: false,
      point_clicked_id: null,
      product_clicked: false,
      pro_img: [
        { pic: "/images/pant.jpg", name: "pant", id: 1 },
        { pic: "/images/shoe.jpg", name: "shoe", id: 2 },
        { pic: "/images/man_cote.jpg", name: "cote", id: 3 }
      ],
      img_cordinate: [
        // { x: 30, y: 10 , item: `<a href="#"><i class="fas fa-plus"></i></a>`},
        // { x: 35, y: 54, item:`<a href="#"><i class="fas fa-plus"></i></a>` },
        // { x: 50, y: 37, item:`<a href="#"><i class="fas fa-plus"></i></a>` },
        // { x: 122, y: 244, item:`<a href="#"><i class="fas fa-plus"></i></a>` },
      ],
      linked_pro: [
        // { x: 30, y: 10 , item_name: 'pant'},
      ],
      form: {
        custom_product_image: null,
        custom_product_id: null
      },
      search: "",
      showPointProduct: false,
      point_product_image: null,
      custom_product_image_create: null,

      imgURL: "",
      visible: false,
      is_remove_point: false,
      loading: false,
    };
  },
  created() {
    this.form.custom_product_id = this.custom_product.id;
    this.form.custom_product_image = this.custom_product.image;

    this.custom_product.linkedProducts.forEach(items => {
      // console.log(items);
      let item = {
        id: this.generate_cor_id,
        x: 0,
        y: 0,
        image: "",
        product_id: null
      };
      this.generate_cor_id++;
      item.x = items.x_cor;
      item.y = items.y_cor;
      item.image = items.product.productImages[0].image;
      item.product_id = items.product.id;
      this.img_cordinate.push(item);
    });
    // console.log(this.img_cordinate)

    this.img_cordinate.forEach(items => {
      let item = {
        x: 0,
        y: 0,
        por_id: null,
        por_image: "",
        cor_id: null
      };

      item.x = items.x;
      item.y = items.y;
      item.por_id = items.product_id;
      item.por_image = items.image;
      item.cor_id = items.id;
      this.linked_pro.push(item);
    });
    // console.log(this.linked_pro)
  },
  methods: {
    createPoint(event) {
      if (this.is_remove_point) {
        return;
      }
      // this.s("x=" + event.offsetX + " y=" + event.offsetY);
      if (this.point_created == true) {
        this.s("Click the plus point then a product to link");
        return;
      }
      this.s("Click the plus point then a product to link");

      let item = {
        id: this.generate_cor_id,
        x: 0,
        y: 0
      };
      this.generate_cor_id++;
      // item.x = event.offsetX - 5;
      // item.y = event.offsetY - 5;
      item.x = (((event.offsetX-15)*100)/event.target.width).toFixed(2)
      item.y = (((event.offsetY-12)*100)/event.target.height).toFixed(2)
      this.img_cordinate.push(item);
      this.point_created = true;
      this.point_clicked = false;

      // console.log(this.img_cordinate);
    },

    async pointClick(id) {
      let tem_linked_product = [];
      if (this.is_remove_point) {
        this.linked_pro.filter((pro, index) => {
          // console.log(pro.por_id)
          if (pro.cor_id == id) {
            this.linked_pro.splice(index, 1);
          }
        });
        this.img_cordinate.filter((item, index) => {
          // console.log(pro.por_id)
          if (item.id == id) {
            this.img_cordinate.splice(index, 1);
          }
        });
        this.s("Point removed");
        this.is_remove_point = false;
        this.point_created = false;
        this.point_clicked = false;
        return;
      }

      // console.log("linked_pro");
      // console.log(this.linked_pro);
      // console.log('tem_linked')
      // console.log(tem_linked_product)

      let pro_exist = false;
      let product_id = null;
      this.linked_pro.filter(pro => {
        // console.log(pro.por_id)
        if (pro.cor_id == id) {
          // this.s("pro_id " + pro.por_id + " is linked");
          // console.log(pro.por_id);
          product_id = pro.por_id;
          // this.point_product_image=pro.por_image
          // this.showPointProduct = true
          this.imgURL = pro.por_image;
          this.visible = true;
          pro_exist = true;
          // console.log(this.linked_pro);
          return;
        }
        // console.log(pro);
        // this.s(number.x)
      });

      if (pro_exist == true) {
        // this.s("click a point in the image");
        // const res = await this.callApi('get', `/getPointProduct/${product_id}`)
        // if(res.status===200){
        //   this.point_product_= res.data
        //   console.log(this.point_product_
        //   // this.loading = false
        // } else{
        //     this.swr()
        //     // this.loading = false
        // }
        // this.showPointProduct = true
        return;
      } else if (this.point_created == false) {
        this.s("Click a point in the image");
        return;
      } else if (this.point_clicked == true) {
        this.s("Click a product to link");
        return;
      }

      this.point_clicked = true;
      this.point_clicked_id = id;
      this.s("Click a product to link");
      // console.log(id);
      // this.s("i= " + id);
    },
    proImgClicked(product) {
      // this.s("img cicked")
      // console.log("img cicked");
      // console.log(product);
      if (this.is_remove_point) {
        return;
      }

      if (this.point_clicked == false) {
        this.s("Click the plus point");
        // console.log(this.linked_pro);
        return;
      }
      // console.log(this.img_cordinate);
      // this.s(title);

      let img_cor_index = null;

      this.img_cordinate.filter((pro, index) => {
        // console.log(pro.por_id)
        if (pro.id == this.point_clicked_id) {
          img_cor_index = index;
          return;
        }
      });

      let item = {
        x: 0,
        y: 0,
        por_id: "",
        por_image: "",
        cor_id: ""
      };
      (item.x = this.img_cordinate[img_cor_index].x),
        (item.y = this.img_cordinate[img_cor_index].y),
        (item.por_id = product.id),
        (item.por_image = product.productImages[0].image),
        (item.cor_id = this.generate_cor_id - 1);

      this.linked_pro.push(item);
      this.s(product.title + " is linked");
      // console.log(product.title + " is linked");
      // console.log(this.linked_pro);
      this.point_created = false;
      this.point_clicked = false;
    },

    cancelUpdate() {
      this.$router.go(0);
      // this.form.custom_product_image = null;
      // this.custom_product_image_create=null;
      // this.img_cordinate.splice(0,this.img_cordinate.length);
      // this.linked_pro.splice(0,this.linked_pro.length);
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

    async updateCustomProductLinks() {
      // console.log("update");
      // console.log(this.linked_pro);
      this.loading= true
      if (!this.linked_pro.length) {
        this.e("No product linked");
        this.loading= false
        return;
      }
      // console.log('custom_pro_id')
      // console.log(this.$route.params.id)

      // return
      const res = await this.callApi("post", "/updateCustomProductLinks", {
        custom_product_links: this.linked_pro,
        custom_product_id: this.$route.params.id
      });
      // console.log(res)
      if (res.status === 200) {
        // this.products = res.data
        // console.log(res);
        this.s("Product link updated");
        // this.$router.push("/lookbook");
        this.$router.push(`/${this.authInfo.username}`);
        // this.cancelUpdate()
        this.loading = false
      } else {
        this.swr();
        this.loading = false
      }
    },

    removePoint() {
      this.wr("Click a plus point to remove");
      this.is_remove_point = true;
    },

    cancelRemovePoint() {
      this.is_remove_point = false;
    }
  }
};
</script>

<style scoped>


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


.ivu-modal {
  width: 400px !important;
}

.block_btn {
  background-color: #10c99d;
  color: #fff;
  margin-right: 8px;
  margin-bottom: 8px;
}
</style>
