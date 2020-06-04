<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div >

      <!-- MAIN CONTENT
      ==================================================-->

      <!-- <div class="container" @scroll="onScroll"> -->

      <div class="container" >
        <div class="row mt-4 mt-md-5">
          <div class="col-12 col-xl-8">
            <!-- <Scroll :on-reach-bottom="handleReachBottom" height='1000'> -->
            <!-- write stauts -->
            <div class="card" v-if="authInfo.role==2">
              <div class="card-body">
                <!-- Form -->
                <!-- <form> -->
                <div>
                  <div class="form-group">
                    <!-- <textarea class="form-control form-control-flush form-control-auto" data-toggle="autosize" rows="3" placeholder="Write a status..."></textarea> -->
                    <Input
                      v-model="status_text"
                      type="textarea"
                      :autosize="{minRows: 5, maxRows: 15}"
                      placeholder="Write a status..."
                    />
                  </div>
                  <div class="col-12 col-md-8 col-lg-8">
                    <div class="_input_group">
                      <!-- <p class="_label">Upload Product Images</p> -->
                      <!-- <input class="_int" type="file" name="pic" accept="image/*"> -->
                      <div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
                        <template v-if="item.status === 'finished'">
                          <img :src="item.url" />
                          <div class="demo-upload-list-cover">
                            <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                            <Icon type="ios-trash-outline" @click.native="handleRemove(item,index)"></Icon>
                          </div>
                        </template>
                        <template v-else>
                          <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
                        </template>
                      </div>
                      <Upload
                        ref="upload"
                        :show-upload-list="false"
                        :default-file-list="defaultList"
                        :on-success="handleSuccess"
                        :format="['jpg','jpeg','png']"
                        :max-size="5000"
                        :on-format-error="handleFormatError"
                        :on-exceeded-size="handleMaxSize"
                        :before-upload="handleBeforeUpload"
                        multiple
                        type="drag"
                        action="/uploadImages"
                        style="display: inline-block;width:58px;"
                      >
                        <div style="width: 58px;height:58px;line-height: 58px;">
                          <Icon type="ios-camera" size="20"></Icon>
                        </div>
                      </Upload>
                      <Modal title="View Image" v-model="visible">
                        <!-- <img :src="'https://o5wwk8baw.qnssl.com/' + imgURL + '/large'" v-if="visible" style="width: 100%"> -->
                        <img :src="imgURL" v-if="visible" style="width: 100%" />
                      </Modal>
                    </div>
                  </div>
                </div>
                <!-- </form> -->

                <!-- Footer -->
                <div class="row align-items-center">
                  <div class="col">
                    <!-- Symbols -->
                    <small class="text-muted">
                      <!-- 0/500 -->
                      {{status_text_length}}/5000
                    </small>
                  </div>
                  <div class="col-auto">
                    <!-- Icons -->
                    <div class="text-muted">
                      <button
                        v-if="!loading_status"
                        @click="cresteStatus"
                        type="button"
                        class="conmment_send"
                      >
                        <!-- <i class="fas fa-caret-right"></i> -->
                        <i class="fas fa-paper-plane"></i>
                      </button>
                      <Button v-if="loading_status" loading shape="circle" type="primary"></Button>
                      <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Add photo">
                        <i class="fe fe-camera"></i>
                      </a>-->
                      <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Attach file">
                        <i class="fe fe-paperclip"></i>
                      </a>
                      <a class="text-reset" href="#!" data-toggle="tooltip" title="Record audio">
                        <i class="fe fe-mic"></i>
                      </a>-->
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- write stauts -->

            <!-- Story -->
            <div class="_story" v-if="stories.length">
              <div class="card _story_all">
                <div class="_story_top">
                  <p class="_story_tite">Stories</p>

                  <!-- <a href="" class="_story_link">See all</a> -->
                  <nuxt-link class="_story_link" to="/story">See all</nuxt-link>
                </div>

                <div class="_story_main">
                  <div class="row">
                    <!-- Item -->
                    <div
                      class="col-12 col-md-3 col-lg-3"
                      v-for="(item,index) in stories"
                      :key="index"
                    >
                      <div @click="$router.push(`/lookbook/details/${item.id}`)" class="_story_pic">
                        <img class="_story_img" :src="item.image" alt title />
                        <div class="_story_pro_img">
                          <img
                            v-if="item.user && item.user.image"
                            class="_story_pro_pic"
                            :src="item.user.image"
                            alt
                            title
                          />
                          <img v-else class="_story_pro_pic" src="/images/default.jpg" alt title />
                        </div>

                        <p v-if="item.user" class="_story_pro_name">@{{item.user.name}}</p>
                      </div>
                    </div>
                    <!-- Item -->

                    <!-- Item -->
                    <!-- <div class="col-12 col-md-3 col-lg-3">
                      <div class="_story_pic">
                        <img class="_story_img" src="/uploads/1574241484660.jpeg" alt="" title="">
                      </div>
                    </div>-->
                    <!-- Item -->
                  </div>
                </div>
              </div>
            </div>
            <!-- Story -->

            <!-- <Scroll :on-reach-bottom="handleReachBottom" height='1000' :on-reach-edge="handleReachEdge" :distance-to-edge='handleReachBottom'> -->
            <!-- loop div -->
            <div v-for="(feed,index) in feeds" :key="feed.id">
              <!--======= status =========-->
              <!-- Card -->
              <div v-if="feed.type=='status' && feed.status" class="card">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="feed.status.user"
                          class="avatar"
                          :to="`/status/user/${feed.status.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="feed.status.user"
                          class="avatar"
                          :to="`/${feed.status.user.username}/status`"
                        >
                          <!-- <img
                            v-if="feed.status.user && feed.status.user.image"
                            @click="$router.push(`/status/user/${feed.status.user.username}`)"
                            :src="feed.status.user.image"
                            :alt="feed.status.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-if="feed.status.user && feed.status.user.image"
                            @click="$router.push(`/${feed.status.user.username}/status`)"
                            :src="feed.status.user.image"
                            :alt="feed.status.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <!-- <img
                            v-else
                            @click="$router.push(`/status/user/${feed.status.user.username}`)"
                            src="/images/default.jpg"
                            :alt="feed.status.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-else
                            @click="$router.push(`/${feed.status.user.username}/status`)"
                            src="/images/default.jpg"
                            :alt="feed.status.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="feed.status.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                      </div>
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <!-- <h4 class="card-title mb-1" >status</h4> -->
                          <!-- <h4
                            @click="$router.push(`/status/user/${feed.status.user.username}`)"
                            v-if="feed.status.user"
                            class="_cursor card-title mb-1"
                          >{{feed.status.user.name}}</h4> -->
                          <h4
                            @click="$router.push(`/${feed.status.user.username}/status`)"
                            v-if="feed.status.user"
                            class="_cursor card-title mb-1"
                          >{{feed.status.user.name}}</h4>
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <li class="time_li">{{feed.status.created_at | myDate}}</li>
                            <!-- <li
                              @click="$router.push(`/status/user/${feed.status.user.username}`)"
                              class="name_li"
                            >Status</li>-->
                          </ul>
                        </div>
                      </div>
                      <!-- Dropdown option-->
                      <!-- <div class="col-auto" v-if="feed.status.user_id==authInfo.id">
                        <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
                          <div
                            class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" :aria-expanded="selected_index==index"
                            >
                            <i class="fas fa-ellipsis-v"></i>
                          </div>
                          <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                            <nuxt-link :to="`/status_edit/${feed.status_id}`" class="dropdown-item">Edit</nuxt-link>
                            <button
                              @click="confirmDelete(status.id,index)"
                              class="dropdown-item"
                            >Delete</button>
                          </div>
                        </div>
                      </div>-->
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- title -->
                  <!-- <h4 class="silience_section_h4">{{feed.status.title}}</h4> -->
                  <!-- Image -->
                  <!-- <p class="text-center mb-3">
                    <img
                      v-if="feed.status.feature_image"
                      :src="feed.status.feature_image"
                      alt="status pic"
                      class="img-fluid rounded"
                    />
                  </p>-->
                  <!-- Text -->
                  <div class="first_sec_all">
                    <p v-html="feed.status.text" class="mb-3"></p>
                    <div class="first_sec_link">
                      <!-- <nuxt-link :to="`/status/details/${feed.status.id}`">Read More</nuxt-link> -->
                    </div>

                    <div class="_card_image_all" v-if="feed.status.images.length">
                      <!-- Items -->
                      <div
                        class="_card_image_main"
                        v-for="(item,index) in feed.status.images"
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

                      <!-- Items -->
                      <!-- <div class="_card_image_main">
                        <div class="_card_image">
                          <img class="_card_image_pic" src="/uploads/1574923357292.jpeg" alt="" title="">
                        </div>
                      </div>-->
                      <!-- Items -->

                      <!-- Items -->
                      <!-- <div class="_card_image_main">
                        <div class="_card_image">
                          <img class="_card_image_pic" src="/uploads/1574923357292.jpeg" alt="" title="">
                        </div>
                      </div>-->
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

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li
                                class="_cursor"
                                v-if="feed.userLike!=null"
                                @click="user_status_like_action(index,feed.id,feed.status.user.id)"
                              >
                                <i class="fas fa-thumbs-up"></i>
                              </li>
                              <li
                                class="_cursor"
                                v-else
                                @click="user_status_like_action(index,feed.id,feed.status.user.id)"
                              >
                                <i class="fas fa-thumbs-up icon_color"></i>
                              </li>
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{feed.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{feed.status.comments.length}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Comments loop -->
                  <div
                    class="comment mb-3"
                    v-for="comment in feed.status.comments"
                    :key="comment.id"
                  >
                    <div class="row">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/status/user/${comment.user.username}` : `/store/${comment.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/${comment.user.username}/status` : `/store/${comment.user.username}`"
                        >
                          <img
                            v-if="comment.user.image"
                            :src="comment.user.image"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <img
                            v-else
                            src="/images/default.jpg"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="comment.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                        <!-- </a> -->
                      </div>
                      <div class="col ml-n2">
                        <!-- Body -->
                        <div class="comment-body">
                          <div class="row">
                            <div class="col">
                              <!-- Title -->
                              <h5 class="comment-title">{{comment.user.name}}</h5>
                            </div>
                            <div class="col-auto">
                              <!-- Time -->
                              <!-- <time class="comment-time">11:12</time> -->
                              <time class="comment-time">{{comment.created_at | myDate}}</time>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Text -->
                          <p class="comment-text">{{comment.text}}</p>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- Comments loop -->

                  <!-- Divider -->
                  <hr v-if="feed.status.comments.length" />

                  <!-- Form -->
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
                          v-model="comment_text[feed.id]"
                          class="form-control form-control-flush"
                          data-toggle="autosize"
                          rows="2"
                          placeholder="Leave a comment"
                        ></textarea>
                      </form>
                    </div>
                    <div class="col-auto align-self-end">
                      <!-- Icons -->
                      <div class="text-muted mb-2">
                        <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Add photo">
                          <i class="fas fa-ellipsis-v"></i>
                        </a>-->
                        <button
                          v-if="!loading"
                          @click="commentText(feed.id,index)"
                          type="button"
                          class="conmment_send"
                        >
                          <!-- <i class="fas fa-caret-right"></i> -->
                          <i class="fas fa-paper-plane"></i>
                        </button>
                        <Button
                          v-if="comment_index==index && loading"
                          loading
                          shape="circle"
                          type="primary"
                        ></Button>
                      </div>
                    </div>
                  </div>
                  <!-- / .row -->
                </div>
              </div>
              <!--======= status =========-->

              <!--======= Blog =========-->
              <!-- Card -->
              <div v-if="feed.type=='blog' && feed.blog" class="card">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="feed.blog.user"
                          class="avatar"
                          :to="`/blog/user/${feed.blog.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="feed.blog.user"
                          class="avatar"
                          :to="`/${feed.blog.user.username}/blog`"
                        >
                          <!-- <img
                            v-if="feed.blog.user && feed.blog.user.image"
                            @click="$router.push(`/blog/user/${feed.blog.user.username}`)"
                            :src="feed.blog.user.image"
                            :alt="feed.blog.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-if="feed.blog.user && feed.blog.user.image"
                            @click="$router.push(`/${feed.blog.user.username}/blog`)"
                            :src="feed.blog.user.image"
                            :alt="feed.blog.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <!-- <img
                            v-else
                            @click="$router.push(`/blog/user/${feed.blog.user.username}`)"
                            src="/images/default.jpg"
                            :alt="feed.blog.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-else
                            @click="$router.push(`/${feed.blog.user.username}/blog`)"
                            src="/images/default.jpg"
                            :alt="feed.blog.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="feed.blog.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                      </div>
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <!-- <h4
                            @click="$router.push(`/blog/user/${feed.blog.user.username}`)"
                            v-if="feed.blog.user"
                            class="_cursor card-title mb-1"
                          >{{feed.blog.user.name}}</h4> -->
                          <h4
                            @click="$router.push(`/${feed.blog.user.username}/blog`)"
                            v-if="feed.blog.user"
                            class="_cursor card-title mb-1"
                          >{{feed.blog.user.name}}</h4>
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <li class="time_li">{{feed.blog.created_at | myDate}}</li>
                            <!-- <li
                              @click="$router.push(`/blog/user/${feed.blog.user.username}`)"
                              class="name_li"
                            >Blog</li>-->
                          </ul>
                        </div>
                      </div>
                      <!-- Dropdown option-->
                      <!-- <div class="col-auto" v-if="feed.blog.user_id==authInfo.id">
                        <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
                          <div
                            class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" :aria-expanded="selected_index==index"
                            >
                            <i class="fas fa-ellipsis-v"></i>
                          </div>
                          <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                            <nuxt-link :to="`/blog_edit/${feed.blog_id}`" class="dropdown-item">Edit</nuxt-link>
                            <button
                              @click="confirmDelete(blog.id,index)"
                              class="dropdown-item"
                            >Delete</button>
                          </div>
                        </div>
                      </div>-->
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- title -->
                  <h4 class="silience_section_h4">{{feed.blog.title}}</h4>
                  <!-- Image -->
                  <p class="text-center mb-3">
                    <img
                      v-if="feed.blog.feature_image"
                      :src="feed.blog.feature_image"
                      alt="blog pic"
                      class="img-fluid rounded"
                    />
                  </p>
                  <!-- Text -->
                  <div class="first_sec_all">
                    <!-- <p v-html="feed.blog.text" class="mb-3">....</p> -->
                    <p v-html="shortenText(feed.blog.text)" class="mb-3">....</p>
                    <div class="first_sec_link">
                      <nuxt-link
                        v-if="feed.blog.text.length>800"
                        :to="`/blog/details/${feed.blog.id}`"
                      >Read More</nuxt-link>
                    </div>
                  </div>

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li
                                class="_cursor"
                                v-if="feed.userLike!=null"
                                @click="user_like_action(index,feed.id,feed.blog.user.id)"
                              >
                                <i class="fas fa-thumbs-up"></i>
                              </li>
                              <li
                                class="_cursor"
                                v-else
                                @click="user_like_action(index,feed.id,feed.blog.user.id)"
                              >
                                <i class="fas fa-thumbs-up icon_color"></i>
                              </li>
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{feed.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{feed.blog.comments.length}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Comments loop -->
                  <div class="comment mb-3" v-for="comment in feed.blog.comments" :key="comment.id">
                    <div class="row">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/blog/user/${comment.user.username}` : `/store/${comment.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/${comment.user.username}/blog` : `/store/${comment.user.username}`"
                        >
                          <img
                            v-if="comment.user.image"
                            :src="comment.user.image"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <img
                            v-else
                            src="/images/default.jpg"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="comment.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                        <!-- </a> -->
                      </div>
                      <div class="col ml-n2">
                        <!-- Body -->
                        <div class="comment-body">
                          <div class="row">
                            <div class="col">
                              <!-- Title -->
                              <h5 class="comment-title">{{comment.user.name}}</h5>
                            </div>
                            <div class="col-auto">
                              <!-- Time -->
                              <!-- <time class="comment-time">11:12</time> -->
                              <time class="comment-time">{{comment.created_at | myDate}}</time>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Text -->
                          <p class="comment-text">{{comment.text}}</p>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- Comments loop -->

                  <!-- Divider -->
                  <hr v-if="feed.blog.comments.length" />

                  <!-- Form -->
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
                          v-model="comment_text[feed.id]"
                          class="form-control form-control-flush"
                          data-toggle="autosize"
                          rows="2"
                          placeholder="Leave a comment"
                        ></textarea>
                      </form>
                    </div>
                    <div class="col-auto align-self-end">
                      <!-- Icons -->
                      <div class="text-muted mb-2">
                        <!-- <a class="text-reset mr-3" href="#!" data-toggle="tooltip" title="Add photo">
                          <i class="fas fa-ellipsis-v"></i>
                        </a>-->
                        <button
                          v-if="!loading"
                          @click="commentText(feed.id,index)"
                          type="button"
                          class="conmment_send"
                        >
                          <!-- <i class="fas fa-caret-right"></i> -->
                          <i class="fas fa-paper-plane"></i>
                        </button>
                        <Button
                          v-if="comment_index==index && loading"
                          loading
                          shape="circle"
                          type="primary"
                        ></Button>
                      </div>
                    </div>
                  </div>
                  <!-- / .row -->
                </div>
              </div>
              <!--======= Blog =========-->

              <!--======== Vlog ========-->
              <!-- card-->
              <div v-if="feed.type=='vlog' && feed.vlog" class="card">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="feed.vlog.user"
                          class="avatar"
                          :to="`/vlog/user/${feed.vlog.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="feed.vlog.user"
                          class="avatar"
                          :to="`/${feed.vlog.user.username}/vlog`"
                        >
                          <!-- <img
                            v-if="feed.vlog.user && feed.vlog.user.image"
                            @click="$router.push(`/vlog/user/${feed.vlog.user.username}`)"
                            :src="feed.vlog.user.image"
                            :alt="feed.vlog.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-if="feed.vlog.user && feed.vlog.user.image"
                            @click="$router.push(`/${feed.vlog.user.username}/vlog`)"
                            :src="feed.vlog.user.image"
                            :alt="feed.vlog.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <!-- <img
                            v-else
                            @click="$router.push(`/vlog/user/${feed.vlog.user.username}`)"
                            src="/images/default.jpg"
                            :alt="feed.vlog.user.name"
                            class="avatar-img rounded-circle"
                          /> -->
                          <img
                            v-else
                            @click="$router.push(`/${feed.vlog.user.username}/vlog`)"
                            src="/images/default.jpg"
                            :alt="feed.vlog.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="feed.vlog.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                      </div>
                      <div class="col ml-n2">
                        <!-- Title -->
                        <div class="blog_title">
                          <!-- <h4 class="card-title mb-1">Vlog</h4> -->
                          <!-- <h4
                            @click="$router.push(`/vlog/user/${feed.vlog.user.username}`)"
                            v-if="feed.vlog.user"
                            class="_cursor card-title mb-1"
                          >{{feed.vlog.user.name}}</h4> -->
                          <h4
                            @click="$router.push(`/${feed.vlog.user.username}/vlog`)"
                            v-if="feed.vlog.user"
                            class="_cursor card-title mb-1"
                          >{{feed.vlog.user.name}}</h4>
                        </div>
                        <div class="blog_time">
                          <ul class="blog_time_ul dis_flx">
                            <li class="time_li">{{feed.vlog.created_at | myDate}}</li>
                            <!-- <li
                              @click="$router.push(`/vlog/user/${feed.vlog.user.id}`)"
                              class="name_li"
                            >@{{feed.vlog.user.name}}</li>-->
                            <!-- <li
                              @click="$router.push(`/vlog/user/${feed.vlog.user.username}`)"
                              class="name_li"
                            >Vlog</li>-->
                          </ul>
                        </div>
                      </div>
                      <!-- Dropdown option-->
                      <!-- <div class="col-auto" v-if="feed.vlog.user_id==authInfo.id">
                        <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
                          <div
                            class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" :aria-expanded="selected_index==index"
                            >
                            <i class="fas fa-ellipsis-v"></i>
                          </div>
                          <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                            <nuxt-link :to="`/vlog_edit/${feed.vlog_id}`" class="dropdown-item">Edit</nuxt-link>
                            <button
                              @click="confirmDelete(blog.id,index)"
                              class="dropdown-item"
                            >Delete</button>
                          </div>
                        </div>
                      </div>-->
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- title -->
                  <h4 class="silience_section_h4">{{feed.vlog.title}}</h4>
                  <!-- Image -->
                  <p class="text-center mb-3">
                    <!-- <img src="/img/posts/post-1.jpg" alt="..." class="img-fluid rounded"> -->
                    <video v-if="feed.vlog.video" width="100%" controls="controls">
                      <source :src="feed.vlog.video" type="video/mp4" />Your browser does not support HTML5 video.
                    </video>
                  </p>
                  <!-- Text -->
                  <div class="first_sec_all">
                    <!-- <p v-html="feed.vlog.text" class="mb-3">....</p> -->
                    <p v-html="shortenText(feed.vlog.text)" class="mb-3">....</p>
                    <div class="first_sec_link">
                      <nuxt-link
                        v-if="feed.vlog.text.length>800"
                        :to="`/vlog/details/${feed.vlog.id}`"
                      >Read More</nuxt-link>
                    </div>
                  </div>

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li
                                class="_cursor"
                                v-if="feed.userLike!=null"
                                @click="user_like_action(index,feed.id,feed.vlog.user.id)"
                              >
                                <i class="fas fa-thumbs-up"></i>
                              </li>
                              <li
                                class="_cursor"
                                v-else
                                @click="user_like_action(index,feed.id,feed.vlog.user.id)"
                              >
                                <i class="fas fa-thumbs-up icon_color"></i>
                              </li>
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{feed.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{feed.vlog.comments.length}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Comments loop -->
                  <div class="comment mb-3" v-for="comment in feed.vlog.comments" :key="comment.id">
                    <div class="row">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
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
                            v-if="comment.user.image"
                            :src="comment.user.image"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <img
                            v-else
                            src="/images/default.jpg"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="comment.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                        <!-- </a> -->
                      </div>
                      <div class="col ml-n2">
                        <!-- Body -->
                        <div class="comment-body">
                          <div class="row">
                            <div class="col">
                              <!-- Title -->
                              <h5 class="comment-title">{{comment.user.name}}</h5>
                            </div>
                            <div class="col-auto">
                              <!-- Time -->
                              <!-- <time class="comment-time">11:12</time> -->
                              <time class="comment-time">{{comment.created_at | myDate}}</time>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Text -->
                          <p class="comment-text">{{comment.text}}</p>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- Comments loop -->

                  <!-- Divider -->
                  <hr v-if="feed.vlog.comments.length" />

                  <!-- Form -->
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
                          v-model="comment_text[feed.id]"
                          class="form-control form-control-flush"
                          data-toggle="autosize"
                          rows="2"
                          placeholder="Leave a comment"
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
                          @click="commentText(feed.id,index)"
                          type="button"
                          class="conmment_send"
                        >
                          <!-- <i class="fas fa-caret-right"></i> -->
                          <i class="fas fa-paper-plane"></i>
                        </button>
                        <Button
                          v-if="comment_index==index && loading"
                          loading
                          shape="circle"
                          type="primary"
                        ></Button>
                      </div>
                    </div>
                  </div>
                  <!-- / .row -->
                </div>
              </div>
              <!--======== Vlog ========-->

              <!--==== Lookbook =======-->
              <!-- card -->
              <div v-if="feed.type=='lookbook' && feed.lookbook" class="card">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="row row_all">
                        <div class="col-md-12" style="display:flex">
                          <div class="col-auto img_cmnt">
                            <!-- Avatar -->
                            <!-- <nuxt-link
                              v-if="feed.lookbook.user"
                              class="avatar"
                              :to="`/lookbook/user/${feed.lookbook.user.username}`"
                            > -->
                            <nuxt-link
                              v-if="feed.lookbook.user"
                              class="avatar"
                              :to="`/${feed.lookbook.user.username}`"
                            >
                              <!-- <img
                                v-if="feed.lookbook.user && feed.lookbook.user.image"
                                @click="$router.push(`/lookbook/user/${feed.lookbook.user.username}`)"
                                :src="feed.lookbook.user.image"
                                :alt="feed.lookbook.user.name"
                                class="avatar-img rounded-circle"
                              /> -->
                              <img
                                v-if="feed.lookbook.user && feed.lookbook.user.image"
                                @click="$router.push(`/${feed.lookbook.user.username}`)"
                                :src="feed.lookbook.user.image"
                                :alt="feed.lookbook.user.name"
                                class="avatar-img rounded-circle"
                              />
                              <!-- <img
                                v-else
                                @click="$router.push(`/lookbook/user/${feed.lookbook.user.username}`)"
                                src="/images/default.jpg"
                                :alt="feed.lookbook.user.name"
                                class="avatar-img rounded-circle"
                              /> -->
                              <img
                                v-else
                                @click="$router.push(`/${feed.lookbook.user.username}`)"
                                src="/images/default.jpg"
                                :alt="feed.lookbook.user.name"
                                class="avatar-img rounded-circle"
                              />
                              <div v-if="feed.lookbook.user.verification_status==4" class="_active">
                                <i class="fas fa-check"></i>
                              </div>
                            </nuxt-link>
                          </div>
                          <div class="col ml-n2">
                            <!-- Title -->
                            <div class="blog_title">
                              <!-- <h4 class="card-title mb-1">lookbook</h4> -->
                              <!-- <h4
                                @click="$router.push(`/lookbook/user/${feed.lookbook.user.username}`)"
                                v-if="feed.lookbook.user"
                                class="_cursor card-title mb-1"
                              >{{feed.lookbook.user.name}}</h4> -->
                              <h4
                                @click="$router.push(`/${feed.lookbook.user.username}`)"
                                v-if="feed.lookbook.user"
                                class="_cursor card-title mb-1"
                              >{{feed.lookbook.user.name}}</h4>
                            </div>
                            <div class="blog_time">
                              <ul class="blog_time_ul dis_flx">
                                <li class="time_li">{{feed.lookbook.created_at | myDate}}</li>
                                <!-- <li
                                  @click="$router.push(`/lookbook/user/${feed.lookbook.user.username}`)"
                                  class="name_li"
                                >Lookbook</li>-->
                              </ul>
                            </div>
                          </div>
                          <!-- Dropdown option-->
                          <!-- <div class="col-auto" v-if="feed.lookbook.user_id==authInfo.id">
                            <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
                              <div
                                class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" :aria-expanded="selected_index==index"
                                >
                                <i class="fas fa-ellipsis-v"></i>
                              </div>
                              <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                                <nuxt-link :to="`/lookbook_edit/${feed.lookbook_id}`" class="dropdown-item">Edit</nuxt-link>
                                <button
                                  @click="confirmDelete(blog.id,index)"
                                  class="dropdown-item"
                                >Delete</button>
                              </div>
                            </div>
                          </div>-->
                        </div>
                        <div class="col-md-12">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="_po_rel _mar_t30 _mar_b30">
                                <!-- <img src="/uploads/1573622807648.jpeg" alt="image" /> -->
                                <img
                                  @click="$router.push(`/lookbook/details/${feed.lookbook.id}`)"
                                  :src="feed.lookbook.image"
                                  class="_cursor"
                                  alt="image"
                                />
                                <ul class="post_img_link">
                                  <li
                                    v-for="(item) in feed.lookbook.linkedProducts"
                                    :key="item.id"
                                    :style="{'left':item.x_cor+'%','top':item.y_cor+2+'%'}"
                                  >
                                    <span class="_cursor" @click="showSModal(item.product,index)">
                                      <i class="fas fa-plus"></i>
                                    </span>
                                  </li>
                                </ul>
                              </div>
                              <template v-if="sModal && modal_index==index">
                                <div class="post_img_effect post_img_effect1">
                                  <div class="post_img_effect_pic">
                                    <img
                                      :src="s_modal_product.productImages[0].image"
                                      alt="product"
                                    />
                                  </div>
                                  <h3 class="post_img_effect_title">{{s_modal_product.title }}</h3>
                                  <p class="post_img_effect_price">${{s_modal_product.price}}</p>
                                  <div class="post_img_effect_btm _border_color">
                                    <Button
                                      @click="$router.push(`/product_details/${s_modal_product.id}`)"
                                      class="ivu-btn ivu-btn-default"
                                    >Details</Button>
                                  </div>
                                  <span @click="sModalCheck">
                                    <i class="fas fa-times cross_modal"></i>
                                  </span>
                                </div>
                              </template>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li
                                class="_cursor"
                                v-if="feed.userLike!=null"
                                @click="user_like_action(index,feed.id,feed.lookbook.user.id)"
                              >
                                <i class="fas fa-thumbs-up"></i>
                              </li>
                              <li
                                class="_cursor"
                                v-else
                                @click="user_like_action(index,feed.id,feed.lookbook.user.id)"
                              >
                                <i class="fas fa-thumbs-up icon_color"></i>
                              </li>
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{feed.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{feed.lookbook.comments.length}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Comments loop -->
                  <div
                    class="comment mb-3"
                    v-for="comment in feed.lookbook.comments"
                    :key="comment.id"
                  >
                    <div class="row">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/lookbook/user/${comment.user.username}` : `/store/${comment.user.username}`"
                        > -->
                        <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/${comment.user.username}` : `/store/${comment.user.username}`"
                        >
                          <img
                            v-if="comment.user.image"
                            :src="comment.user.image"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <img
                            v-else
                            src="/images/default.jpg"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="comment.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                        <!-- </a> -->
                      </div>
                      <div class="col ml-n2">
                        <!-- Body -->
                        <div class="comment-body">
                          <div class="row">
                            <div class="col">
                              <!-- Title -->
                              <h5 class="comment-title">{{comment.user.name}}</h5>
                            </div>
                            <div class="col-auto">
                              <!-- Time -->
                              <!-- <time class="comment-time">11:12</time> -->
                              <time class="comment-time">{{comment.created_at | myDate}}</time>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Text -->
                          <p class="comment-text">{{comment.text}}</p>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- Comments loop -->

                  <!-- Divider -->
                  <hr v-if="feed.lookbook.comments.length" />

                  <!-- Form -->
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
                          v-model="comment_text[feed.id]"
                          class="form-control form-control-flush"
                          data-toggle="autosize"
                          rows="2"
                          placeholder="Leave a comment"
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
                          @click="commentText(feed.id,index)"
                          type="button"
                          class="conmment_send"
                        >
                          <!-- <i class="fas fa-caret-right"></i> -->
                          <i class="fas fa-paper-plane"></i>
                        </button>
                        <Button
                          v-if="comment_index==index && loading"
                          loading
                          shape="circle"
                          type="primary"
                        ></Button>
                      </div>
                    </div>
                  </div>
                  <!-- / .row -->
                </div>
              </div>
              <!--==== Lookbook =======-->

              <!--========= Collage ========-->
              <!-- card -->
              <div v-if="feed.type=='collage' && feed.collage" class="card">
                <div class="card-body">
                  <!-- Header -->
                  <div class="mb-3">
                    <div class="row align-items-center">
                      <div class="row row_all">
                        <div class="col-md-12" style="display:flex">
                          <div class="col-auto img_cmnt">
                            <!-- Avatar -->
                            <nuxt-link
                              v-if="feed.collage.user"
                              class="avatar"
                              :to="`/collage/user/${feed.collage.user.username}`"
                            >
                              <img
                                v-if="feed.collage.user && feed.collage.user.image"
                                @click="$router.push(`/collage/user/${feed.collage.user.username}`)"
                                :src="feed.collage.user.image"
                                :alt="feed.collage.user.name"
                                class="avatar-img rounded-circle"
                              />
                              <img
                                v-else
                                @click="$router.push(`/collage/user/${feed.collage.user.username}`)"
                                src="/images/default.jpg"
                                :alt="feed.collage.user.name"
                                class="avatar-img rounded-circle"
                              />
                              <div v-if="feed.collage.user.verification_status==4" class="_active">
                                <i class="fas fa-check"></i>
                              </div>
                            </nuxt-link>
                          </div>
                          <div class="col ml-n2">
                            <!-- Title -->
                            <div class="blog_title">
                              <!-- <h4 class="card-title mb-1">collage</h4> -->
                              <h4
                                @click="$router.push(`/collage/user/${feed.collage.user.username}`)"
                                v-if="feed.collage.user"
                                class="_cursor card-title mb-1"
                              >{{feed.collage.user.username}}</h4>
                            </div>
                            <div class="blog_time">
                              <ul class="blog_time_ul dis_flx">
                                <li class="time_li">{{feed.collage.created_at | myDate}}</li>
                                <!-- <li
                                  @click="$router.push(`/collage/user/${feed.collage.user.username}`)"
                                  class="name_li"
                                >Collage</li>-->
                              </ul>
                            </div>
                          </div>
                          <!-- Dropdown option-->
                          <!-- <div class="col-auto" v-if="feed.collage.user_id==authInfo.id">
                            <div class="dropdown _cursor" :class="{'show':selected_index==index}" @click="selected_index=index">
                              <div
                                class="dropdown-ellipses dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" :aria-expanded="selected_index==index"
                                >
                                <i class="fas fa-ellipsis-v"></i>
                              </div>
                              <div class="dropdown-menu dropdown-menu-right" :class="{'show':selected_index==index}">
                                <nuxt-link :to="`/collage_edit/${feed.collage_id}`" class="dropdown-item">Edit</nuxt-link>
                                <button
                                  @click="confirmDelete(blog.id,index)"
                                  class="dropdown-item"
                                >Delete</button>
                              </div>
                            </div>
                          </div>-->
                        </div>

                        <div class="col-md-12">
                          <div class="collage_imgs">
                            <!-- <p>ggggggggg</p> -->

                            <div
                              @click="$router.push(`/collage/details/${feed.collage.id}`)"
                              class="_collage_imgs _border_color _cursor"
                              style="background-color:##eae4e4;"
                            >
                              <grid-layout
                                :layout.sync="feed.collage.linkedProducts"
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
                                  v-for="(item) in feed.collage.linkedProducts"
                                  :key="item.i"
                                  :x="item.x"
                                  :y="item.y"
                                  :w="item.w"
                                  :h="item.h"
                                  :i="item.i"
                                >
                                  <img
                                    :src="item.product.productImages[0].image"
                                    :style="{'width':'100%','height':'100%'}"
                                  />
                                </grid-item>
                              </grid-layout>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Buttons -->
                  <div class="mb-3">
                    <div class="row">
                      <div class="col">
                        <div class="all_react">
                          <div class="react_left">
                            <ul>
                              <li
                                class="_cursor"
                                v-if="feed.userLike!=null"
                                @click="user_like_action(index,feed.id,feed.collage.user.id)"
                              >
                                <i class="fas fa-thumbs-up"></i>
                              </li>
                              <li
                                class="_cursor"
                                v-else
                                @click="user_like_action(index,feed.id,feed.collage.user.id)"
                              >
                                <i class="fas fa-thumbs-up icon_color"></i>
                              </li>
                            </ul>
                          </div>
                          <div class="react_right">
                            <ul>
                              <li>
                                <i class="fas fa-thumbs-up"></i>
                                {{feed.__meta__.like_count}}
                              </li>
                              <li>
                                <i class="fas fa-comments"></i>
                                {{feed.collage.comments.length}}
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>

                  <!-- Divider -->
                  <hr />

                  <!-- Comments loop -->
                  <div
                    class="comment mb-3"
                    v-for="comment in feed.collage.comments"
                    :key="comment.id"
                  >
                    <div class="row">
                      <div class="col-auto img_cmnt">
                        <!-- Avatar -->
                        <!-- <a class="avatar avatar-sm" href="profile-posts.html"> -->
                        <nuxt-link
                          v-if="comment.user"
                          class="avatar avatar-sm"
                          :to="comment.user.role==2? `/collage/user/${comment.user.username}` : `/store/${comment.user.username}`"
                        >
                          <img
                            v-if="comment.user.image"
                            :src="comment.user.image"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <img
                            v-else
                            src="/images/default.jpg"
                            :alt="comment.user.name"
                            class="avatar-img rounded-circle"
                          />
                          <div v-if="comment.user.verification_status==4" class="_active">
                            <i class="fas fa-check"></i>
                          </div>
                        </nuxt-link>
                        <!-- </a> -->
                      </div>
                      <div class="col ml-n2">
                        <!-- Body -->
                        <div class="comment-body">
                          <div class="row">
                            <div class="col">
                              <!-- Title -->
                              <h5 class="comment-title">{{comment.user.name}}</h5>
                            </div>
                            <div class="col-auto">
                              <!-- Time -->
                              <!-- <time class="comment-time">11:12</time> -->
                              <time class="comment-time">{{comment.created_at | myDate}}</time>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Text -->
                          <p class="comment-text">{{comment.text}}</p>
                        </div>
                      </div>
                    </div>
                    <!-- / .row -->
                  </div>
                  <!-- Comments loop -->

                  <!-- Divider -->
                  <hr v-if="feed.collage.comments.length" />

                  <!-- Form -->
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
                          v-model="comment_text[feed.id]"
                          class="form-control form-control-flush"
                          data-toggle="autosize"
                          rows="2"
                          placeholder="Leave a comment"
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
                          @click="commentText(feed.id,index)"
                          type="button"
                          class="conmment_send"
                        >
                          <!-- <i class="fas fa-caret-right"></i> -->
                          <i class="fas fa-paper-plane"></i>
                        </button>
                        <Button
                          v-if="comment_index==index && loading"
                          loading
                          shape="circle"
                          type="primary"
                        ></Button>
                      </div>
                    </div>
                  </div>
                  <!-- / .row -->
                </div>
              </div>
              <!--========= Collage ========-->
            </div>
            <!-- loop div -->
            <!-- </Scroll> -->


            <!-- <div class="profile-fill-more" v-if="feeds.length>0">
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
            </div> -->
            <div class="row justify-content-center" v-if="loading_spin">
              <div class="profile-fill-more" >
                <!-- <div class="profile-fill-more" > -->
                <Col class="demo-spin-col" span="8">
                    <Spin fix>
                        <Icon type="ios-loading" size=18 class="demo-spin-icon-load"></Icon>
                        <div>Loading</div>
                    </Spin>
                  <!-- <Spin fix>
                    <div class="loader">
                        <svg class="circular" viewBox="25 25 50 50">
                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
                        </svg>
                    </div>
                  </Spin> -->
                </Col>
              </div>
            </div>


            <!-- </Scroll> -->
          </div>

          <div class="col-12 col-xl-4">
            <!-- follow people -->
            <div class="card" v-if="authInfo.role==2">
              <div class="card-header">
                <div class="row align-items-center">
                  <div class="col">
                    <!-- Title -->
                    <h4 class="card-header-title">Who to follow</h4>
                  </div>
                  <div class="col-auto">
                    <!-- Link -->
                    <!-- <a class="small" href="#!">
                      View all
                    </a>-->
                  </div>
                </div>
                <!-- / .row -->
              </div>
              <div class="card-body">
                <!-- Item -->
                <div v-for="(item,index) in follow_users_suggestion" :key="index">
                  <div class="row align-items-center">
                    <div class="col-auto img_cmnt">
                      <!-- Avatar -->
                      <!-- <nuxt-link :to="`lookbook/user/${item.username}`" class="avatar"> -->
                      <nuxt-link :to="`/${item.username}`" class="avatar">
                        <img
                          v-if="item.image"
                          :src="item.image"
                          alt="..."
                          class="avatar-img rounded-circle"
                        />
                        <img
                          v-else
                          src="/images/default.jpg"
                          alt="..."
                          class="avatar-img rounded-circle"
                        />
                        <div v-if="item.verification_status==4" class="_active">
                          <i class="fas fa-check"></i>
                        </div>
                      </nuxt-link>
                    </div>
                    <div class="col ml-n2">
                      <!-- Title -->
                      <h4 class="card-title mb-1">
                        <!-- <nuxt-link :to="`lookbook/user/${item.username}`">{{item.name}}</nuxt-link> -->
                        <nuxt-link :to="`/${item.username}`">{{item.name}}</nuxt-link>
                      </h4>
                      <!-- Status -->
                      <!-- <p class="card-text small">
                      <span class="text-success">●</span> Online
                      </p>-->
                    </div>
                    <div class="col-auto">
                      <!-- Button -->
                      <template v-if="item.follower">Following</template>
                      <template v-else>
                        <button @click="followUser(index)" class="btn btn-sm btn-white">Follow</button>
                      </template>
                    </div>
                  </div>
                  <!-- Divider -->
                  <hr v-if="follow_users_suggestion.length-1!=index" />
                </div>

                <!-- Item -->
                <!-- <div class="row align-items-center">
                  <div class="col-auto">

                    <a href="profile-posts.html" class="avatar">
                      <img src="/img/avatars/profiles/avatar-2.jpg" alt="..." class="avatar-img rounded-circle">
                    </a>

                  </div>
                  <div class="col ml-n2">

                    <h4 class="card-title mb-1">
                      <a href="profile-posts.html">Ab Hadley</a>
                    </h4>

                    <p class="card-text small">
                      <span class="text-success">●</span> Online
                    </p>

                  </div>
                  <div class="col-auto">

                    <a href="#!" class="btn btn-sm btn-white">
                      Follow
                    </a>

                  </div>
                </div> -->

                <!-- Divider -->
                <!-- <hr> -->
              </div>
            </div>
            <!-- / .card -->

            <!-- Popular products -->
            <div class="card">
              <div class="card-header">
                <div class="row align-items-center">
                  <div class="col">
                    <!-- Title -->
                    <h4 class="card-header-title">Popular products</h4>
                  </div>
                </div>
                <!-- / .row -->
              </div>
              <div class="card-body">
                <div v-for="(product,index) in popular_products" :key="product.id">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <!-- Avatar -->
                      <nuxt-link :to="`/product_details/${product.id}`" class="avatar avatar-4by3">
                        <img
                          v-if="product.productImages.length"
                          :src="product.productImages[0].image"
                          alt="..."
                          class="avatar-img rounded"
                        />
                      </nuxt-link>
                    </div>
                    <div class="col ml-n2">
                      <!-- Title -->
                      <h4 class="card-title mb-1">
                        <nuxt-link :to="`/product_details/${product.id}`">{{product.title}}</nuxt-link>
                      </h4>

                      <!-- Time -->
                      <p class="card-text small text-muted" v-if="product.subcategory.length">
                        <!-- <time
                          datetime="2018-05-24"
                          v-if="product.productCategory"
                        >{{product.productCategory.name}}</time> -->
                        <span v-for="(item,index) in product.subcategory" :key="index">{{item.subcategory.name}} {{index==product.subcategory.length-1?'':', '}}</span>
                      </p>
                      <p class="right_section_middle_dlr">${{product.price}}</p>
                    </div>
                  </div>
                  <!-- / .row -->

                  <!-- Divider -->
                  <hr v-if="popular_products.length-1!=index" />
                </div>
              </div>
              <!-- / .card-body -->
            </div>
            <!-- / .card -->

            <!-- Popular shops -->
            <div class="card">
              <div class="card-header">
                <div class="row align-items-center">
                  <div class="col">
                    <!-- Title -->
                    <h4 class="card-header-title">Popular shops</h4>
                  </div>
                </div>
                <!-- / .row -->
              </div>
              <div class="card-body">
                <div v-for="(shop,index) in popular_stores" :key="shop.id">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <!-- Avatar -->
                      <!-- <a href="profile-posts.html" class="avatar"> -->
                      <nuxt-link :to="`/store/${shop.name}`" class="avatar">
                        <img
                          v-if="shop.image"
                          :src="shop.image"
                          :alt="shop.name"
                          class="avatar-img rounded-circle"
                        />
                      </nuxt-link>
                      <!-- </a> -->
                    </div>
                    <div class="col ml-n2">
                      <!-- Title -->
                      <h4 class="card-title mb-1">
                        <nuxt-link :to="`/store/${shop.name}`">{{shop.name}}</nuxt-link>
                      </h4>

                      <!-- Time -->
                      <p class="card-text small">
                        <span
                          class="text-success"
                          v-if="shop.shopCategory"
                        >{{shop.shopCategory.name}}</span>
                      </p>
                    </div>
                  </div>
                  <!-- / .row -->

                  <!-- Divider -->
                  <hr v-if="popular_stores.length-1!=index" />
                </div>
              </div>
              <!-- / .card-body -->
            </div>
            <!-- / .card -->
          </div>
        </div>
      </div>




      <!-- </div> / .main-content -->
      <!--===== Main Content ======-->
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
      // let { data } = await app.$axios.get(`/getAllFeeds`);
      let [data1, data2, data3, data4, data5] = await Promise.all([
        app.$axios.get(`/getAllFeeds`),
        app.$axios.get(`/getPopularProducts`),
        app.$axios.get(`/getPopularStores`),
        app.$axios.get(`/getUserFollowingCustomProductsTop4`),
        app.$axios.get(`/getFollowRandom5UserSuggestion`)
      ]);
      // console.log(data)
      // if (!data) {
      //   redirect('/retail')
      // }
      return {
        feeds: data1.data.data,
        pagination: data1.data,
        popular_products: data2.data,
        popular_stores: data3.data,
        stories: data4.data,
        follow_users_suggestion: data5.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      loading_spin : false,
      call_api : true,
      comment_text: [
        // feed_id=null,
        //  text=''
      ],

      fModal: false,
      f_modal_product: null,
      s_modal_product: null,
      sModal: false,
      loading: false,
      modal6: false,
      modal_index: null,
      pagination: {},
      page: 1,
      user_like: false,
      loading: false,
      comment_index: null,
      selected_index: -1,
      loading_follow: false,
      loading_status: false,

      status_text: "",
      status_text_length: 0,
      uploadList: [],
      defaultList: [
        // {
        //     'name': 'a42bdcc1178e62b4694c830f028db5c0',
        //     'url': 'https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar'
        // },
        // {
        //     'name': 'bc7521e033abdd1e92222d733590f104',
        //     'url': 'https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar'
        // }
      ],
      visible: false,
      imgURL: "",
      formData: {
        text: "",
        images: []
      },
      scrolledToBottom: false
    };
  },

  mounted() {
    // console.log(window.window.location)
    if (window.location.pathname=='/') {
      this.scroll();
    }
    // this.scroll();
  },

  methods: {
    async handleReachBottom(){
      this.call_api = false
      // console.log('iview bottom')
      let feed_id
      if (this.feeds.length) {
        feed_id=this.feeds[this.feeds.length-1].id
      }else{
        return
      }
      // return

      // console.log(feed_id)
      this.loading_spin = true
      let res = await this.callApi('get', `getAllFeedsWithScroll/${feed_id}`)
      if (res.status===200) {
        // console.log(res.data)
        // console.log(this.feeds)
        // this.feeds.push(res.data)
        if (res.data.length<10) {
          this.call_api = false
        }else{
          this.call_api = true
        }
        this.loading_spin = false
        this.feeds.push(... res.data)
        // console.log(this.feeds)
      }

    },
    handleReachEdge(){
      // console.log('iview edge')
    },

    async commentText(feed_id, feed_index) {
      this.comment_index = feed_index;

      if (!this.comment_text.length) {
        return;
      }
      if (this.comment_text[feed_id].length > 3000) {
        this.wr(
          "Comment character limit is 3,000, your comment is " +
            this.comment_text[feed_id].length +
            " character long!"
        );
        return;
      }
      if (this.comment_text[feed_id] == "") {
        return;
      }
      this.loading = true;
      // setTimeout(() => {
      //     this.loading=false
      // }, 5000);
      // return
      // console.log(this.comment_text[feed_id].length)
      // return

      // console.log("feed_index= " + feed_index);
      // console.log("feed_id= " + feed_id);
      // console.log(this.comment_text[feed_id]);
      // console.log(this.feeds[feed_index]);

      const res = await this.callApi("post", "/postComment", {
        feed_id: feed_id,
        text: this.comment_text[feed_id]
      });
      if (res.status === 200) {
        this.s("Comment posted Successfully !");
        this.comment_index = null;
        // console.log(res);
        // this.$router.push(`/product_details/${res.data.id}`);
      } else {
        this.swr();
        this.loading = false;
        return;
      }

      // let today = new Date();
      // let date =
      //   today.getFullYear() +
      //   "-" +
      //   (today.getMonth() + 1) +
      //   "-" +
      //   today.getDate();
      // let time =
      //   today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

      let comment = res.data;
      comment.user = {
        name: this.authInfo.name,
        username: this.authInfo.username,
        role: this.authInfo.role,
        verification_status: this.authInfo.verification_status,
        image: this.authInfo.image
      };

      // let item = {
      //   // id:2,
      //   text: this.comment_text[feed_id],
      //   created_at: date + " " + time,
      //   user: {
      //     name: this.authInfo.name,
      //     username: this.authInfo.username,
      //     role: this.authInfo.role,
      //     image: this.authInfo.image
      //   }
      // };

      let feed_type = this.feeds[feed_index].type;
      // console.log(feed_type);
      if (feed_type == "lookbook") {
        this.feeds[feed_index].lookbook.comments.push(comment);
      } else if (feed_type == "collage") {
        this.feeds[feed_index].collage.comments.push(comment);
      } else if (feed_type == "blog") {
        this.feeds[feed_index].blog.comments.push(comment);
      } else if (feed_type == "vlog") {
        this.feeds[feed_index].vlog.comments.push(comment);
      } else if (feed_type == "status") {
        this.feeds[feed_index].status.comments.push(comment);
      }

      // this.comment_text[feed_id] = ''
      this.comment_text = [];
      this.loading = false;
    },

    sModalCheck() {
      // console.log('fModalCheck')
      this.sModal = false;
    },

    async showSModal(product, index) {
      // console.log(product);
      this.s_modal_product = product;
      this.modal_index = index;
      this.sModal = true;
    },

    setPage(index) {
      this.page = index;
      this.pageniateAllFeeds();
    },
    async pageniateAllFeeds() {
      const res = await this.callApi("get", `/getAllFeeds/?page=${this.page}`);
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.feeds = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    },

    async user_like_action(feed_index, feed_id, feed_owner_id) {
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

      // console.log(feed_index)
      // console.log(feed_id)
      if (this.feeds[feed_index].userLike != null) {
        // call delete feed like
        const res = await this.callApi("post", "/deleteFeedLike", {
          feed_id: feed_id
        });
        if (res.status === 200) {
          // this.s('Like removed')
          this.feeds[feed_index].userLike = null;
          this.feeds[feed_index].__meta__.like_count--;
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
          this.feeds[feed_index].userLike = res.data.like;
          this.feeds[feed_index].__meta__.like_count++;
          this.s("You liked an item!");
          if (res.data.token_value) {
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
    },

    async user_status_like_action(feed_index, feed_id, feed_owner_id) {
      // check if user have atlest 3 token
      // if (feed_owner_id == this.authInfo.id) {
      //   return this.wr("Can not like your own item!");
      // }

      // check if user have atlest 3 token
      // if (this.currentTotalToken(this.userTokens) < this.likeTokenValue) {
      //   return this.wr(
      //     "You need altest " + this.likeTokenValue + " tokens for like"
      //   );
      // }

      // console.log(feed_index)
      // console.log(feed_id)
      if (this.feeds[feed_index].userLike != null) {
        // call delete feed like
        const res = await this.callApi("post", "/deleteFeedStatusLike", {
          feed_id: feed_id
        });
        if (res.status === 200) {
          // this.s('Like removed')
          this.feeds[feed_index].userLike = null;
          this.feeds[feed_index].__meta__.like_count--;
          // this.s("You removed like!");
          // if (res.data.token_value) {
          //   this.$store.dispatch(
          //     "updateUserReceivedTokens",
          //     res.data.token_value
          //   );
          //   this.in("Got back " + res.data.token_value + " tokens!");
          // }
        } else {
          this.swr();
        }
        return;
      } else {
        // call like feed api
        const res = await this.callApi("post", "/postFeedStatusLike", {
          feed_id: feed_id
        });
        // console.log(res)
        if (res.status === 200) {
          // this.s('Liked ')
          this.feeds[feed_index].userLike = res.data.like;
          this.feeds[feed_index].__meta__.like_count++;
          // this.s("You liked an item!");
          // if (res.data.token_value) {
          //   this.$store.dispatch(
          //     "updateUserDeductedTokens",
          //     res.data.token_value
          //   );
          //   this.in(res.data.token_value + " tokens is deducted!");
          // }
        } else {
          this.swr();
        }
      }
    },

    async followUser(index) {
      // console.log('followUser')
      this.loading_follow = true;
      // console.log(this.follow_users_suggestion[index])
      const res = await this.callApi("post", "/followUser", {
        following_user_id: this.follow_users_suggestion[index].id
      });

      if (res.status === 200) {
        this.s("Following user Successfully!");
        // console.log(res.data)
        // add folower object
        // Vue.set(object, propertyName, value)
        this.$set(this.follow_users_suggestion[index], "follower", res.data);
        // this.follow_users_suggestion[index].follower = res.data
        // add owner follower count
        // this.follow_users_suggestion[index].__meta__.follower_count++
        // add user following count
        this.$store.dispatch("updateUserFollowingCount", "add");
        this.loading_follow = false;
        // console.log(this.follow_users_suggestion[index])
      } else {
        // console.log(res);
        this.swr();
        this.loading_follow = false;
        return;
      }
    },

    async cresteStatus() {
      // console.log("cresteStatus");
      // console.log(this.formData);
      this.loading_status = true;
      this.formData.text = this.status_text;

      if (this.formData.text == "") {
        this.e("Please write a status!");
        this.loading_status = false;
        return;
      } else if (this.formData.text.length > 5000) {
        this.e("Status text can not be more then 5000 charecter!");
        this.loading_status = false;
        return;
      }
      // return
      if (this.uploadList.length) {
        this.formData.images = this.uploadList;
      }

      const res = await this.callApi("post", "/postStatus", this.formData);
      if (res.status === 200) {
        // console.log(res);
        this.feeds.unshift(res.data);
        this.status_text = "";
        this.formData.text = "";
        this.uploadList = [];
        // console.log(this.feeds)
        // this.$router.push(`/product_details/${res.data.id}`);
        this.loading_status = false;
        this.s("Status posted Successfully !");
      } else if (res.status === 401) {
        this.e(res.data.message);
        this.loading_status = false;
        return;
      } else {
        this.swr();
        this.loading_status = false;
      }
      return;
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    async handleRemove(file, index) {
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: file.url
      });
      if (res.status === 200) {
        // console.log(res);
      } else {
        this.swr();
      }
      // const fileList = this.$refs.upload.fileList;
      // this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      this.uploadList.splice(index, 1);
      // console.log(this.uploadList);
    },
    handleSuccess(res, file) {
      // console.log(res);
      // console.log(file);
      if (res) {
        let img = {
          name: file.name,
          percentage: file.percentage,
          status: file.status,
          // uid:1234567,
          url: res.image_path
        };
        this.uploadList.push(img);
        // console.log(this.custom_product_image_create)
      }
      // console.log(this.uploadList);
    },
    handleFormatError(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc:
          "File format of " +
          file.name +
          " is incorrect, please select jpg, jpeg or png."
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "File  " + file.name + " is too large, no more than 5M."
      });
    },
    handleBeforeUpload() {
      const check = this.uploadList.length < 5;
      if (!check) {
        this.$Notice.warning({
          title: "Up to five pictures can be uploaded."
        });
      }
      return check;
    },
    // handleReachBottom() {
    //   console.log("handleReachBottom");
    // },

    scroll () {
      if (window.location.pathname=='/') {
        // window.onscroll = function(ev) {
        window.onscroll = () => {
          let add_limit = 300
          if (window.location.pathname=='/' && this.call_api) {
            if ((window.innerHeight + window.pageYOffset+add_limit) >= (document.body.offsetHeight)){
              this.handleReachBottom()
            }
          }
        }
      }
  	},
  },

  computed: {},
  watch: {
    status_text(val) {
      this.status_text_length = val.length;
    }
  }
};
</script>

<style scoped>
.demo-spin-icon-load{
    animation: ani-demo-spin 1s linear infinite;
}
@keyframes ani-demo-spin {
    from { transform: rotate(0deg);}
    50%  { transform: rotate(180deg);}
    to   { transform: rotate(360deg);}
}
.demo-spin-col{
    height:08px;
    position: relative;
    /* border: 1px solid #eee; */
}
  /* .post_img_link li span {
                            background-color: #ea38d3;
                            color: #fff;
                            height: 20px;
                            width: 20px;
                            line-height: 20px;
                            border-radius: 50%;
                            text-align: center;
                            display: flex;
                            font-size: 11px;
                            box-shadow: 0px 0px 4px 1px #ea38d3;
                            align-items: center;
                            justify-content: center;
                            padding: 0;
                          }
                          ._collage_imgs {
                            width: auto;
                            position: relative;
                            height: auto;
                            margin-top: 17px;
                            margin-bottom: 13px;
                            border: 1px solid;
                          }

                          .ivu-btn-primary {
                              color: #fff;
                              background-color: #28b9b9;
                              border-color: #28b9b9;
                          } */
  .demo-upload-list {
    display: inline-block;
    width: 60px;
    height: 60px;
    text-align: center;
    line-height: 60px;
    border: 1px solid transparent;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
    position: relative;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    margin-right: 4px;
  }
  .demo-upload-list img {
    width: 100%;
    height: 100%;
  }
  .demo-upload-list-cover {
    display: none;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0, 0, 0, 0.6);
  }
  .demo-upload-list:hover .demo-upload-list-cover {
    display: block;
  }
  .demo-upload-list-cover i {
    color: #fff;
    font-size: 20px;
    cursor: pointer;
    margin: 0 2px;
  }
</style>

