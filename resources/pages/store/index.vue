<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ================================================== -->
    <div >


      <!-- HEADER -->
      <div class="header">
      </div>

      <!-- CONTENT -->
      <div class="container">

        <div class="_1filter">
          <div class="row">
            <div class="col-12 col-md-4 col-lg-4">
              <div class="_1filter_main">
                <p class="_1filter_title">Categories</p>
                <div class="_flex_space">
                  <select v-model="selected_category"
                      @change="selectedCategory" name="job-type" class="_1filter_select"  style="height: 38px;border-radius: 5px;">
                    <option selected :value="0">Select category</option>
                      <option
                        v-for="category in categories"
                        :key="category.id"
                        :value="category.id"
                      >{{category.name}}</option>
                  </select>
                </div>
               </div>
             </div>
              <div class="col-12 col-md-4 col-lg-4">
                <div class="_1filter_main">
                  <div class="_flex_space _pos_rela">
                    <input v-model="search"
                      @keyup.enter="searchShop" type="text" placeholder="Shop name" class="_1filter_select" style="height: 38px;border-radius: 5px;">
                    <button @click="searchShop" type="button" class="_filter_search_btn _1btn">Search</button>
                    </div>
                </div>
              </div>
          </div>
        </div>
        <template v-if="shops.length">
        <div class="row">
          <div class="col-12 col-lg-3" v-for="shop in shops" :key="shop.id">
            <!-- Card -->
            <div class="card">
              <div class="card-body">
                <!-- Avatar -->
                <div class="text-center">

                  <!-- <a href="team-overview.html" class="card-avatar avatar avatar-lg mx-auto"> -->
                  <!-- </a> -->
                  <nuxt-link :to="`/store/${shop.username}`" class="card-avatar avatar avatar-lg mx-auto">
                    <img v-if="shop.image" :src="shop.image" :alt="shop.name" class="avatar-img rounded">
                    <img v-else src="/images/no_img.png" :alt="shop.name" class="avatar-img rounded">
                  </nuxt-link>
                </div>
                <!-- Title -->
                <h2 class="card-title text-center mb-3">
                  <!-- <a href="team-overview.html">Launchday</a> -->
                  <nuxt-link :to="`/store/${shop.username}`">
                    {{shop.name}}
                  </nuxt-link>
                  <p class="txt_p" v-if="shop.shopCategory">{{shop.shopCategory.name}}</p>
                </h2>
                <!-- Text -->
                <p class="card-text text-center text-muted mb-4" style="margin-bottom:0px !important">
                  {{shop.shop_description}}
                </p>
              </div> <!-- / .card-body -->
            </div>

          </div>


        </div> <!-- / .row -->
        </template>
        <template v-else>
          <h2>No store found</h2>
        </template>
        <div class="profile-fill-more" v-if="shops.length>0">
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

    </div> <!-- / .main-content -->
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getShops`),
        app.$axios.get(`/getCategories`)
      ]);
      // console.log(data)
      return {
        // shops: res1.data,
        shops: res1.data.data,
        pagination: res1.data,
        categories: res2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      selected_category: 0,
      search: "",

      pagination: {},
      page: 1
    };
  },
  methods: {
    async selectedCategory() {
      this.search = "";
      // console.log(this.selected_category);
      if (this.selected_category == 0) {
        await this.pageniateAllShops();
        return;
      }
      const res = await this.callApi("post", `/getShopsByCategoryId`, {
        category_id: this.selected_category
      });
      if (res.status === 200) {
        // console.log(res.data)
        this.shops = res.data.data;
        this.pagination = res.data;
      } else {
        this.swr();
      }
    },
    async searchShop() {
      this.selected_category = 0;
      // console.log(this.search)
      if (this.search == "") {
        await this.pageniateAllShops();
        return;
      } else if (this.search.length < 2) {
        this.wr("Type minimum 2 character for search");
        return;
      }
      const res = await this.callApi("post", `/searchShopsByName`, {
        search: this.search
      });
      if (res.status === 200) {
        this.shops = res.data.data;
        this.pagination = res.data;
        // console.log(res.data)
      } else {
        this.swr();
      }
    },

    setPage(index) {
      this.page = index;
      if (this.search != "") {
        this.pageniateSearchShopsByName();
        return;
      } else if (this.selected_category > 0) {
        this.pageniateShopsByCategoryId();
        return;
      }
      this.pageniateAllShops();
    },
    async pageniateAllShops() {
      const res = await this.callApi("get", `/getShops/?page=${this.page}`);
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.shops = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    },

    async pageniateSearchShopsByName() {
      const res = await this.callApi(
        "post",
        `/searchShopsByName/?page=${this.page}`,
        { search: this.search }
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.shops = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    },

    async pageniateShopsByCategoryId() {
      const res = await this.callApi(
        "post",
        `/getShopsByCategoryId/?page=${this.page}`,
        { category_id: this.selected_category }
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.shops = res.data.data;
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
.store-sub {
  display: inline;
}
</style>

