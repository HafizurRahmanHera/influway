<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <head-section :owner="owner"></head-section>
      </div>

      <!-- CONTENT -->
      <div class="container">
        <template v-if="statuses.length">
          <div class="row justify-content-center">
            <div class="col-12 col-xl-8">
              <!-- Card -->
              <div class="card" v-for="(status) in statuses" :key="status.id">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <!-- <h4 class="card-title mb-1">{{status.title}}</h4> -->
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <!-- <li v-if="status.blogCategory" class="time_li">{{status.blogCategory.name}}</li> -->
                            <li class="name_li">{{status.created_at | myDate}}</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Image -->
                  <div class="row">
                    <div class="col-12 col-md-9 col-lg-7">
                      <div class="img_blog_sec">
                        <!-- <p class="text-center mb-3">
                            <img
                              v-if="status.feature_image"
                              :src="status.feature_image"
                              alt="pic"
                              class="img-fluid rounded"
                            />
                        </p>-->
                      </div>
                    </div>
                  </div>
                  <!-- Text -->
                  <div class="first_sec_all">
                    <p v-html="status.text" class="mb-3">....</p>
                    <div class="first_sec_link">
                      <!-- <nuxt-link :to="`/status/details/${status.id}`">Read More</nuxt-link> -->
                    </div>
                    <div class="_card_image_all" v-if="status.images.length">
                      <!-- Items -->
                      <div
                        class="_card_image_main"
                        v-for="(item,index) in status.images"
                        :key="index"
                      >
                        <div class="_card_image">
                          <!-- <img class="_card_image_pic" src="/uploads/1574923357292.jpeg" alt="" title=""> -->
                          <img class="_card_image_pic" :src="item.image" alt title />
                        </div>
                      </div>
                      <!-- Items -->

                      <!-- Items -->
                      <!-- <div class="_card_image_main">
                            <div class="_card_image">
                              <img class="_card_image_pic" src="/uploads/1574923357292.jpeg" alt="" title="">
                            </div>
                      </div>-->
                      <!-- Items -->
                    </div>
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li>
                                <!-- <i class="fas fa-thumbs-up icon_color"></i> -->
                                <nuxt-link :to="`/status/details/${status.id}`">Comments</nuxt-link>
                              </li>
                              <!-- <li>
                                <i class="fas fa-thumbs-up"></i>
                              </li>-->
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{status.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{status.__meta__.comments_count}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- / .row -->
        </template>
        <template v-else>
          <div class="tab-content">
            <div class="tab-pane fade active show">
              <div class="row listAlias">
                <div class="col-12 col-md-12 col-xl-12">
                  <!-- Card -->
                  <div class="lookbook_plus">
                    <h3>No Status</h3>
                  </div>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <!-- / .tab-content -->
        </template>

        <div class="profile-fill-more" v-if="statuses.length>0">
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
import HeadSection from "~/components/ItemOwnerHeadSectionWithProps.vue";
export default {
  middleware: ["authenticated"],
  components: {
    HeadSection
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getUserStatusesById/${params.username}`),
        app.$axios.get(`/getOwnerProfileById/${params.username}`)
      ]);
      // console.log(data)
      return {
        statuses: res1.data.data,
        pagination: res1.data,
        owner: res2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      pagination: {},
      page: 1
    };
  },
  methods: {
    setPage(index) {
      this.page = index;
      this.pageniateAllStatus();
    },
    async pageniateAllStatus() {
      const res = await this.callApi(
        "get",
        `/getUserStatusById/${this.$route.params.username}?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.statuses = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    }
  }
};
</script>


