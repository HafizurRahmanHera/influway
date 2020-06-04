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
              <h3 class="creat_section_h3">Create Lookbook</h3>
              <div class="row">
                <div class="col-12 col-md-6 col-lg-auto _1look_create">
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
                            <span @click="pointClick(item.id)" style="cursor:pointer">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li>
                          <!-- <li
                            v-for="(item,index) in img_cordinate"
                            :key="index"
                            :style="{'left':item.x_cor+3+'px','top':item.y_cor-3+'px'}"
                          >
                            <span @click="pointClick(item.id)" style="cursor:pointer">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li> -->
                          <!-- <li
                            v-for="(item,index) in img_cordinate"
                            :key="index"
                            :style="{'left':item.x+7+'px','top':item.y-5+'px'}"
                          >
                            <span @click="pointClick(item.id)" style="cursor:pointer">
                              <i class="fas fa-plus"></i>
                            </span>
                          </li> -->
                        </ul>
                      </div>
                      <div class="_input_button">
                        <button :disabled="loading" class="btn btn-primary lift" @click="createCustomProductLinks" type="button">Create</button>
                        <button class="btn btn-default lift" @click="cancelCreate" type="button">Cancel</button>
                      </div>
                      <!-- <Button type="success" long @click="uploadProductLinks">Submit</Button> -->
                    </div>
                  </template>
                  <!-- upload image -->
                  <div class="create_left" v-if="!custom_product_image_create">
                    <div class="_mar_b30">
                      <div class="_1look_image_upload">
                        <Upload
                          :show-upload-list="false"
                          :on-success="handleImageUpload"
                          :format="['jpg','jpeg','png']"
                          :max-size="2048"
                          :on-format-error="handleFormatError"
                          :on-exceeded-size="handleMaxSize"
                          :before-upload="handleBeforeUpload"
                          type="drag"
                          action="/uploadImages"
                        >
                          <div style="padding: 20px 0">
                            <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                            <p>Click or drag image here to upload</p>
                          </div>
                        </Upload>
                      </div>
                    </div>
                    <!-- <div class="drag_btn_area">
                          <a class="block_btn" href="#">Create</a>
                          <a class="border_btn" href="#">Cancel</a>
                    </div>-->
                  </div>

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
                            class="col-6 col-md-6 col-lg-3 _mar_b30"
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
      generate_cor_id: 0,
      point_created: false,
      point_clicked: false,
      point_clicked_id: null,
      product_clicked: false,
      pro_img: [
        // { pic: "/images/pant.jpg", name: "pant", id: 1 },
        // { pic: "/images/shoe.jpg", name: "shoe", id: 2 },
        // { pic: "/images/man_cote.jpg", name: "cote", id: 3 }
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
        custom_product_image: null
      },
      search: "",
      showPointProduct: false,
      point_product_image: null,
      custom_product_image_create: null,

      imgURL: "",
      visible: false,
      loading: false,
    };
  },
  methods: {
    createPoint(event) {

      // console.log(event)
      // console.log(event.target.height)
      // console.log(event.target.width)
      // console.log(event.offsetY-7)
      // console.log(event.offsetX-7)
      // console.log( (((event.offsetY-4)*100)/event.target.height).toFixed(2) )
      // console.log( (((event.offsetX-12)*100)/event.target.width).toFixed(2) )
      // return

      // this.s("x=" + event.offsetX + " y=" + event.offsetY);
      if (this.point_created == true) {
        this.s("Click the plus point then a product to link");
        return;
      }
      this.s("Click the plus point then a product to link");

      let item = {
        id: this.generate_cor_id,
        x: 0,
        y: 0,
      };
      this.generate_cor_id++;
      item.x = (((event.offsetX-15)*100)/event.target.width).toFixed(2)
      item.y = (((event.offsetY-12)*100)/event.target.height).toFixed(2)
      // console.log('item.x '+item.x)
      // console.log('item.y '+item.y)
      this.img_cordinate.push(item);
      this.point_created = true;
      this.point_clicked = false;

      // console.log(this.img_cordinate);
    },

    async pointClick(id) {
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
      // this.s("img= "+index)
      // console.log(product);
      // console.log("proImgClicked");
      if (this.point_clicked == false) {
        this.s("Click the plus point");
        // console.log(this.linked_pro);
        return;
      }
      this.s(product.title + " is linked");
      // this.s(title);
      let item = {
        x: this.img_cordinate[this.point_clicked_id].x,
        y: this.img_cordinate[this.point_clicked_id].y,
        por_id: product.id,
        por_image: product.productImages[0].image,
        cor_id: this.generate_cor_id - 1
        // item:null
      };
      this.linked_pro.push(item);
      // console.log(this.linked_pro);
      this.point_created = false;
      this.point_clicked = false;
    },

    handleRemove() {
      this.form.custom_product_image = null;
    },

    handleImageUpload(res, file) {
      this.img_cordinate.splice(0, this.img_cordinate.length);
      this.img_cordinate.splice(0, this.linked_pro.length);
      this.s("Select a point from the image");
      if (res) {
        // console.log(res);
        this.form.custom_product_image = res.image_path;
        this.custom_product_image_create = res.image_path;
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
      //   this.wv("One pictures can be uploaded.");
      // }
      // return check;
    },

    uploadProductLinks() {},
    cancelCreate() {
      this.point_created = false;
      this.point_clicked = false;
      this.point_clicked_id = null;
      this.product_clicked = false;
      this.form.custom_product_image = null;
      this.custom_product_image_create = null;
      this.img_cordinate.splice(0, this.img_cordinate.length);
      this.linked_pro.splice(0, this.linked_pro.length);
    },

    async searchPorduct() {
      // console.log(this.search)
      if (this.search == "") {
        const res = await this.callApi("get", "/getProducts");
        if (res.status === 200) {
          this.products = res.data;
          // console.log(res.data);
          // this.loading = false
        } else {
          this.swr();
          // this.loading = false
        }
        return;
      } else if (this.search.length < 3) {
        this.wr("Type minimum 3 character");
        return;
      }
      const res = await this.callApi("post", "/searchProducts", {
        search: this.search
      });
      // console.log(res)
      if (res.status === 200) {
        this.products = res.data;
        // console.log(res.data);
        // this.loading = false
      } else {
        this.swr();
        // this.loading = false
      }
    },

    async createCustomProductLinks() {
      // console.log(this.linked_pro);
      this.loading= true
      if (!this.linked_pro.length) {
        this.e("No product linked");
        this.loading= false
        return;
      }
      const res = await this.callApi("post", "/createCustomProductLinks", {
        custom_product_links: this.linked_pro,
        custom_product: this.custom_product_image_create
      });
      // console.log(res);
      if (res.status === 200) {
        // this.products = res.data
        // console.log(res);
        this.s("Lookbook created successfully!");
        if (res.data.token_value) {
          this.$store.dispatch('updateUserReceivedTokens', res.data.token_value)
          this.s("You have received "+res.data.token_value + " tokens");
        }else{
          this.wr("To get token you have to verify your account!");
        }
        // this.$router.push("/lookbook");
        this.$router.push(`/${this.authInfo.username}`);
        // this.cancelCreate()
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


</style>

