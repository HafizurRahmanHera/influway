<template>
  <no-ssr>
    <div>
      <!-- .topbar-wrap -->
      <div class="page-header page-header-kyc">
        <!-- .container -->
      </div>
      <!-- .page-header -->
      <!-- <div class="pdb-0-5x gaps-2x "></div> -->

      <!-- HEADER -->
      <div class="header"></div>
      <div class="page-content">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-9">
              <div class="kyc-form-steps card mx-lg-4">
                <div class="form-step form-step1">
                  <div class="form-step-head card-innr">
                    <div class="step-head">
                      <div class="step-number">01</div>
                      <div class="step-head-text">
                        <h4>Personal Details</h4>
                        <p>Your simple personal information required for identification</p>
                      </div>
                    </div>
                  </div>
                  <!-- .step-head -->
                  <div class="form-step-fields card-innr">
                    <div class="note note-plane note-light-alt note-md pdb-1x">
                      <em class="fas fa-info-circle"></em>
                      <p>Please type carefully and fill out the form with your personal details. Your can’t edit these details once you submitted the form.</p>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            First Name
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.first_name" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Last Name
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.last_name" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Email Address
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.email" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Phone Number
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.phone" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Date of Birth
                            <span class="text-danger">*</span>
                          </label>
                          <!-- <input v-model="form_data.birth_date"  class="input-bordered date-picker" type="text"> -->
                          <DatePicker
                            type="date"
                            placeholder="Select date"
                            style="width: 100%"
                            :value="form_data.birth_date"
                            @on-change="birthDate($event)"
                            format="yyyy-MM-dd"
                          ></DatePicker>
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">Telegram Username</label>
                          <input
                            v-model="form_data.telegram_username"
                            class="input-bordered"
                            type="text"
                          />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                    </div>
                    <!-- .row -->
                    <h4 class="text-secondary mgt-0-5x">Your Address</h4>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Address Line 1
                            <span class="text-danger">*</span>
                          </label>
                          <input
                            v-model="form_data.address_line_1"
                            class="input-bordered"
                            type="text"
                          />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">Address Line 2</label>
                          <input
                            v-model="form_data.address_line_2"
                            class="input-bordered"
                            type="text"
                          />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            City
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.city" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            State
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.state" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label for="nationality" class="input-item-label">
                            Nationality
                            <span class="text-danger">*</span>
                          </label>
                          <!-- <select class="select-bordered select-block" name="nationality" id="nationality">
                                                <option value="us">United State</option>
                                                <option value="uk">United KingDom</option>
                                                <option value="fr">France</option>
                                                <option value="ch">China</option>
                                                <option value="cr">Czech Republic</option>
                                                <option value="cb">Colombia</option>
                          </select>-->
                          <Select v-model="selected_country_id" @on-change="selectCountry()">
                            <!-- <Select > -->
                            <Option
                              v-for="country in countries"
                              :value="country.id"
                              :key="country.id"
                            >{{ country.name }}</Option>
                            <!-- <Option :value="0" :key="0">United State</Option>
                                              <Option :value="1" :key="1">United KingDom</Option>
                                              <Option :value="2" :key="2">France</Option>
                                              <Option :value="3" :key="3">China</Option>
                                              <Option :value="4" :key="4">Czech Republic</Option>
                            <Option :value="5" :key="5">Colombia</Option>-->
                          </Select>
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label class="input-item-label">
                            Zip Code
                            <span class="text-danger">*</span>
                          </label>
                          <input v-model="form_data.zip_code" class="input-bordered" type="text" />
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                    </div>
                    <!-- .row -->
                  </div>
                  <!-- .step-fields -->
                </div>
                <div class="form-step form-step2">
                  <div class="form-step-head card-innr">
                    <div class="step-head">
                      <div class="step-number">02</div>
                      <div class="step-head-text">
                        <h4>Document Upload</h4>
                        <p>To verify your identity, please upload any of your document</p>
                      </div>
                    </div>
                  </div>
                  <!-- .step-head -->
                  <div class="form-step-fields card-innr">
                    <div class="note note-plane note-light-alt note-md pdb-0-5x">
                      <em class="fas fa-info-circle"></em>
                      <p>In order to complete, please upload any of the following personal document.</p>
                    </div>
                    <div class="gaps-2x"></div>
                    <ul
                      class="nav nav-tabs nav-tabs-bordered row flex-wrap guttar-20px"
                      role="tablist"
                    >
                      <li class="nav-item flex-grow-0">
                        <div
                          @click="selectedDocumentType('passport'), type=1"
                          class="nav-link d-flex align-items-center  _cursor" :class="type==1?'active':''"
                          data-toggle="tab"

                        >
                          <div class="nav-tabs-icon">
                            <img src="/images/icon-passport.png" alt="icon" />
                            <img src="/images/icon-passport-color.png" alt="icon" />
                          </div>
                          <span>Passport</span>
                        </div>
                      </li>
                      <li class="nav-item flex-grow-0">
                        <div
                          @click="selectedDocumentType('national_card'),type=2"
                          class="nav-link d-flex align-items-center _cursor"
                          :class="type==2?'active':''"
                          data-toggle="tab"

                        >
                          <div class="nav-tabs-icon">
                            <img src="/images/icon-national-id.png" alt="icon" />
                            <img src="/images/icon-national-id-color.png" alt="icon" />
                          </div>
                          <span>National Card</span>
                        </div>
                      </li>
                      <li class="nav-item flex-grow-0">
                        <div
                          @click="selectedDocumentType('drivering_license'),type=3"
                          :class="type==3?'active':''"
                          class="nav-link d-flex align-items-center _cursor"
                          data-toggle="tab"

                        >
                          <div class="nav-tabs-icon">
                            <img src="/images/icon-licence.png" alt="icon" />
                            <img src="/images/icon-licence-color.png" alt="icon" />
                          </div>
                          <span>Driver’s License</span>
                        </div>
                      </li>
                    </ul>
                    <!-- .nav-tabs-line -->
                    <div class="tab-content" id="myTabContent">

                      <div class="tab-pane fade " :class="type==1?'show active':''" id="passport">
                        <h5
                          class="text-secondary font-bold"
                        >To avoid delays when verifying account, Please make sure bellow:</h5>
                        <ul class="list-check">
                          <li>Chosen credential must not be expaired.</li>
                          <li>Document should be good condition and clearly visible.</li>
                          <li>Make sure that there is no light glare on the card.</li>
                        </ul>
                        <div class="gaps-2x"></div>
                        <h5 class="font-mid">Upload Here Your Passport Copy</h5>
                        <div class="row align-items-center">
                          <div class="col-sm-8">
                            <div class="upload-box">
                              <!-- <div class="upload-zone">
                                                        <div class="dz-message" data-dz-message><span class="dz-message-text">Drag and drop file</span><span class="dz-message-or">or</span>
                                                            <button class="btn btn-primary">SELECT</button>
                                                        </div>
                              </div>-->

                              <div
                                class="demo-upload-list"
                                v-for="(item,index) in uploadList"
                                :key="index"
                              >
                                <template v-if="item.status === 'finished'">
                                  <img :src="item.url" />
                                  <div class="demo-upload-list-cover">
                                    <Icon
                                      type="ios-eye-outline"
                                      @click.native="handleView(item.url)"
                                    ></Icon>
                                    <Icon
                                      type="ios-trash-outline"
                                      @click.native="handleRemove(item,index)"
                                    ></Icon>
                                  </div>
                                </template>
                                <template v-else>
                                  <Progress
                                    v-if="item.showProgress"
                                    :percent="item.percentage"
                                    hide-info
                                  ></Progress>
                                </template>
                              </div>
                              <Upload
                                ref="upload"
                                :show-upload-list="false"
                                :on-success="handleSuccess"
                                :format="['jpg','jpeg','png']"
                                :max-size="2048"
                                :on-format-error="handleFormatError"
                                :on-exceeded-size="handleMaxSize"
                                :before-upload="handleBeforeUpload"
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
                          <div class="col-sm-4 d-none d-sm-block">
                            <div class="mx-md-4">
                              <img src="/images/vector-passport.png" alt="vector" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- .tab-pane -->
                      <div class="tab-pane fade" :class="type==2?'show active':''" id="national-card">
                        <h5
                          class="text-secondary font-bold"
                        >To avoid delays when verifying account, Please make sure bellow:</h5>
                        <ul class="list-check">
                          <li>Chosen credential must not be expaired.</li>
                          <li>Document should be good condition and clearly visible.</li>
                          <li>Make sure that there is no light glare on the card.</li>
                        </ul>
                        <div class="gaps-2x"></div>
                        <h5 class="font-mid">Upload Here Your National id Front Side</h5>
                        <div class="row align-items-center">
                          <div class="col-sm-8">
                            <!-- <div class="upload-box">
                                                    <div class="upload-zone">
                                                        <div class="dz-message" data-dz-message><span class="dz-message-text">Drag and drop file</span><span class="dz-message-or">or</span>
                                                            <button class="btn btn-primary">SELECT</button>
                                                        </div>
                                                    </div>
                            </div>-->
                            <div
                              class="demo-upload-list"
                              v-for="(item,index) in uploadList"
                              :key="index"
                            >
                              <template v-if="item.status === 'finished'">
                                <img :src="item.url" />
                                <div class="demo-upload-list-cover">
                                  <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                                  <Icon
                                    type="ios-trash-outline"
                                    @click.native="handleRemove(item,index)"
                                  ></Icon>
                                </div>
                              </template>
                              <template v-else>
                                <Progress
                                  v-if="item.showProgress"
                                  :percent="item.percentage"
                                  hide-info
                                ></Progress>
                              </template>
                            </div>
                            <Upload
                              ref="upload"
                              :show-upload-list="false"
                              :on-success="handleSuccess"
                              :format="['jpg','jpeg','png']"
                              :max-size="2048"
                              :on-format-error="handleFormatError"
                              :on-exceeded-size="handleMaxSize"
                              :before-upload="handleBeforeUpload"
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
                          <div class="col-sm-4 d-none d-sm-block">
                            <div class="mx-md-4">
                              <img src="/images/vector-id-front.png" alt="vector" />
                            </div>
                          </div>
                        </div>
                        <div class="gaps-3x"></div>
                        <h5 class="font-mid">Upload Here Your National id Back Side</h5>
                        <div class="row align-items-center">
                          <div class="col-sm-8">
                            <!-- <div class="upload-box">
                                                    <div class="upload-zone">
                                                        <div class="dz-message" data-dz-message><span class="dz-message-text">Drag and drop file</span><span class="dz-message-or">or</span>
                                                            <button class="btn btn-primary">SELECT</button>
                                                        </div>
                                                    </div>
                            </div>-->

                            <div
                              class="demo-upload-list"
                              v-for="(item,index) in uploadList1"
                              :key="index"
                            >
                              <template v-if="item.status === 'finished'">
                                <img :src="item.url" />
                                <div class="demo-upload-list-cover">
                                  <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                                  <Icon
                                    type="ios-trash-outline"
                                    @click.native="handleRemove1(item,index)"
                                  ></Icon>
                                </div>
                              </template>
                              <template v-else>
                                <Progress
                                  v-if="item.showProgress"
                                  :percent="item.percentage"
                                  hide-info
                                ></Progress>
                              </template>
                            </div>
                            <Upload
                              ref="upload"
                              :show-upload-list="false"
                              :on-success="handleSuccess1"
                              :format="['jpg','jpeg','png']"
                              :max-size="2048"
                              :on-format-error="handleFormatError1"
                              :on-exceeded-size="handleMaxSize1"
                              :before-upload="handleBeforeUpload1"
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
                          <div class="col-sm-4 d-none d-sm-block">
                            <div class="mx-md-4">
                              <img src="/images/vector-id-back.png" alt="vector" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- .tab-pane -->
                      <div class="tab-pane fade" :class="type==3?'show active':''" id="driver-licence">
                        <h5
                          class="text-secondary font-bold"
                        >To avoid delays when verifying account, Please make sure bellow:</h5>
                        <ul class="list-check">
                          <li>Chosen credential must not be expaired.</li>
                          <li>Document should be good condition and clearly visible.</li>
                          <li>Make sure that there is no light glare on the card.</li>
                        </ul>
                        <div class="gaps-2x"></div>
                        <h5 class="font-mid">Upload Here Your Driving Licence Copy</h5>
                        <div class="row align-items-center">
                          <div class="col-sm-8">
                            <!-- <div class="upload-box">
                                                    <div class="upload-zone">
                                                        <div class="dz-message" data-dz-message><span class="dz-message-text">Drag and drop file</span><span class="dz-message-or">or</span>
                                                            <button class="btn btn-primary">SELECT</button>
                                                        </div>
                                                    </div>
                            </div>-->
                            <div
                              class="demo-upload-list"
                              v-for="(item,index) in uploadList"
                              :key="index"
                            >
                              <template v-if="item.status === 'finished'">
                                <img :src="item.url" />
                                <div class="demo-upload-list-cover">
                                  <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                                  <Icon
                                    type="ios-trash-outline"
                                    @click.native="handleRemove(item,index)"
                                  ></Icon>
                                </div>
                              </template>
                              <template v-else>
                                <Progress
                                  v-if="item.showProgress"
                                  :percent="item.percentage"
                                  hide-info
                                ></Progress>
                              </template>
                            </div>
                            <Upload
                              ref="upload"
                              :show-upload-list="false"
                              :on-success="handleSuccess"
                              :format="['jpg','jpeg','png']"
                              :max-size="2048"
                              :on-format-error="handleFormatError"
                              :on-exceeded-size="handleMaxSize"
                              :before-upload="handleBeforeUpload"
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
                          <div class="col-sm-4 d-none d-sm-block">
                            <div class="mx-md-4">
                              <img src="/images/vector-licence.png" alt="vector" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- .tab-pane -->
                    </div>
                    <!-- .tab-content -->
                  </div>
                  <!-- .step-fields -->
                </div>
                <div class="form-step form-step3">
                  <div class="form-step-head card-innr">
                    <div class="step-head">
                      <div class="step-number">03</div>
                      <div class="step-head-text">
                        <h4>Your Paying Wallet</h4>
                        <p>Submit your wallet address that you are going to send funds</p>
                      </div>
                    </div>
                  </div>
                  <!-- .step-head -->
                  <div class="form-step-fields card-innr">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="input-item input-with-label">
                          <label for="swalllet" class="input-item-label">Select Wallet</label>
                          <!-- <select class="select-bordered select-block" name="swalllet" id="swalllet">
                                                <option value="eth">Ethereum</option>
                          </select>-->
                          <!-- <Select> -->
                          <Select v-model="selected_wallet_id" @on-change="selectWallet()">
                            <!-- <Option v-for="category in categories   " :value="category.id" :key="category.id">{{ category.name }}</Option> -->
                            <Option :value="0" :key="0">Ethereum</Option>
                          </Select>
                        </div>
                        <!-- .input-item -->
                      </div>
                      <!-- .col -->
                    </div>
                    <!-- .row -->
                    <div class="input-item input-with-label">
                      <label for="token-address" class="input-item-label">Your Address for tokens:</label>
                      <input
                        v-model="form_data.address_for_tokens"
                        class="input-bordered"
                        type="text"
                        id="token-address"
                        name="token-address"
                        placeholder="0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae"
                      />
                      <span class="input-note">Note: Address should be ERC20-compliant.</span>
                    </div>
                    <!-- .input-item -->
                  </div>
                  <!-- .step-fields -->
                </div>
                <div class="form-step form-step-final">
                  <div class="form-step-fields card-innr">
                    <div class="input-item">
                      <input
                        v-model="check_condition1"
                        class="input-checkbox input-checkbox-md"
                        id="term-condition"
                        type="checkbox"
                      />
                      <label for="term-condition">
                        I have read the
                        <a href="#">Terms of Condition</a> and
                        <a href="#">Privary Policy.</a>
                      </label>
                    </div>
                    <div class="input-item">
                      <input
                        v-model="check_condition2"
                        class="input-checkbox input-checkbox-md"
                        id="info-currect"
                        type="checkbox"
                      />
                      <label
                        for="info-currect"
                      >All the personal information I have entered is correct.</label>
                    </div>
                    <div class="gaps-1x"></div>
                    <button
                      :disabled="loading"
                      @click="submitForm"
                      class="btn btn-primary"
                    >Process for Verify</button>
                  </div>
                  <!-- .step-fields -->
                </div>
              </div>
              <!-- .card -->
            </div>
          </div>
        </div>
        <!-- .container -->
      </div>
    </div>
  </no-ssr>
</template>


<script>
export default {
  middleware: ["authenticated"],
  async asyncData({ app, store, redirect, params }) {
    try {
      let { data } = await app.$axios.get(`/getCountries`);
      // console.log(data)
      return {
        countries: data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      itemIndex: -1,
      type:1,
      // countries:{},
      form_data: {
        first_name: "",
        last_name: "",
        email: "",
        phone: "",
        birth_date: "",
        telegram_username: "",
        address_line_1: "",
        address_line_2: "",
        city: "",
        state: "",
        country_id: "",
        zip_code: "",
        document_type: "passport",
        wallet_id: "",
        address_for_tokens: "",
        admin_note: "",
        checked_on_date: "",
        img_passport: "",
        img_national_id_front_side: "",
        img_national_id_back_side: "",
        img_driving_licence: ""
      },
      selected_country_id: "",
      selected_wallet_id: "",
      check_condition1: false,
      check_condition2: false,

      uploadList: [],
      uploadList1: [],

      imgURL: "",
      visible: false,
      loading: false
    };
  },
  methods: {
    async selectedDocumentType(type) {
      this.form_data.document_type = type;
      if (this.uploadList.length) {
        const res = await this.callApi("post", "/deleteImageFromFolder", {
          image: this.uploadList[0].url
        });
        if (res.status === 200) {
          // console.log(res);
        } else {
          // this.swr();
        }
        this.uploadList.splice(0, this.uploadList.length);
      }
      if (this.uploadList1.length) {
        const res = await this.callApi("post", "/deleteImageFromFolder", {
          image: this.uploadList[0].url
        });
        if (res.status === 200) {
          // console.log(res);
        } else {
          // this.swr();
        }
        this.uploadList.splice(0, this.uploadList1.length);
      }
    },
    birthDate(date) {
      this.form_data.birth_date = date;
    },
    selectCountry() {
      this.form_data.country_id = this.selected_country_id;
    },
    selectWallet() {
      this.form_data.wallet_id = this.selected_wallet_id;
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    async handleRemove(file, index) {
      // console.log('remove image')
      // console.log(file)
      // const res = await this.callApi("post", "/deleteImageFromFolder", {
      //   image: file.url
      // });
      // if (res.status === 200) {
      //   // console.log(res);
      // } else {
      //   this.swr();
      // }
      // remove image from folder
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
          " is incorrect, please select jpg or png."
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "File  " + file.name + " is too large, no more than 2M."
      });
    },
    handleBeforeUpload() {
      const check = this.uploadList.length < 1;
      if (!check) {
        this.$Notice.warning({
          title: "1 image can be uploaded."
        });
      }
      return check;
    },

    async handleRemove1(file, index) {
      // console.log('remove image')
      // console.log(file)
      const res = await this.callApi("post", "/deleteImageFromFolder", {
        image: file.url
      });
      if (res.status === 200) {
        // console.log(res);
      } else {
        this.swr();
      }
      // remove image from folder
      this.uploadList1.splice(index, 1);
      // console.log(this.uploadList);
    },
    handleSuccess1(res, file) {
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
        this.uploadList1.push(img);
        // console.log(this.custom_product_image_create)
      }
      // console.log(this.uploadList1);
    },
    handleFormatError1(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc:
          "File format of " +
          file.name +
          " is incorrect, please select jpg or png."
      });
    },
    handleMaxSize1(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "File  " + file.name + " is too large, no more than 2M."
      });
    },
    handleBeforeUpload1() {
      const check = this.uploadList1.length < 1;
      if (!check) {
        this.$Notice.warning({
          title: "1 image can be uploaded."
        });
      }
      return check;
    },

    async submitForm() {
      // console.log("submit form");
      // console.log(this.form_data);
      this.loading = true;

      if (this.form_data.first_name == "") {
        this.e("First name can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.last_name == "") {
        this.e("Last name can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.email == "") {
        this.e("Email can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.phone == "") {
        this.e("Phone can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.birth_date == "") {
        this.e("Birth date can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.address_line_1 == "") {
        this.e("Address line 1 can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.city == "") {
        this.e("City can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.state == "") {
        this.e("State can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.country_id == "") {
        this.e("Nationality can not be empty");
        this.loading = false;
        return;
      } else if (this.form_data.zip_code == "") {
        this.e("Zip code can not be empty");
        this.loading = false;
        return;
      }
      if (
        this.form_data.document_type == "passport" &&
        this.uploadList.length
      ) {
        // console.log(this.uploadList[0].url);
        this.form_data.img_passport = this.uploadList[0].url;
        this.form_data.img_driving_licence = "";
        this.form_data.img_national_id_front_side = "";
        this.form_data.img_national_id_back_side = "";
      } else if (
        this.form_data.document_type == "drivering_license" &&
        this.uploadList.length
      ) {
        // console.log(this.uploadList[0].url);
        this.form_data.img_driving_licence = this.uploadList[0].url;
        this.form_data.img_passport = "";
        this.form_data.img_national_id_front_side = "";
        this.form_data.img_national_id_back_side = "";
      } else if (this.form_data.document_type == "national_card") {
        if (this.uploadList.length) {
          // console.log(this.uploadList[0].url);
          this.form_data.img_national_id_front_side = this.uploadList[0].url;
          this.form_data.img_driving_licence = "";
          this.form_data.img_passport = "";
          // this.form_data.img_national_id_back_side = ''
        }
        if (this.uploadList1.length) {
          // console.log(this.uploadList1[0].url);
          this.form_data.img_national_id_back_side = this.uploadList1[0].url;
          // this.form_data.img_national_id_front_side = ''
          this.form_data.img_driving_licence = "";
          this.form_data.img_passport = "";
        }
      }

      if (this.check_condition1 == false) {
        this.in("Please check 'The Terms of Condition and Privary Policy'.");
        this.loading = false;
        return;
      }
      if (this.check_condition2 == false) {
        this.in(
          "Please check 'All the personal information I have entered is correct'."
        );
        this.loading = false;
        return;
      }
      // console.log(this.form_data);
      // return
      const res = await this.callApi(
        "post",
        "/createUserVerificationForm",
        this.form_data
      );
      if (res.status === 200) {
        // console.log(res);
        this.s("Form submitted successfully!");
        this.authInfo.verification_status = 1;
        this.authInfo.message = "";
        this.$router.push("/profile");
      } else if (res.status === 401) {
        this.e(res.data.message);
        this.loading = false;
        return;
      } else {
        this.swr();
        this.loading = false;
        return;
      }
    }
  }
};
</script>

<style scoped>
</style>

