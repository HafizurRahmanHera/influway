<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header"></div>
      <!-- CONTENT -->
      <div class="container">
        <template v-if="products.length">
          <div class="row">
            <div class="col-12 col-lg-6" v-for="(product,index) in products" :key="product.id">
              <div class="card_one _box_shadow _border_radious _mar_b20 _padd25">
                <div class="row">
                  <div class="col-12 col-md-6 col-lg-6">
                    <div class="card_image">
                      <img
                        v-if="show_slider && slide_img_index && slide_img_index==index && product.productImages.length"
                        :src="product.productImages[slide_img_no].image"
                        alt="image"
                      />
                      <img
                        v-else-if="product.productImages.length"
                        :src="product.productImages[0].image"
                        alt="image"
                      />

                      <div class="card_slider" v-if="product.productImages.length>1">
                        <p class="card_slider_next_pre" @click="preImgSlideShow(index)">
                          <i class="fas fa-arrow-left"></i>
                        </p>
                        <div class="card_slider_div"></div>
                        <p class="card_slider_next_pre" @click="nextImgSlideShow(index)">
                          <i class="fas fa-arrow-right"></i>
                        </p>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 col-md-6 col-lg-6">
                    <div class="card_right">
                      <div class="card_right_one">
                        <h4 class="card_right_one_h4 _text_overflow">{{product.title}}</h4>
                        <!-- <p
                          v-if="product.productCategory"
                          class="card_right_one_text1 _text_overflow"
                        >{{product.productCategory.name}}</p> -->
                        <p
                          v-if="product.subcategory.length"
                          class="card_right_one_text1 _text_overflow"
                        >
                          <span v-for="(item,index) in product.subcategory" :key="index">{{item.subcategory.name}} {{index==product.subcategory.length-1?'':', '}}</span>
                        </p>
                      </div>
                      <div class="card_right_two">
                        <p class="card_right_two_text1">Price {{product.price}}$</p>
                      </div>
                      <div class="card_right_three">
                        <p class="card_right_three_text1">Sizes</p>

                        <ul v-if="product.productSizes.length" class="card_ul">
                          <li
                            v-for="pro_size in product.productSizes"
                            :key="pro_size.id"
                          >{{pro_size.size.size}}</li>
                        </ul>
                      </div>
                      <div class="card_right_four">
                        <p class="card_right_three_text1">Color</p>
                        <span
                          v-for="pro_color in product.productColors"
                          :key="pro_color.id"
                          class="color_style my_color"
                          :style="{'background-color':pro_color.color.color_code}"
                        ></span>
                      </div>
                      <div class="card_bottom">
                        <ul class="card_bottom_ul">
                          <li>
                            <div class="card_bottom_one">
                              <img src="/img/Mask Group 3.png" alt />
                            </div>
                          </li>
                          <li @click="$router.push(`/product_details/${product.id}`)">
                            <div class="card_bottom_one card_btm_two">
                              <img src="/img/Mask Group 5@2x.png" alt />
                            </div>
                          </li>
                          <li>
                            <div class="card_bottom_three">
                              <img src="/img/Mask Group -7@2x.png" alt />
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto">
                    <!-- Dropdown -->
                    <!-- <div class="dropdown">
                          <a
                            href="#"
                            class="dropdown-ellipses dropdown-toggle"
                            role="button"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                          >
                            <i class="fe fe-more-vertical"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a href="#!" class="dropdown-item">Action</a>
                            <a href="#!" class="dropdown-item">Another action</a>
                            <a href="#!" class="dropdown-item">Something else here</a>
                          </div>
                    </div>-->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- / .row -->
        </template>
        <template v-else>
          <div class="col-md-6">
            <h3>No product</h3>
          </div>
        </template>
      </div>
      <div class="profile-fill-more" v-if="products.length>0">
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
    <!-- / .main-content -->
  </no-ssr>
</template>


<script>
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["retail"],
  async asyncData({ app, store, redirect, params }) {
    try {
      // let {data} = await app.$axios.get(`/getProducts`)
      let [data1, data2, data3, data4] = await Promise.all([
        app.$axios.get(`/getRetailProducts`),
        app.$axios.get(`/getCategories`),
        app.$axios.get(`/getColors`),
        app.$axios.get(`/getSizes`)
      ]);
      return {
        products: data1.data.data,
        pagination: data1.data,
        categories: data2.data,
        colors: data3.data,
        sizes: data4.data
      };
    } catch (error) {
      //return redirect('/404')
    }
  },
  data() {
    return {
      posts: [],
      loading: true,
      pro_sizes: [],
      pro_colors: [],
      sColors: [],
      sSize: [],
      sCategory: [],
      show_slider: false,
      slider_id: "",
      image_array: [
        // "/products_image/cote.jpg",
        // "/products_image/cote2.jpg",
        // "/products_image/pant.jpg",
        // "/products_image/pant2.jpg"
      ],
      slider_image_array: [],
      slide_img_no: 0,
      slide_img_index: null,
      pagination: {},
      page: 1
    };
  },
  async created() {
    this.authUser;
    // const res = await this.callApi('get', "https://jsonplaceholder.typicode.com/posts")
    // const res = await this.callApi('get', '/posts')
    // console.log(res)
    // if(res.status===200){
    //   this.posts = res.data
    //   console.log(this.posts)
    //   this.s('axios')
    //   this.loading = false
    // } else{
    //     this.swr()
    //     this.loading = false
    // }
  },

  methods: {
    async filterChanges(page = 1) {
      // let  cat = JSON.stringify(this.sCategory)
      let cat = Object.assign({}, this.sCategory);
      // console.log(cat);
      // console.log(this.sCategory);

      const res = await this.callApi(
        "get",
        `/app/searchByKey?sCategory=${cat}`
      );
      if (res.status === 200) {
        this.localData = res.data;
      } else {
        this.swr();
      }
    },

    preImgSlideShow(index) {
      // console.log(index);
      // console.log(this.slide_img_no);
      this.show_slider = true;

      if (this.slide_img_index && this.slide_img_index != index) {
        this.slide_img_no = 0;
      } else {
        // this.slide_img_index = index
      }
      this.slide_img_index = index;
      if (this.slide_img_no != 0) {
        this.slide_img_no--;
      }
    },

    nextImgSlideShow(index) {
      // console.log(index);
      // console.log(this.slide_img_no);
      this.show_slider = true;
      if (this.slide_img_index && this.slide_img_index != index) {
        this.slide_img_no = 0;
      } else {
        // this.slide_img_index = index
      }
      this.slide_img_index = index;
      if (this.slide_img_no != this.products[index].productImages.length - 1) {
        this.slide_img_no++;
      }
    },
    setPage(index) {
      this.page = index;
      this.pageniateAllProducts();
    },
    async pageniateAllProducts() {
      const res = await this.callApi(
        "get",
        `/getRetailProducts/?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.products = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    }
  }
};
</script>

<style>
  .product_img_effect_list li button {
    font-weight: 600;
    padding: 7px 10px;
    border: 2px solid #fff;
    display: inline-block;
    text-transform: uppercase;
    color: #fff;
    font-size: 14px;
    width: 136px;
    background: transparent;
    transition: 0.3s all ease;
  }
  .product_img_effect_list li button:hover {
    text-decoration: none;
    background: #fff;
    color: #10c99d !important;
  }
  .color_style {
    /* border: 1px solid #000; */
    padding: 7px;
    margin: 2px;
    border-radius: 50%;
    width: 10px;
    height: 10px;
    display: inline-block;
    /* background-color: red; */
  }
</style>
