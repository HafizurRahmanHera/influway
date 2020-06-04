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
        <template v-if="statuses.length">
          <div class="row justify-content-center">
            <div class="col-12 col-xl-8">
              <!-- Card -->
              <div class="card" v-for="(status,index) in statuses" :key="status.id">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <h4 class="card-title mb-1">{{status.title}}</h4>
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <!-- <li v-if="status.blogCategory" class="time_li">{{status.blogCategory.name}}</li> -->
                            <li class="name_li">{{status.created_at | myDate}}</li>
                          </ul>
                        </div>
                      </div>
                      <div class="col-auto">
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
                            <nuxt-link :to="`/status_edit/${status.id}`" class="dropdown-item">Edit</nuxt-link>
                            <button
                              @click="confirmDelete(status.id,index)"
                              class="dropdown-item"
                            >Delete</button>
                          </div>
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
                              v-if="blog.feature_image"
                              :src="blog.feature_image"
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
import HeadSection from "~/components/ItemUserHeadSection.vue";
export default {
  // middleware: ["influencer"],
  middleware: ["status_redirect"],
  components: {
    HeadSection
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([app.$axios.get(`/getUserStatuses`)]);
      // console.log(data)
      return {
        statuses: res1.data.data,
        pagination: res1.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      pagination: {},
      page: 1,
      selected_index: -1
    };
  },
  methods: {
    confirmDelete(id, index) {
      this.$Modal.confirm({
        title: "Delete Status",
        content: "<p>Confirm to delete status</p>",
        onOk: () => {
          // this.$Message.info('Clicked ok');
          // console.log('ok')
          this.deleteStatus(id, index);
          return;
        },
        onCancel: () => {
          // this.$Message.info('Clicked cancel');
          // console.log('cancel')
        }
      });
    },

    async deleteStatus(id, index) {
      // console.log("delete blog");
      // console.log(id)
      // return
      const res = await this.callApi("post", "/deleteStatus", { id: id });
      if (res.status === 200) {
        this.statuses.splice(index, 1);
        this.s("Status deleted!");
        // if (res.data.token_value) {
        //   this.$store.dispatch(
        //     "updateUserDeductedTokens",
        //     res.data.token_value
        //   );
        //   this.in(res.data.token_value + " tokens is deducted!");
        // }
      } else {
        // console.log(res);
        this.swr();
      }
      return;
    },

    setPage(index) {
      this.page = index;
      this.pageniateAllStatuses();
    },
    async pageniateAllStatuses() {
      const res = await this.callApi(
        "get",
        `/getUserStatuses/?page=${this.page}`
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


