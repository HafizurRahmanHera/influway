<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ================================================== -->
    <div >

      <!-- HEADER -->
      <div class="header">

        <!-- Image -->
        <!-- <img src="/img/covers/profile-cover-1.jpg" class="header-img-top" alt="..."> -->
        <br><br><br>
        <div class="container">

          <!-- Body -->
          <div class="header-body mt-n5 mt-md-n6">
            <div class="row">

              <div class="col-12 col-md-5 col-lg-5">
                <div class="produt_all_left _dis_flex">
                                  <!-- Avatar -->
                    <div class="avatar avatar-xxl header-avatar-top">
                      <img v-if="shop.image" :src="shop.image" :alt="shop.name" class="avatar-img rounded-circle border border-4 border-body">
                      <img v-else src="/images/no_img.png" :alt="shop.name" class="avatar-img rounded-circle border border-4 border-body">
                    </div>

                    <div class="product_top">
                      <!-- Title -->
                      <h1 class="header-title">
                        {{shop.name}}
                      </h1>
                        <!-- Pretitle -->
                      <h6 class="header-pretitle" style="padding-top:4px">
                        {{shop.shop_description}}
                      </h6>
                      <p class="store_section_right_p2" v-if="shop.shopCategory">
                          Product type:
                          <span class="clothe_text" >{{shop.shopCategory.name}}</span>
                          <!-- <template v-if="shop.subcategory.length">
                          <span  class="clothe_text" v-for="(item,index) in shop.subcategory" :key="index" >{{item.subcategory.name}}</span>
                          </template> -->
                      </p>
                    </div>
                </div>
              </div>

              <div class="col-md-3">
                <div class="contact_section_right">
                  <h3 class="contact_section_right_h3">Contact</h3>
                  <p
                    class="contact_section_right_p" v-if="shop.address"
                  >Address: {{shop.address}}</p>
                  <p v-if="shop.phone" class="contact_section_right_p">Phone: {{shop.phone}}</p>
                  <!-- <p class="contact_section_right_p2">E-mail: {{shop.email}}</p> -->
                  <p class="contact_section_right_p2" v-if="shop.getInfo">E-mail: {{shop.getInfo.email}}</p>
                </div>
              </div>
              <!-- <div class="col-12 col-md-auto mt-2 mt-md-0 mb-md-3"> -->
                <!-- Button -->
                <!-- <a href="#!" class="btn btn-primary d-block d-md-inline-block lift">
                  Subscribe
                </a> -->
                <!-- Pretitle -->
              <!-- </div> -->


            </div> <!-- / .row -->
            <div class="row align-items-center">
              <div class="col">

                <!-- Nav -->
                <!-- <ul class="nav nav-tabs nav-overflow header-tabs">
                  <li class="nav-item">
                    <a href="profile-posts.html" class="nav-link">
                      Posts
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="profile-groups.html" class="nav-link">
                      Groups
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="profile-projects.html" class="nav-link active">
                      Projects
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="profile-files.html" class="nav-link">
                      Files
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="profile-subscribers.html" class="nav-link">
                      Subscribers
                    </a>
                  </li>
                </ul> -->

              </div>
            </div>
          </div> <!-- / .header-body -->

        </div>
      </div>

      <!-- CONTENT -->
      <div data-toggle="lists" data-options='{"valueNames": ["name"]}'>
        <div class="container" data-toggle="lists" data-options='{"valueNames": ["name"], "listClass": "listAlias"}'>
          <!-- <div class="row mb-4">
            <div class="col">


              <form>
                <div class="input-group input-group-lg input-group-merge">
                  <input type="text" class="form-control form-control-prepended search" placeholder="Search">
                  <div class="input-group-prepend">
                    <div class="input-group-text">
                      <span class="fe fe-search"></span>
                    </div>
                  </div>
                </div>
              </form>

            </div>
            <div class="col-auto">


              <div class="nav btn-group" role="tablist">
                <button class="btn btn-lg btn-white active" data-toggle="tab" data-target="#tabPaneOne" role="tab" aria-controls="tabPaneOne" aria-selected="true">
                  <span class="fe fe-grid"></span>
                </button>
                <button class="btn btn-lg btn-white" data-toggle="tab" data-target="#tabPaneTwo" role="tab" aria-controls="tabPaneTwo" aria-selected="false">
                  <span class="fe fe-list"></span>
                </button>
              </div>

            </div>
          </div>  -->


           <!-- Filter Section -->
          <div class="_1filter">
            <div class="row">
              <!-- <div class="col-12 col-md col-lg">
								<div class="_1filter_main">
									<p class="_1filter_title">Categories</p>

									<div class="_flex_space">
										<select class="_1filter_select">
											  <option value="volvo">Select categories</option>
											  <option value="saab">Saab</option>
											  <option value="mercedes">Mercedes</option>
											  <option value="audi">Audi</option>
										</select>
									</div>
								</div>
              </div>-->

              <div class="col-12 col-md col-lg">
                <div class="_1filter_main">
                  <p class="_1filter_title">Sort by</p>

                  <div class="_flex_space">
                    <!-- <select class="_1filter_select" v-model="selected_sort_type" @change="selectSortBy()"> -->
                    <Select  v-model="selected_sort_type" @on-change="selectSortBy()">
                      <Option selected :value="1">Polular</Option>
                      <Option :value="2">Price low to high</Option>
                      <Option :value="3">Price hight to low</Option>
                      <!-- <option value="saab">Saab</option> -->
                      <!-- <option value="mercedes">Mercedes</option> -->
                      <!-- <option value="audi">Audi</option> -->
                    </Select>
                    <!-- </select> -->
                  </div>
                </div>
              </div>

              <div class="col-12 col-md-auto col-lg-auto">
                <div class="_1filter_main">
                  <p class="_1filter_title">Item per page</p>

                  <div class="_flex_space">
                    <!-- <select class="_1filter_select" @change="selectedPerPage" v-model="perPage"> -->
                    <Select  @on-change="selectedPerPage()" v-model="perPage">
                      <!-- <option :value="12">12</option> -->
                      <!-- <option :value="2">2</option> -->
                      <!-- <option :value="4">4</option> -->
                      <!-- <option :value="6">6</option> -->
                      <Option :value="16">16</Option>
                      <Option :value="20">20</Option>
                      <Option :value="24">24</Option>
                      <Option :value="30">30</Option>
                      <Option :value="34">34</Option>
                    </Select>
                    <!-- </select> -->
                  </div>
                </div>
              </div>

              <!-- <div class="col-12 col-md-auto col-lg-auto">
								<select class="_1filter_select">
									  <option value="volvo">Filter</option>
									  <option value="saab">Saab</option>
									  <option value="mercedes">Mercedes</option>
									  <option value="audi">Audi</option>
								</select>
              </div>-->

              <div class="col-12 col-md-4 col-lg-4">
                <!-- <div class="_1filter_main">
                  <p class="_1filter_title">Filter</p>
                  <div class="_flex_space Veiw">
                    <div @click="show_filter==true?show_filter=false:show_filter=true" class="Veiw_main _cursor">
                      <i class="fas fa-th"></i>
                    </div>
                  </div>
                </div> -->
              </div>
            </div>

            <!-- Sub Dropdown -->
            <div v-if="show_filter" class="_1filter_drop">
              <!-- <div class="_1filter_drop_main">
								<p class="_title">Brand</p>

								<ul class="_1filter_drop_list">
									<li><input type="checkbox" name="vehicle1" value="Bike"> Alain Figer</li>
									<li><input type="checkbox" name="vehicle1" value="Bike"> Alain Figer</li>
									<li><input type="checkbox" name="vehicle1" value="Bike"> Addidas</li>
									<li><input type="checkbox" name="vehicle1" value="Bike"> Addidas</li>
									<li><input type="checkbox" name="vehicle1" value="Bike"> Addidas</li>
									<li><input type="checkbox" name="vehicle1" value="Bike"> Addidas</li>
								</ul>
              </div> -->

              <div class="_1filter_drop_main">
                <p class="_title">Size</p>

                <ul class="_1filter_drop_list">
                  <li v-for="size in sizes" :key="size.id">
                    <input type="checkbox" name="sizes" :value="size.id" />
                    {{size.size}}
                  </li>
                  <!-- <li><input type="checkbox" name="vehicle1" value="Bike"> X</li>
                  <li><input type="checkbox" name="vehicle1" value="Bike"> L</li>
                  <li><input type="checkbox" name="vehicle1" value="Bike"> M</li>
                  <li><input type="checkbox" name="vehicle1" value="Bike"> M</li>
                   <li><input type="checkbox" name="vehicle1" value="Bike"> M</li> -->
                </ul>
              </div>

              <div class="_1filter_drop_color">
                <p class="_title">Color</p>

                <ul class="_color_list">
                  <li
                    v-for="color in colors"
                    :key="color.id"
                    :style="{'background-color':color.color_code}"
                  >
                    <label class="check_all" :style="{'background-color':color.color_code}">
                      <input type="checkbox" />
                      <span class="checkmark" :style="{'background-color':color.color_code}"></span>
                    </label>
                  </li>
                  <!-- <li class="_blue">
										<label class="check_all">
										  <input type="checkbox" checked="checked">
										  <span class="checkmark" style="background-color: rgb(0, 120, 215);"></span>
										</label>
									</li>
								    <li class="_blue">
										<label class="check_all">
										  <input type="checkbox" checked="checked">
										  <span class="checkmark" style="background-color: rgb(0, 120, 215);"></span>
										</label>
									</li>
								    <li class="_blue">
										<label class="check_all">
										  <input type="checkbox" checked="checked">
										  <span class="checkmark" style="background-color: rgb(0, 120, 215);"></span>
										</label>
									</li>
									    <li class="_blue">
										<label class="check_all">
										  <input type="checkbox" checked="checked">
										  <span class="checkmark" style="background-color: rgb(0, 120, 215);"></span>
										</label>
									</li> -->
                </ul>
              </div>
            </div>
            <!-- Sub Dropdown -->
          </div>
          <!-- Filter Section -->



          <!-- Tab content -->
          <div class="tab-content">
            <div class="tab-pane fade active show" >
              <div class="row listAlias">
                <template v-if="products.length">
                <div class="col-12 col-md-6 col-xl-3" v-for="product in products" :key="product.id">

                  <!-- Card -->
                  <div class="card store_card">
                    <nuxt-link :to="`/product_details/${product.id}`">
                    <!-- <a href="project-overview.html"> -->
                      <img
                      v-if="product.productImages.length"
                      :src="product.productImages[0].image" alt="..." class="card-img-top">
                    <!-- </a> -->
                    </nuxt-link>
                      <div class="card-body">
                         <div class="post_girl_section_text">
                           <h3 class="post_girl_h3">{{product.title}}</h3>
                           <!-- <p class="post_girl_p1" v-if="product.productCategory">{{product.productCategory.name}}</p> -->
                           <p class="post_girl_p1" v-if="product.subcategory.length">
                             <span v-for="(item,index) in product.subcategory" :key="index">{{item.subcategory.name}} {{index==product.subcategory.length-1?'':', '}}</span>
                           </p>
                           <div class="post_girl_section_icon">
                             <ul class="post_girl_section_icon_ul">
                               <li class="post_girl_section_icon_ul_li1">Price {{product.price}}$

                               </li>
                               <li class="post_girl_section_icon_ul_li2">
                                 <i class="far fa-heart"></i>
                               </li>
                             </ul>
                           </div>
                         </div>
                      </div> <!-- / .card-body -->
                  </div>

                </div>
                </template>
                <template v-else>
                <div class="col-12 col-md-6 col-xl-4">
                    <h4>No product</h4>
                </div>
                </template>



              </div> <!-- / .row -->
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

          </div> <!-- / .tab-content -->

        </div>
      </div>

    </div> <!-- / .main-content -->
  </no-ssr>
</template>

<script>
export default {
  // middleware: ['authenticated','influencer'],
  middleware: ["authenticated"],
  async asyncData({ app, store, redirect, params }) {
    try {
      // let {data} = await app.$axios.get(`/getProducts`)
      let [data1, data2, data3, data4, data5] = await Promise.all([
        app.$axios.get(`/getShopProducts/${params.username}`),
        app.$axios.get(`/getCategories`),
        app.$axios.get(`/getColors`),
        app.$axios.get(`/getSizes`),
        app.$axios.get(`/getShopById/${params.username}`)
      ]);
      if (!data5.data) {
        redirect("/store");
      }
      return {
        products: data1.data.data,
        pagination: data1.data,
        categories: data2.data,
        colors: data3.data,
        sizes: data4.data,
        shop: data5.data
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
      show_filter: false,

      pagination: {},
      page: 1,
      perPage:16,
      selected_sort_type:1
    };
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

    showFilter() {
      if (this.show_filter == true) {
        this.show_filter = false;
      } else {
        this.show_filter = true;
      }
    },

    setPage(index) {
      // console.log('setPage')
      this.page = index;
      // this.perPage = 16
      // this.pageniateAllProducts();
      this.pageniateSelectSortBy();
    },
    async pageniateAllProducts() {
      const res = await this.callApi(
        "get",
        `/getShopProducts/${this.$route.params.username}?page=${this.page}&perPage=${this.perPage}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.products = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    },

    async selectSortBy(){
      // this.perPage = 16
      // console.log('selectSortBy')
      const res = await this.callApi("post", `/getShopProductsBySorting/?page=${this.page}&perPage=${this.perPage}`, {
        type: this.selected_sort_type,
        username: this.$route.params.username
      });
      if (res.status === 200) {
        // console.log(res.data)
        // this.products = res.data;
        this.products = res.data.data;
        this.pagination = res.data;
      } else {
        this.swr();
      }
    },
    async pageniateSelectSortBy(){
      // console.log('pageniateSelectSortBy')
      // console.log(this.page)
      // console.log(this.perPage)
      const res = await this.callApi("post", `/getShopProductsBySorting/?page=${this.page}&perPage=${this.perPage}`, {
        type: this.selected_sort_type,
        username: this.$route.params.username
      });
      if (res.status === 200) {
        // console.log(res.data)
        this.products = res.data.data;
        this.pagination = res.data;
      } else {
        this.swr();
      }
    },
    async selectedPerPage(){
      // console.log('selectedPerPage')
      // console.log(this.page)
      // console.log(this.perPage)
      // const res = await this.callApi(
      //   "get",
      //   `/getShopProducts/${this.$route.params.username}?page=${this.page}&perPage=${this.perPage}`
      // );
      // if (res.status === 200) {
      //   window.scrollTo(0, 0);
      //   this.products = res.data.data;
      //   this.pagination = res.data;
      //   delete this.pagination.data;
      // } else {
      //   this.swr();
      // }
      const res = await this.callApi("post", `/getShopProductsBySorting/?page=${this.page}&perPage=${this.perPage}`, {
        type: this.selected_sort_type,
        username: this.$route.params.username
      });
      if (res.status === 200) {
        // console.log(res.data)
        this.products = res.data.data;
        this.pagination = res.data;
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
  /* display: block; */
  /* background-color: red; */
}

.post_girl_section_image {
  position: relative;
  margin-bottom: 38px;
  /* width: 100%;
    height: 100%; */
}
.post_girl_section_image img {
  border-radius: 6px 6px 0px 0px;
  /* width: 100%;
    height: 100%; */
}
</style>
