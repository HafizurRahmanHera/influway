<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header"></div>
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-12 col-lg-12">
            <div class="row justify-content-center">
              <!-- Left Section -->
              <div class="col-md-10 order-8 order-md-4">
                <template v-if="vlog">
                  <!-- Card -->
                  <div class="card">
                    <div class="_3card _border_radious _padd25">
                      <div class="silience_section_all _mar_b20">
                        <div class="_dis_flex _3card_details">
                          <div class="_3card_details _flex_space">
                            <h4 class="silience_section_h4">{{vlog.title}}</h4>
                          </div>
                        </div>

                        <div class="_comment">
                          <p class="_comment_time">{{vlog.created_at | myDate}}</p>
                          <p
                            class="silience_section_p _mar_b10"
                            v-if="vlog.vlogCategory"
                          >{{vlog.vlogCategory.name}}</p>

                          <video width="100%" controls class="vlog-actor_section_bottom_img">
                            <source :src="vlog.video" type="video/mp4" />Your browser does not support HTML5 video.
                          </video>
                          <p class="silience_section_p_all _mar_t15" v-html="vlog.text"></p>
                          <div class="read_all"></div>
                        </div>
                      </div>

                      <div class="mb-3">
                        <div class="row">
                          <div class="col">
                            <div class="all_react">
                              <div class="react_left">
                                <ul>
                                  <li
                                    class="_cursor"
                                    v-if="vlog.userLike!=null"
                                    @click="user_like_action(vlog.feed_id,vlog.user_id)"
                                  >
                                    <i class="fas fa-thumbs-up"></i>
                                  </li>
                                  <li
                                    class="_cursor"
                                    v-else
                                    @click="user_like_action(vlog.feed_id,vlog.user_id)"
                                  >
                                    <i class="fas fa-thumbs-up icon_color"></i>
                                  </li>
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
                                    {{vlog.comments.length}}
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- / .row -->
                      </div>

                      <hr />
                    </div>
                    <!-- Comment -->
                    <div class="_1comment _border_radious _mar_b20 _padd25">
                      <div class="_border_color _all_comment img_cmnt">
                        <!-- Items -->
                        <div
                          class="_1comment_list _border_color"
                          v-for="comment in vlog.comments"
                          :key="comment.id"
                        >
                          <div class="_1comment_list_left">
                            <!-- <nuxt-link
                              v-if="comment.user"
                              class="avatar avatar-sm"
                              :to="comment.user.role==2? `/vlog/user/${comment.user.username}` : `/store/${comment.user.username}`"
                            > -->
                            <nuxt-link
                              v-if="comment.user"
                              class="avatar avatar-sm"
                              :to="comment.user.role==2? `/${comment.user.username}/vlog` : `/store/${comment.user.username}`"
                            >
                            <img
                              class="image-one"
                              v-if="comment.user.image"
                              :src="comment.user.image"
                              alt="user pic"
                            />
                            <img
                              v-else
                              src="/images/default.jpg"
                              alt="user_pic"
                              class="image-one"
                            />
                            <div v-if="comment.user.verification_status==4" class="_active"><i class="fas fa-check"></i></div>
                            </nuxt-link>
                          </div>
                          <div class="_1comment_list_right">
                            <h3
                              class="_1comment_list_right_text _title "
                            >{{comment.user.name}}</h3>
                            <p
                              class="_1comment_list_right_text_p_one"
                            >{{comment.created_at | myDate}}</p>
                            <p class="_1comment_list_right_text_p_two">{{comment.text}}</p>
                          </div>
                        </div>
                        <!-- Items -->
                      </div>

                      <!-- Write comment -->
                      <!-- Write comment -->
                      <div class="row">
                        <div class="col-auto">
                          <!-- Avatar -->
                          <div class="avatar avatar-sm">
                            <img
                              v-if="authInfo.image"
                              :src="authInfo.image"
                              :alt="authInfo.name"
                              class="avatar-img rounded-circle"
                            />
                            <img
                              v-else
                              src="/images/default.jpg"
                              :alt="authInfo.name"
                              class="avatar-img rounded-circle"
                            />
                          </div>
                        </div>
                        <div class="col ml-n2">
                          <!-- Input -->
                          <form class="mt-1">
                            <label class="sr-only">Leave a comment...</label>
                            <textarea
                              class="form-control form-control-flush"
                              data-toggle="autosize"
                              rows="2"
                              placeholder="Leave a comment"
                              v-model="comment_text"
                            ></textarea>
                          </form>
                        </div>
                        <div class="col-auto align-self-end">
                          <!-- Icons -->
                          <div class="text-muted mb-2">
                            <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Add photo">
                              <i class="fe fe-camera"></i>
                            </a>-->
                            <button
                              v-if="!loading"
                              @click="commentText(vlog.feed_id)"
                              type="button"
                              class="conmment_send"
                            >
                              <!-- <i class="fas fa-caret-right"></i> -->
                              <i class="fas fa-paper-plane"></i>
                            </button>
                            <Button v-if="loading" loading shape="circle" type="primary"></Button>
                          </div>
                        </div>
                      </div>
                      <!-- Write comment -->
                      <!-- Write comment -->
                    </div>
                    <!-- Comment -->
                  </div>
                  <!-- Card -->
                </template>

                <template v-else>
                  <!-- Card -->
                  <div class="card">
                    <div class="_3card _border_radious _mar_b20 _padd25">
                      <div class="silience_section_all _padd25">
                        <h4 class="silience_section_h4">No post...</h4>
                      </div>
                    </div>
                  </div>
                  <!-- Card -->
                </template>
              </div>
              <!-- Left Section -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--===== Main Content ======-->
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  components: {
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([
        app.$axios.get(`/getUserVlogById/${params.id}`)
      ]);
      // console.log(data)
      if (!res1.data) {
        redirect("/");
      }
      return {
        vlog: res1.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      comment_text: "",
      loading: false
    };
  },

  methods: {
    async commentText(feed_id) {
      if (this.comment_text == "") {
        return;
      }
      if (this.comment_text.length > 3000) {
        this.wr(
          "Comment character limit is 3,000, your comment is " +
            this.comment_text.length +
            " character long!"
        );
        return;
      }
      // console.log("feed_id= " + feed_id);
      // console.log(this.comment_text);
      if (feed_id == 0) {
        this.e("This item was not added on feed page !");
        this.comment_text = "";
        return;
      }

      const res = await this.callApi("post", "/postComment", {
        feed_id: feed_id,
        text: this.comment_text
      });
      if (res.status === 200) {
        this.s("Comment posted Successfully !");
      } else {
        this.swr();
        return;
      }
      let user = {
        name: this.authInfo.name,
        username: this.authInfo.username,
        verification_status: this.authInfo.verification_status,
        role: this.authInfo.role,
        image: this.authInfo.image
      };
      res.data.user = user;
      this.vlog.comments.push(res.data);
      // console.log(res.data)
      this.comment_text = "";
    },

    async user_like_action(feed_id, feed_owner_id) {
      // check if user have atlest 3 token
      if (feed_owner_id == this.authInfo.id) {
        return this.wr("Can not like your own item!");
      }

      // check if user have atlest 3 token
      if (this.currentTotalToken(this.userTokens) < this.likeTokenValue) {
        return this.wr(
          "You need altest " + this.likeTokenValue + " tokens for like"
        );
      }

      // console.log(feed_id)
      if (this.vlog.userLike != null) {
        // call delete feed like
        const res = await this.callApi("post", "/deleteFeedLike", {
          feed_id: feed_id
        });
        if (res.status === 200) {
          // this.s('Like removed')
          this.vlog.userLike = null;
          this.vlog.__meta__.like_count--;
          this.s("You removed like!");
          if (res.data.token_value) {
            this.$store.dispatch(
              "updateUserReceivedTokens",
              res.data.token_value
            );
            this.in("Got back " + res.data.token_value + " tokens!");
          }
        } else {
          this.swr();
        }
        return;
      } else {
        // call like feed api
        const res = await this.callApi("post", "/postFeedLike", {
          feed_id: feed_id
        });
        // console.log(res)
        if (res.status === 200) {
          // this.s('Liked ')
          this.vlog.userLike = res.data.like;
          this.vlog.__meta__.like_count++;
          this.s("You liked an item!");
          if (res.data.token_value > 0) {
            this.$store.dispatch(
              "updateUserDeductedTokens",
              res.data.token_value
            );
            this.in(res.data.token_value + " tokens is deducted!");
          }
        } else {
          this.swr();
        }
      }
    }
  }
};
</script>

