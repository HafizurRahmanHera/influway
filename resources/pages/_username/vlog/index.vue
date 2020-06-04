<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header">
        <userhead-section v-if="owner.id==authInfo.id"></userhead-section>
        <ownerhead-section v-else :owner="owner"></ownerhead-section>
        <!-- <head-section></head-section> -->
      </div>

      <!-- CONTENT -->
      <div class="container">
        <template v-if="vlogs.length">
          <div class="row justify-content-center">
            <div class="col-12 col-xl-8">
              <!-- card  -->
              <div class="card" v-for="(vlog,index) in vlogs" :key="vlog.id">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <h4 class="card-title mb-1">{{vlog.title}}</h4>
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <li v-if="vlog.vlogCategory" class="time_li">{{vlog.vlogCategory.name}}</li>
                            <li class="name_li">{{vlog.created_at | myDate}}</li>
                          </ul>
                        </div>
                      </div>
                      <div class="col-auto" v-if="authInfo.id==owner.id">
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
                            <nuxt-link :to="`/vlog_edit/${vlog.id}`" class="dropdown-item">Edit</nuxt-link>
                            <button
                              @click="confirmDelete(vlog.id,index)"
                              class="dropdown-item"
                            >Delete</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Image -->
                  <p class="text-center mb-3">
                    <!-- <img src="/img/posts/post-1.jpg" alt="..." class="img-fluid rounded"> -->
                    <video width="100%" controls="controls">
                      <source :src="vlog.video" type="video/mp4" />Your browser does not support HTML5 video.
                    </video>
                  </p>
                  <!-- Text -->
                  <div class="first_sec_all">
                    <!-- <p v-html="vlog.text" class="mb-3"> ....</p>-->
                    <p v-html="shortenText(vlog.text)" class="mb-3"></p>
                    <div class="first_sec_link">
                      <nuxt-link v-if="vlog.text.length>800" :to="`/vlog/details/${vlog.id}`">Read More</nuxt-link>
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
                                <nuxt-link :to="`/vlog/details/${vlog.id}`">Comments</nuxt-link>
                              </li>
                              <!-- <li>
                                <i class="fas fa-thumbs-up"></i>
                              </li> -->
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{vlog.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{vlog.__meta__.comments_count}}
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
                    <h3>No Vlog</h3>
                  </div>
                </div>
              </div>
              <!-- / .row -->
            </div>
          </div>
          <!-- / .tab-content -->
        </template>

        <div class="profile-fill-more" v-if="vlogs.length>0">
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
import UserheadSection from "~/components/ItemUserHeadSection.vue";
import OwnerheadSection from "~/components/ItemOwnerHeadSectionWithProps.vue";
export default {
  middleware: ["authenticated"],
  components: {
    UserheadSection,
    OwnerheadSection,
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      // let [res1] = await Promise.all([app.$axios.get(`/getUserVlogs`)]);
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getUserVlogsById/${params.username}`),
        app.$axios.get(`/getOwnerProfileById/${params.username}`)
      ]);
      // console.log(data)
      if (!res2.data) {
        redirect("/");
      }
      else if (res2.data && (res2.data.role == 1 || res2.data.role == 5)){
        redirect("/");
      }
      return {
        vlogs: res1.data.data,
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
      page: 1,
      selected_index: -1
    };
  },
  methods: {
    confirmDelete(id, index) {
      this.$Modal.confirm({
        title: "Delete vlog",
        content: "<p>Confirm to delete vlog</p>",
        onOk: () => {
          // this.$Message.info('Clicked ok');
          // console.log('ok')
          this.deleteVlog(id, index);
          return;
        },
        onCancel: () => {
          // this.$Message.info('Clicked cancel');
          // console.log('cancel')
        }
      });
    },

    async deleteVlog(id, index) {
      // console.log("delete vlog");
      // console.log(id)
      // return
      const res = await this.callApi("post", "/deleteVlog", { id: id });
      if (res.status === 200) {
        this.vlogs.splice(index, 1);
        this.s("Vlog deleted!");
        if (res.data.token_value) {
          this.$store.dispatch(
            "updateUserDeductedTokens",
            res.data.token_value
          );
          this.in(res.data.token_value + " tokens is deducted!");
        }
      } else {
        // console.log(res);
        this.swr();
      }
      return;
    },
    setPage(index) {
      this.page = index;
      this.pageniateAllVlogs();
    },
    async pageniateAllVlogs() {
      const res = await this.callApi("get", `/getUserVlogs/?page=${this.page}`);
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.vlogs = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    }
  }
};
</script>


