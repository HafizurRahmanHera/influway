<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div>
      <!-- HEADER -->
      <div class="header"></div>
      <!-- / .header -->

      <!-- CONTENT -->
      <div class="container">
        <div class="row">
          <template v-if="product!=null">
            <div class="col-12">
              <!-- Card -->
              <div class="card">
                <div class="product_slider _mar_b20">
                  <div class="row">
                    <!-- Image Slider -->
                    <div class="col-12 col-md-6 col-lg-5">
                      <div class="_1details_slider">
                        <div class="_1details_slider_pic">
                          <!-- <img src="/products_image/cote.jpg" alt title /> -->
                          <!-- <img src="/images/HTB16g0lh_XYBeNkHFrdq6AiuVXax.jpg"> -->
                          <!-- <img >
                          <img  alt="" title="">-->
                          <img
                            v-if="product.productImages.length && !show_img"
                            :src="product.productImages[0].image"
                            alt
                            title
                          />
                          <img v-else :src="tem_img" alt title />
                        </div>

                        <div class="_1details_slider_menu" v-if="product.productImages.length>1">
                          <ul class="_1details_slider_img_list">
                            <li v-for="pro_img in product.productImages" :key="pro_img.id">
                              <img
                                @click="showImg(pro_img.image)"
                                :src="pro_img.image"
                                alt="img"
                                class="_1details_slider_imgs_li _cursor"
                              />
                            </li>
                            <!-- <li>
                            <img
                              src="/products_image/cote2.jpg"
                              alt
                              class="_1details_slider_imgs_li _cursor"
                            />
                          </li>
                          <li>
                            <img
                              src="/products_image/cote3.jpg"
                              alt
                              class="_1details_slider_imgs_li _cursor"
                            />
                            </li>-->
                          </ul>
                        </div>
                      </div>
                    </div>
                    <!-- Image Slider -->

                    <!-- Product Details -->
                    <div class="col-12 col-md-6 col-lg-7">
                      <div class="_1details_info">
                        <h3 class="_1details_name">{{product.title}}</h3>

                        <div class="_1rating">
                          <ul class="_1rating_list">
                            <!-- <li class="_1rating_list_active">
                            <Icon type="ios-star" />
                          </li>
                          <li class="_1rating_list_active">
                            <Icon type="ios-star" />
                          </li>
                          <li class="_1rating_list_active">
                            <Icon type="ios-star" />
                          </li>
                          <li class="_1rating_list_active">
                            <Icon type="ios-star" />
                          </li>
                          <li class="_1rating_list_active">
                            <Icon type="ios-star" />
                            </li>-->
                            <Rate
                              v-if="product.rating && product.rating.averageRating"
                              disabled
                              allow-half
                              :value="product.rating.averageRating"
                            />
                            <Rate v-else disabled allow-half :value="0" />
                            <!-- <li class="_1rating_text">(4 Reviews)</li> -->
                            <li
                              v-if="product.rating && product.rating.countRating"
                              class="_1rating_text"
                            >({{product.rating.countRating}} Reviews)</li>
                            <li v-else class="_1rating_text">(0 Reviews)</li>
                          </ul>

                          <!-- <Rate disabled allow-half show-text v-model="valueHalf" />
													<Rate v-if="product.rating && product.rating.averageRating" disabled allow-half :value="product.rating.averageRating" />
													<Rate v-else disabled allow-half :value="0" />
													<li v-if="product.rating && product.rating.countRating" class="_1rating_text">({{product.rating.countRating}} Reviews)</li>
													<li v-else class="_1rating_text">(0 Reviews)</li>
												</ul>
											</div>
                          -->

                          <!-- <p class="_price"><del class="_price_del">$234</del> $329</p> -->
                          <!-- <p class="_price">{{product.price}}$</p> -->

                          <!-- <p class="_1details_status _text">
												{{product.stock}}
                          </p>-->
                          <p class="_price">{{product.price}}$</p>
                          <div class="_padd_t20">
                            <p class="_1details_label">Available in stock</p>
                            <p class="_1details_stock">{{product.stock}}</p>
                          </div>

                          <div class="_1details_color">
                            <p class="_1details_label">COLOR</p>
                            <ul class="_color_list" v-if="product.productColors.length">
                              <li v-for="pro_color in product.productColors" :key="pro_color.id">
                                <div
                                  class="my_check"
                                  :style="{'background-color':pro_color.color.color_code,'margin':'3px'}"
                                  :class="{ '_white': pro_color.color.color_name=='white'}"
                                >
                                  <Checkbox></Checkbox>
                                </div>
                              </li>
                              <!-- <li>
                              <label class="check_all">
                                <input type="checkbox" />
                                <span
                                  class="checkmark"
                                  style="background-color: rgb(181, 101, 29);"
                                ></span>
                              </label>
                            </li>
                            <li>
                              <label class="check_all">
                                <input type="checkbox" />
                                <span
                                  class="checkmark"
                                  style="background-color: rgb(181, 101, 29);"
                                ></span>
                              </label>
                            </li>
                            <li>
                              <label class="check_all">
                                <input type="checkbox" />
                                <span
                                  class="checkmark"
                                  style="background-color: rgb(181, 101, 29);"
                                ></span>
                              </label>
                            </li>
                            <li>
                              <label class="check_all">
                                <input type="checkbox" />
                                <span
                                  class="checkmark"
                                  style="background-color: rgb(181, 101, 29);"
                                ></span>
                              </label>
                              </li>-->
                            </ul>
                            <!-- <ul class="_card_color _mar_b15" v-if="product.productColors.length">
										<li class=""  v-for="pro_color in product.productColors" :key="pro_color.id">
											<div class="my_check" :style="{'background-color':pro_color.color.color_code,'margin':'3px'}">
										<span >
											 <Checkbox   @on-change="checkColor">{{color.color_name}}</Checkbox>
											<Checkbox >
												 <span>{{color.color_name}}</span>
											</Checkbox>
										 </span>
											</div>
										</li>

                            </ul>-->
                          </div>

                          <div class="_1details_quintity">
                            <p class="_1details_label">QUITITY</p>

                            <div class="_1details_quintity_main">
                              <p @click="addQuantity" class="_1details_quintity_add _border_color">
                                <i class="fas fa-plus"></i>
                              </p>
                              <p class="_1details_quintity_num">{{product_quantity}}</p>
                              <p
                                @click="reduceQuantity"
                                class="_1details_quintity_add _border_color"
                              >
                                <i class="fas fa-minus"></i>
                              </p>
                            </div>
                          </div>

                          <div class="_1details_size">
                            <p class="_1details_label">SIZE</p>

                            <div class="_1details_size_main">
                              <ul v-if="product.productSizes.length" class="_1details_size_list">
                                <li v-for="pro_size in product.productSizes" :key="pro_size.id">
                                  <Checkbox>{{pro_size.size.size}}</Checkbox>
                                </li>
                                <!-- <li>
                                <label class="ivu-checkbox-wrapper ivu-checkbox-default">
                                  <Checkbox label="checkbox"></Checkbox>S
                                </label>
                              </li>
                              <li>
                                <label class="ivu-checkbox-wrapper ivu-checkbox-default">
                                  <Checkbox label="checkbox"></Checkbox>S
                                </label>
                              </li>
                              <li>
                                <label class="ivu-checkbox-wrapper ivu-checkbox-default">
                                  <Checkbox label="checkbox"></Checkbox>S
                                </label>
                              </li>
                              <li>
                                <label class="ivu-checkbox-wrapper ivu-checkbox-default">
                                  <Checkbox label="checkbox"></Checkbox>S
                                </label>
                                </li>-->
                              </ul>
                              <!-- <ul v-if="product.productSizes.length" class="product-size-list">
										<li v-for="pro_size in product.productSizes" :key="pro_size.id">
											<a href="#">
											<Checkbox>{{pro_size.size.size}}</Checkbox>
											</a>
										</li>
                              </ul>-->
                            </div>
                          </div>

                          <div class="_input_button">
                            <!-- <button  @click="edit(product.id)" class="_1btn" type="button">Edit</button>
                            <button @click="confirmDelete(product.id)" class="_2btn" type="button" style="color: #ffffff;background-color: #e11f1f">Delete</button>-->

                            <!-- <button class="_1btn" type="button">Buy now</button> -->
                            <!-- <button class="_2btn" type="button">Add to card</button> -->
                            <template
                              v-if="authInfo && authInfo.role==1 && authInfo.id==product.user_id"
                            >
                              <button
                                @click="edit(product.id)"
                                class="btn btn-info d-block d-md-inline-block lift"
                                type="button"
                              >Edit</button>
                              <button
                                @click="confirmDelete(product.id)"
                                class="btn btn-danger d-block d-md-inline-block lift"
                                type="button"
                              >Delete</button>
                            </template>
                            <template v-else-if="authInfo && authInfo.role==2">
                              <button
                                class="btn btn-primary d-block d-md-inline-block lift"
                                type="button"
                              >Buy now</button>
                              <button
                                class="btn btn-info d-block d-md-inline-block lift"
                                type="button"
                              >Add to card</button>
                            </template>
                          </div>
                        </div>
                      </div>
                      <!-- Product Details -->
                    </div>
                  </div>
                  <!-- <div class="card-body">
                <div class="chart chart2">
                  <canvas id="performanceChart" class="chart-canvas"></canvas>
                </div>
                  </div>-->
                </div>
              </div>
            </div>
            <!-- / .row -->
            <div class="col-12">
              <div class="row">
                <!-- Payment -->
                <div class="col-12 col-md-12 col-lg-12">
                  <div class="card _mar_b20 _padd25">
                    <div class="_details_titee">
                      <h2 class="_1details_payment_title">Product details</h2>
                    </div>

                    <div class="_1details_payment_items">
                      <!-- <p class="_title">{{ addLn(product.details) }}</p> -->
                      <pre class="_title">{{product.details}}</pre>

                      <!-- <p class="_title">1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. 1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p> -->

                      <!-- <p class="_value"><i class="fas fa-map-marker-alt"></i> Address here, citysdkf</p> -->
                    </div>

                    <!-- <div class="_1details_payment_items">
                    <p class="_title">Delivery charge</p>

                    <p class="_value">Inside city $210</p>
                    <p class="_value">Outside city $3224</p>
                    </div>-->
                    <!-- <div class="_1details_payment_items">
                    <p class="_title">Deliver to</p>

                    <p class="_value"><i class="fas fa-map-marker-alt"></i> Address here, citysdkf</p>
                    </div>-->

                    <!-- <div class="_details_titee _mat_t30">
                    <h2 class="_1details_payment_title">Product detailsy</h2>
                    </div>-->

                    <!-- <ul class="_vaule_list">
                    <li>1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</li>
                    <li>1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</li>
                    <li>1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</li>
                    <li>1.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</li>
                    </ul>-->
                  </div>
                </div>
                <!-- Payment -->
              </div>
            </div>
            <!-- / .row -->
            <div class="col-12">
              <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                  <!-- Alert -->

                  <!-- Projects -->
                  <div class="card">
                    <div class="card-header">
                      <div class="row align-items-center">
                        <div class="col">
                          <ul class="nav nav-tabs nav-overflow header-tabs">
                            <li class="nav-item pro_dtls">
                              <!-- <a href="#" class="nav-link active">Reveiw</a> -->
                              <button
                                @click="showComments"
                                class="nav-link"
                                :class="{'active':comments}"
                              >Reveiws</button>
                            </li>
                            <li class="nav-item pro_dtls">
                              <button
                                @click="showReviews"
                                class="nav-link"
                                :class="{'active':reviews}"
                              >Write a review</button>
                            </li>
                            <!-- <li class="nav-item">
                      <a href="team-members.html" class="nav-link">
                        Members
                      </a>
                    </li>
                    <li class="nav-item">
                      <a href="#!" class="nav-link">
                        Settings
                      </a>
                            </li>-->
                          </ul>

                          <!-- Title -->
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                      </div>
                      <!-- / .row -->
                    </div>
                    <div class="card-body" v-if="comments">
                      <template v-if="product.allReviews.length">
                        <div v-for="(review,index) in product.allReviews" :key="review.id">
                          <div class="row">
                            <div class="col-auto img_cmnt">
                              <!-- Avatar -->
                              <!-- <a href="#" class="avatar avatar-4by3"> -->
                              <div class="avatar avatar-4by3" v-if="review.user">
                                <!-- <nuxt-link
                                  class="avatar avatar-sm"
                                  :to="review.user.role==2? `/lookbook/user/${review.user.username}` : `/store/${review.user.username}`"
                                > -->
                                <nuxt-link
                                  class="avatar avatar-sm"
                                  :to="review.user.role==2? `/${review.user.username}` : `/store/${review.user.username}`"
                                >
                                  <img
                                    v-if="review.user.image"
                                    :src="review.user.image"
                                    :alt="review.user.name"
                                    class="avatar-img rounded"
                                  />
                                  <img
                                    v-else
                                    src="/images/default.jpg"
                                    :alt="review.user.name"
                                    class="avatar-img rounded"
                                  />
                                  <div v-if="review.user.verification_status==4" class="_active">
                                    <i class="fas fa-check"></i>
                                  </div>
                                </nuxt-link>
                              </div>
                              <!-- </a> -->
                            </div>
                            <div class="col ml-n2">
                              <!-- <h4 class="card-title mb-1">
                          <a href="project-overview.html">Homepage Redesign</a>
                        </h4>
                        <p class="card-text small text-muted">
                          <time datetime="2018-05-24">Updated 5hr ago</time>
                              </p>-->
                              <div class="_comments_items_details" v-if="review.user">
                                <p class="_comments_items_name">{{review.user.name}}</p>
                                <!-- <p class="_comments_items_pro">VERIFIED BUYER</p> -->
                                <!-- <p class="_comments_items_date_text"
                                >{{review.created_at | myDate}} | Lindenworld, NJ</p> -->
                                <p class="_comments_items_date_text"
                                >{{review.created_at | myDate}}</p>
                                <div class="_comments_items_rating">
                                  <div class="_1rating">
                                    <ul class="_1rating_list">
                                      <Rate disabled :value="review.rating" />
                                      <!-- <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                      </li>-->
                                    </ul>
                                  </div>
                                </div>

                                <!-- <p class="_comments_items_pro_name">Berry baskset</p> -->
                                <p class="_comments_items_status _text">{{review.comment}}</p>
                              </div>
                            </div>
                          </div>
                          <!-- / .row -->

                          <!-- Divider -->
                          <hr v-if="product.allReviews.length-1!=index" />
                        </div>
                      </template>
                      <template v-else>
                        <div class="row">
                          <div class="col ml-n2">
                            <div class="_comments_items_details">
                              <p class="_comments_items_status _text">No review</p>
                            </div>
                          </div>
                        </div>
                        <!-- / .row -->
                      </template>
                    </div>
                    <!-- / .card-body -->

                    <!-- card body-2 -->
                    <div class="card-body" v-if=" reviews">
                      <div class="_comm_re_main">
                        <!---->
                        <div
                          data-tab-content="2"
                          class="_1about_product _1rating_page_all tab-content tab-content-2"
                        >
                          <div class="_comm_re_details">
                            <div class="row">
                              <div class="col-12 col-md-3 col-lg-3">
                                <!-- <p class="_reviews_title">ALL REVIEWS (4)</p> -->
                                <p
                                  v-if="product.rating && product.rating.countRating"
                                  class="_reviews_title"
                                >ALL REVIEWS ({{product.rating.countRating}})</p>
                                <p v-else class="_reviews_title">ALL REVIEWS (0)</p>
                                <div class="_1rating _raging_page">
                                  <ul class="_1rating_list">
                                    <!-- <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                  </li>
                                    <li>3.5 Stars</li>-->
                                    <Rate
                                      v-if="product.rating && product.rating.averageRating"
                                      disabled
                                      allow-half
                                      show-text
                                      :value="product.rating.averageRating"
                                    />
                                    <Rate v-else disabled allow-half show-text :value="0" />
                                  </ul>
                                </div>
                                <div class="_reviews_button">
                                  <!-- <button type="button" class="_1btn">UPDATE REVIEW</button> -->
                                  <button
                                    v-if="product.userReview!=null"
                                    class="_1btn"
                                    type="button"
                                  >UPDATE REVIEW</button>
                                  <button v-else class="_1btn" type="button">WRITE A REVIEW</button>
                                </div>
                                <p class="_3title">RATING DISTRIBUTION</p>
                                <ul class="_reviews_listes">
                                  <li>
                                    <div class="_1rating">
                                      <ul class="_1rating_list">
                                        <!-- <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                        </li>-->
                                        <!-- <li>(Satisfied)</li> -->
                                        <Rate disabled :value="5" />
                                        <li class="_1rating_text">(Delighted)</li>
                                      </ul>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="_1rating">
                                      <ul class="_1rating_list">
                                        <!-- <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                        </li>-->
                                        <!-- <li>(Fair)</li> -->
                                        <Rate disabled :value="4" />
                                        <li class="_1rating_text">(Satisfied)</li>
                                      </ul>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="_1rating">
                                      <ul class="_1rating_list">
                                        <!-- <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                        </li>-->
                                        <!-- <li>(Dissatisfied)</li> -->
                                        <Rate disabled :value="3" />
                                        <li class="_1rating_text">(Fair)</li>
                                      </ul>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="_1rating">
                                      <ul class="_1rating_list">
                                        <!-- <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                        </li>-->
                                        <!-- <li>(Dissatisfied)</li> -->
                                        <Rate disabled :value="2" />
                                        <li class="_1rating_text">(Dissatisfied)</li>
                                      </ul>
                                    </div>
                                  </li>
                                  <li>
                                    <div class="_1rating">
                                      <ul class="_1rating_list">
                                        <!-- <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                      </li>
                                      <li class="_1rating_list_active">
                                        <Icon type="ios-star" />
                                        </li>-->
                                        <!-- <li>(Bad)</li> -->
                                        <Rate disabled :value="1" />
                                        <li class="_1rating_text">(Bad)</li>
                                      </ul>
                                    </div>
                                  </li>
                                </ul>
                              </div>

                              <div class="col-12 col-md-9 col-lg-9 _give_reviews">
                                <!-- <p class="_reviews_title">ALL REVIEWS (19)</p> -->
                                <div class="_1rating">
                                  <ul class="_1rating_list">
                                    <li class="_give_reviews_text">Your Rating</li>
                                    <!-- <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                  </li>
                                  <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                  </li>
                                  <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                  </li>
                                  <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                  </li>
                                  <li class="_1rating_list_active">
                                    <Icon type="ios-star" />
                                    </li>-->
                                    <!-- <li>3 Stars</li> -->
                                    <Rate show-text v-model="formData.rating" />
                                  </ul>
                                </div>

                                <div class="_give_reviews_form">
                                  <p class="_give_label">Your Review</p>

                                  <div class="_give_text_area_main">
                                    <textarea v-model="formData.comment" class="_textarea_int"></textarea>
                                  </div>
                                  <template v-if="product.userReview==null">
                                    <button @click="submitReview" class="_1btn" type="button">SUBMIT</button>
                                  </template>
                                  <template v-else>
                                    <button @click="updateReview" class="_1btn" type="button">UPDATE</button>
                                  </template>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!---->
                      </div>
                    </div>
                    <!-- / .card-body -->
                  </div>
                  <!-- / .card -->
                </div>
              </div>
            </div>
            <!-- / .row -->
            <div class="col-12">
              <div class="row">
                <div class="col-12 col-md-12 col-xl-12">
                  <!-- <div class="card"> -->
                  <h1 class="_1title" style="text-align:center; padding:10px">RELATED PRODUCTS</h1>

                  <!-- </div> -->
                </div>
                <div
                  class="col-12 col-md-6 col-xl-3"
                  v-for="product in related_products"
                  :key="product.id"
                >
                  <div class="card store_card">
                    <!-- <a href="project-overview.html"> -->
                    <nuxt-link :to="`/product_details/${product.id}`">
                      <img
                        v-if="product.productImages.length"
                        :src="product.productImages[0].image"
                        alt="product img"
                        class="card-img-top"
                      />
                    </nuxt-link>
                    <!-- </a> -->
                    <div class="card-body">
                      <div class="post_girl_section_text">
                        <h3 class="post_girl_h3">{{product.title}}</h3>
                        <!-- <p
                          class="post_girl_p1"
                          v-if="product.productCategory"
                        >
                          {{product.productCategory.name}}
                        </p> -->
                        <p
                          class="post_girl_p1"
                          v-if="product.subcategory.length"
                        >
                          <span v-for="(item,index) in product.subcategory" :key="index">{{item.subcategory.name}} {{index==product.subcategory.length-1?'':', '}}</span>
                        </p>
                        <div class="post_girl_section_icon">
                          <ul class="post_girl_section_icon_ul">
                            <li class="post_girl_section_icon_ul_li1">Price {{product.price}}$</li>
                            <li class="post_girl_section_icon_ul_li2">
                              <i class="far fa-heart"></i>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / .row -->
          </template>
          <template v-else>
            <div class="col-12">
              <h3>No product</h3>
            </div>
          </template>
        </div>
      </div>
      <!-- / .main-content -->
    </div>
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  data() {
    return {
      show_img: false,
      tem_img: "",
      status: false,
      comments: false,
      reviews: false,
      user_rating: 1,
      formData: {
        id: 0,
        rating: 5,
        comment: "",
        product_id: ""
      },

      valueHalf: 2.8,
      rate_value: 0,
      valueText: 3,
      valueCustomText: 3.8,
      product_quantity: 1
    };
  },
  async asyncData({ app, store, redirect, params }) {
    try {
      let { data } = await app.$axios.get(`/getProduct/${params.id}`);
      // console.log(data)
      // if (!data.product) {
      //   redirect("/");
      // }
      return {
        product: data.product,
        related_products: data.related_products
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  async created() {
    if (this.product && this.product.userReview != null) {
      this.formData.id = this.product.userReview.id;
      this.formData.rating = this.product.userReview.rating;
      this.formData.comment = this.product.userReview.comment;
      this.formData.product_id = this.product.userReview.product_id;
    }
    // console.log(this.product)
  },

  methods: {
    showImg(img) {
      this.tem_img = img;
      this.show_img = true;
    },

    edit(id) {
      this.$router.push(`/product_edit/${id}`);
    },

    confirmDelete(id) {
      this.$Modal.confirm({
        title: "Delete product",
        content: "<p>Confirm to delete product</p>",
        onOk: () => {
          // this.$Message.info('Clicked ok');
          // console.log('ok')
          this.deleteProduct(id);
          return;
        },
        onCancel: () => {
          // this.$Message.info('Clicked cancel');
          // console.log('cancel')
        }
      });
    },

    async deleteProduct(id) {
      // console.log(id)
      const res = await this.callApi("post", "/deleteProduct", { id: id });
      if (res.status === 200) {
        this.s("Product deleted ...");
        this.$router.push("/retail");
        // window.location.href = '/login'
      } else {
        // console.log(res);
        this.swr();
      }
      return;
    },

    showStatus() {
      this.comments = false;
      this.reviews = false;
      this.status = true;
    },
    showComments() {
      this.reviews = false;
      this.status = false;
      this.comments = true;
    },
    showReviews() {
      this.status = false;
      this.comments = false;
      this.reviews = true;
    },
    async submitReview() {
      this.formData.product_id = this.$route.params.id;
      // console.log(this.formData);
      if (this.formData.comment.length > 3000) {
        this.wr(
          "Comment character limit is 3,000, your comment is " +
            this.formData.comment.length +
            " character long!"
        );
        return;
      }
      const res = await this.callApi(
        "post",
        "/postUserProductReview",
        this.formData
      );
      // console.log(res)
      if (res.status === 200) {
        this.s("Review posted Successfully !");
        // console.log(this.product.userReview)
        this.product.userReview = res.data;
        let item = res.data;
        item.user = {
          name: this.authInfo.name,
          username: this.authInfo.username,
          verification_status: this.authInfo.verification_status,
          role: this.authInfo.role,
          image: this.authInfo.image,
          // email: this.authInfo.email
        };
        this.product.allReviews.unshift(item);
        if (this.product.rating == null) {
          // console.log("null");
          let item = {
            countRating: null,
            totalRating: null,
            averageRating: null
          };
          this.product.rating = item;
          this.product.rating.countRating = 1;
          this.product.rating.totalRating = res.data.rating;
          this.product.rating.averageRating = res.data.rating;
        } else {
          // console.log("not null");
          this.product.rating.totalRating += res.data.rating;
          this.product.rating.countRating++;
          let avg = Number(
            this.product.rating.totalRating / this.product.rating.countRating
          );
          this.product.rating.averageRating = Number(avg.toFixed(2));
        }
        // console.log(this.product.userReview)
      } else {
        this.swr();
      }
    },
    async updateReview() {
      // this.formData.product_id = this.$route.params.id;
      // this.formData.id = this.product.userReview.id;
      // console.log(this.formData);
      if (this.formData.comment.length > 3000) {
        this.wr(
          "Comment character limit is 3,000, your comment is " +
            this.formData.comment.length +
            " character long!"
        );
        return;
      }
      const res = await this.callApi(
        "post",
        "/updateUserProductReview",
        this.formData
      );
      // console.log(res)
      if (res.status === 200) {
        this.s("Review updated Successfully !");

        for (const item of this.product.allReviews) {
          // console.log(item)
          if (this.formData.id == item.id) {
            item.rating = this.formData.rating;
            item.comment = this.formData.comment;
            return;
          }
        }

        this.product.rating.totalRating -= this.product.userReview.rating;
        if (this.product.rating.totalRating < 0) {
          this.product.rating.totalRating = 0;
        }
        this.product.rating.totalRating += this.formData.rating;
        let avg = Number(
          this.product.rating.totalRating / this.product.rating.countRating
        );
        this.product.rating.averageRating = Number(avg.toFixed(2));

        this.product.userReview.rating = this.formData.rating;
        this.product.userReview.comment = this.formData.comment;
      } else {
        this.swr();
      }
    },

    addQuantity() {
      this.product_quantity++;
    },
    reduceQuantity() {
      if (this.product_quantity != 1) {
        this.product_quantity--;
      }
    },
  }
};
</script>

<style >
  .ivu-rate-star-full:before,
  .ivu-rate-star-half .ivu-rate-star-content:before {
    color: #0eb1b9;
  }
  .ivu-rate-star-full:hover:before,
  .ivu-rate-star-half:hover .ivu-rate-star-content:before {
    color: #0eb1b9;
  }
</style>
