<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header"></div>
      <div class="container">
        <div class="row justify-content-center">
          <!-- Left Section -->
          <div class="col-12 col-md-9 order-9 order-md-4">
            <div class="_collage">
              <div class="row">
                <!-- collage -->
                <div class="col-md-12">
                  <div class="vlog_area">
                    <div class="row">
                      <!-- ITEM -->
                      <div class="col-md-12">
                        <div class="card">
                          <div class="_border_radious _mar_b20 _padd15">
                            <grid-layout
                              :layout.sync="collage.linkedProducts"
                              :col-num="6"
                              :row-height="15"
                              :is-draggable="false"
                              :is-resizable="false"
                              :is-mirrored="false"
                              :vertical-compact="true"
                              :margin="[10, 10]"
                              :use-css-transforms="true"
                            >
                              <grid-item
                                v-for="(item) in collage.linkedProducts"
                                :key="item.i"
                                :x="item.x"
                                :y="item.y"
                                :w="item.w"
                                :h="item.h"
                                :i="item.i"
                              >
                                <img
                                  :src="item.product.productImages[0].image"
                                  style="width:'100%;height:100%;cursor:pointer"
                                  @click="$router.push(`/product_details/${item.product.id}`);"
                                />
                              </grid-item>
                            </grid-layout>

                            <div class="mb-3">
                              <div class="row">
                                <div class="col">
                                  <div class="all_react">
                                    <div class="react_left">
                                      <ul>
                                        <li
                                          class="_cursor"
                                          v-if="collage.userLike!=null"
                                          @click="user_like_action(collage.feed_id,collage.user_id)"
                                        >
                                          <i class="fas fa-thumbs-up"></i>
                                        </li>
                                        <li
                                          class="_cursor"
                                          v-else
                                          @click="user_like_action(collage.feed_id,collage.user_id)"
                                        >
                                          <i class="fas fa-thumbs-up icon_color"></i>
                                        </li>
                                      </ul>
                                    </div>
                                    <div class="react_right">
                                      <ul>
                                        <li>
                                          <i class="fas fa-thumbs-up"></i>
                                          {{collage.__meta__.like_count}}
                                        </li>
                                        <li>
                                          <i class="fas fa-comments"></i>
                                          {{collage.comments.length}}
                                        </li>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <hr />
                            </div>
                          </div>

                          <!-- Comment -->
                          <div class="_1comment _box_shadow _border_radious _mar_b20 _padd25">
                            <div class="_border_color _all_comment img_cmnt">
                              <!-- Items -->
                              <div
                                class="_1comment_list _border_color"
                                v-for="comment in collage.comments"
                                :key="comment.id"
                              >
                                <div class="_1comment_list_left">
                                  <nuxt-link
                                    v-if="comment.user"
                                    class="avatar avatar-sm"
                                    :to="comment.user.role==2? `/collage/user/${comment.user.username}` : `/store/${comment.user.username}`"
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
                                    <div v-if="comment.user.verification_status==4" class="_active">
                                      <i class="fas fa-check"></i>
                                    </div>
                                  </nuxt-link>
                                </div>
                                <div class="_1comment_list_right">
                                  <h3
                                    class="_1comment_list_right_text _title"
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
                                    @click="commentText(collage.feed_id)"
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
                          </div>
                          <!-- Comment -->
                        </div>
                      </div>
                      <!-- ITEM -->
                    </div>
                  </div>
                </div>
                <!-- collage -->
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
  middleware: ["authenticated"],
  components: {
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([
        app.$axios.get(`/getCollageById/${params.id}`)
      ]);
      // console.log(data)
      if (!res1.data) {
        redirect("/");
      }
      return {
        collage: res1.data
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
      this.loading = true;

      const res = await this.callApi("post", "/postComment", {
        feed_id: feed_id,
        text: this.comment_text
      });
      if (res.status === 200) {
        this.s("Comment posted Successfully !");
        // console.log(res);
        // this.$router.push(`/product_details/${res.data.id}`);
      } else {
        this.swr();
        this.loading = false;
        return;
      }

      res.data.user = {
        name: this.authInfo.name,
        username: this.authInfo.username,
        verification_status: this.authInfo.verification_status,
        role: this.authInfo.role,
        image: this.authInfo.image
      }
      this.collage.comments.push(res.data);

      this.comment_text = "";
      this.loading = false;
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

      if (feed_id == 0) {
        this.e("This item was not added on feed page !");
        this.comment_text = "";
        return;
      }
      // console.log(feed_id)
      if (this.collage.userLike != null) {
        // call delete feed like
        const res = await this.callApi("post", "/deleteFeedLike", {
          feed_id: feed_id
        });
        if (res.status === 200) {
          // this.s('Like removed')
          this.collage.userLike = null;
          this.collage.__meta__.like_count--;
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
          this.collage.userLike = res.data.like;
          this.collage.__meta__.like_count++;
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
<style  scoped>
  .ivu-btn-primary {
    color: #fff;
    background-color: #28b9b9;
    border-color: #28b9b9;
  }
</style>

