<template>
  <no-ssr>
    <!-- MAIN CONTENT
    ==================================================-->
    <div class="main-content">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12">
            <!-- Header -->
            <div class="header mt-md-5"></div>

            <!-- Card -->
            <div class="card">
              <div class="card-header">
                <div class="row align-items-center">
                  <div class="col">
                    <!-- Search -->
                    <!-- <form class="row align-items-center">
                      <div class="col-auto pr-0">
                        <span class="fe fe-search text-muted"></span>
                      </div>
                      <div class="col">
                          <input type="search" class="form-control form-control-flush search" placeholder="Search">
                      </div>
                    </form>-->
                    <h4 class="card-title mb-1">
                      <!-- <a href="project-overview.html">Personal Site</a> -->
                      Tokens Transactions
                    </h4>
                  </div>
                  <div class="col-auto">
                    <!-- Button -->

                    <!-- <div class="dropdown">
                      <button class="btn btn-sm btn-white dropdown-toggle" type="button" id="bulkActionDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Bulk action
                      </button>
                      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bulkActionDropdown">
                        <a class="dropdown-item" href="#!">Action</a>
                        <a class="dropdown-item" href="#!">Another action</a>
                        <a class="dropdown-item" href="#!">Something else here</a>
                      </div>
                    </div>-->
                  </div>
                </div>
                <!-- / .row -->
              </div>
              <div class="table-responsive">
                <table class="table table-sm table-nowrap card-table">
                  <thead>
                    <tr>
                      <!-- <th>
                        <div class="custom-control custom-checkbox table-checkbox">
                          <input type="checkbox" class="custom-control-input" name="ordersSelect" id="ordersSelectAll">
                          <label class="custom-control-label" for="ordersSelectAll">
                            &nbsp;
                          </label>
                        </div>
                      </th>-->
                      <th>
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                        Tranx NO
                      </th>
                      <th>
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                        Tokens
                      </th>
                      <th>
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                        USD Amount
                      </th>
                      <th>
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                        From
                      </th>
                      <th>
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                        Type
                      </th>
                      <th colspan="1">
                        <!-- <a href="#" class="text-muted sort" ></a> -->
                      </th>
                    </tr>
                  </thead>
                  <template v-if="transactions.length">
                    <tbody class="list">
                      <tr v-for="(item,index) in transactions" :key="index">
                        <td class="orders-order">
                          <div class="d-flex align-items-center">
                            <!-- <div v-if="item.action_type=='created' || item.action_type=='got_back' || item.action_type=='received'" class="data-state data-state-approved">
                              <div class="pending_icon">
                                <Icon type="ios-close" />
                              </div>
                              <span class="d-none">Pending</span>
                            </div>
                            <div v-else class="data-state data-state-canceled">
                              <div class="approve_icon">
                                <Icon type="ios-checkmark" />
                              </div>
                              <span class="d-none">Approved</span>
                            </div>-->

                            <div class="fake-class">
                              <span class>{{concatZero(item.id)}}</span>
                            </div>
                          </div>

                          <span class="token_text1">{{item.created_at}}</span>
                        </td>

                        <td class="orders-product">
                          <p
                            v-if="item.action_type=='created' || item.action_type=='got_back' || item.action_type=='received'"
                            class
                          >{{item.token}}</p>
                          <p v-else class>-{{item.token}}</p>
                          <p class="token_text1 text_trnsfrm">IWAY</p>
                        </td>

                        <td class="orders-date">
                          <p class>{{(item.token*iway_value.value).toFixed(4)}}</p>
                        </td>
                        <td class="orders-total">
                          <p class>{{item.item_type}}</p>
                          <!-- <p class="sub sub-date">{{item.action_type}}</p> -->
                          <p class="token_text1" v-if="item.action_type=='created'">Was created</p>
                          <p class="token_text1" v-else-if="item.action_type=='received'">You got</p>
                          <p
                            class="token_text1"
                            v-else-if="item.action_type=='got_back'"
                          >You removed</p>
                          <p class="token_text1" v-else-if="item.action_type=='deducted'">You gave</p>
                          <p
                            class="token_text1"
                            v-else-if="item.action_type=='like_removed'"
                          >User removed</p>
                          <p class="token_text1" v-else>Was deleted</p>
                        </td>

                        <td
                          v-if="item.action_type=='created' || item.action_type=='got_back' || item.action_type=='received'"
                          class="data-col dt-type"
                        >
                          <span class="dt-type-md badge badge-outline badge-success badge-md">Earned</span>
                          <!-- <span
                          class="dt-type-sm badge badge-sq badge-outline badge-success badge-md"
                          >E</span>-->
                        </td>
                        <td v-else class="data-col dt-type">
                          <span
                            class="dt-type-md badge badge-outline badge-info badge-md badge-danger"
                          >Reduced</span>
                          <!-- <span
                          class="dt-type-sm badge badge-sq badge-outline badge-info badge-md badge-danger"
                          >R</span>-->
                        </td>

                        <td class="text-right icon_eye">
                          <Icon @click="modalItem(item)" type="ios-eye-outline" />
                        </td>
                      </tr>
                    </tbody>
                  </template>
                  <template v-else>
                    <tbody class="list">
                      <tr>
                        <td>
                          <h3>No transactions</h3>
                        </td>
                      </tr>
                    </tbody>
                  </template>
                </table>
              </div>
            </div>
            <div class="profile-fill-more" v-if="transactions.length>0">
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
        <!-- / .row -->
      </div>
      <Modal class="_modal" v-model="modal6" width="880px">
        <div class="modal-content">
          <div class="popup-body popup-body-lg">
            <div class="content-area">
              <div class="card-head d-flex justify-content-between align-items-center">
                <h4 class="card-title mb-0">Transaction Details</h4>
              </div>
              <div class="gaps-1-5x"></div>
              <div class="data-details d-md-flex">
                <div class="fake-class">
                  <span class="data-details-title">Tranx Date</span>
                  <span class="data-details-info">{{modal_item.created_at}}</span>
                </div>
                <div class="fake-class">
                  <span class="data-details-title">Tranx Status</span>
                  <span
                    v-if="modal_item.action_type=='created' || modal_item.action_type=='got_back' || modal_item.action_type=='received'"
                    class="badge badge-success ucap"
                  >Earned</span>
                  <span v-else class="badge badge-danger ucap">Deducted</span>
                </div>
                <div class="fake-class">
                  <span class="data-details-title">Tranx Approved Note</span>
                  <span class="data-details-info">
                    By
                    <strong>InfluWay</strong>
                    at {{modal_item.created_at}}
                  </span>
                </div>
              </div>
              <div class="gaps-3x"></div>
              <h6 class="card-sub-title">Transaction Info</h6>
              <ul class="data-details-list">
                <!-- li -->
                <li>
                  <div class="data-details-head">Payment Getway</div>
                  <div class="data-details-des">
                    <strong>
                      InfluWay
                      <small>- Offline Payment</small>
                    </strong>
                  </div>
                </li>
                <!-- li -->
                <li></li>
                <!-- li -->
                <li>
                  <div class="data-details-head">Tx Hash</div>
                  <div class="data-details-des">
                    <span>{{concatZero(modal_item.id)}}</span>
                    <span></span>
                  </div>
                </li>
                <!-- li -->
                <li>
                  <div class="data-details-head">Deposit To</div>
                  <div class="data-details-des">
                    <!-- <span v-if="authInfo.ethereum_address">
                      {{authInfo.ethereum_address}}
                      <small>- Offline Wallet</small>
                    </span> -->
                    <span v-if="authHiddenInfo.ethereum_address">
                      {{authHiddenInfo.ethereum_address}}
                      <small>- Offline Wallet</small>
                    </span>
                    <span v-else>
                      No Wallet
                      <small>- Offline Wallet</small>
                    </span>
                    <span></span>
                  </div>
                </li>
                <!-- li -->
                <li>
                  <div class="data-details-head">Details</div>
                  <div class="data-details-des">Tokens Purchase By InfluWay</div>
                </li>
                <!-- li -->
              </ul>
              <!-- .data-details -->
              <div class="gaps-3x"></div>
              <h6 class="card-sub-title">Token Details</h6>
              <ul class="data-details-list">
                <li>
                  <div class="data-details-head">Task</div>
                  <div class="data-details-des">
                    <strong>{{modal_item.item_type}}</strong>
                  </div>
                </li>
                <!-- li -->
                <li>
                  <div class="data-details-head">Contribution</div>
                  <div class="data-details-des">
                    <span>
                      <strong v-if="modal_item.action_type=='created'">Created</strong>
                      <strong v-else-if="modal_item.action_type=='got_back'">You removed</strong>
                      <strong v-else-if="modal_item.action_type=='received'">You got</strong>
                      <strong v-else-if="modal_item.action_type=='deducted'">You gave</strong>
                      <strong v-else-if="modal_item.action_type=='like_removed'">User removed</strong>
                      <strong v-else>Deleted</strong>
                    </span>
                  </div>
                </li>
                <!-- li -->
                <li>
                  <div
                    v-if="modal_item.action_type=='created' || modal_item.action_type=='got_back' || modal_item.action_type=='received'"
                    class="data-details-head"
                  >Tokens Added To</div>
                  <div v-else class="data-details-head">Tokens Deducted From</div>
                  <div class="data-details-des">
                    <strong>@{{authInfo.username}}</strong>
                  </div>
                </li>
                <!-- li -->

                <!-- li -->

                <!-- li -->
                <li>
                  <div
                    v-if="modal_item.action_type=='created' || modal_item.action_type=='got_back' || modal_item.action_type=='received'"
                    class="data-details-head"
                  >Token Earned</div>
                  <div v-else class="data-details-head">Token Deducted</div>
                  <div class="data-details-des">
                    <span>
                      <strong
                        v-if="modal_item.action_type=='created' || modal_item.action_type=='got_back' || modal_item.action_type=='received'"
                      >{{modal_item.token}} IWAY</strong>
                      <strong v-else>-{{modal_item.token}} IWAY</strong>
                    </span>
                  </div>
                </li>
                <!-- li -->
              </ul>
              <!-- .data-details -->
            </div>
            <!-- .card -->
          </div>
        </div>
        <!-- .modal-content -->
      </Modal>
    </div>
    <!-- / .main-content -->
  </no-ssr>
</template>

<script>
export default {
  middleware: ["authenticated"],
  async asyncData({ app, store, redirect, params }) {
    try {
      // let { data } = await app.$axios.get(`/getAllFeeds`);
      let [data1, data2] = await Promise.all([
        app.$axios.get(`/getUserAllTransactions`),
        app.$axios.get(`/getTokenDollarValue`)
      ]);
      // console.log(data)
      // if (!data) {
      //   redirect('/retail')
      // }
      return {
        transactions: data1.data.data,
        pagination: data1.data,
        iway_value: data2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      modal_item: {},
      modal6: false,
      pagination: {},
      page: 1
    };
  },
  created() {
    // console.log(this.concatZero('',"TNX" ,100, 9,''))
  },
  methods: {
    setPage(index) {
      this.page = index;
      this.pageniateAllTransactions();
    },
    async pageniateAllTransactions() {
      const res = await this.callApi(
        "get",
        `/getUserAllTransactions/?page=${this.page}`
      );
      if (res.status === 200) {
        window.scrollTo(0, 0);
        this.transactions = res.data.data;
        this.pagination = res.data;
        delete this.pagination.data;
      } else {
        this.swr();
      }
    },
    concatZero(number, width = 9, text = "TNX") {
      return text + Array(width + 1 - (number + "").length).join("0") + number;
    },
    modalItem(item) {
      this.modal_item = item;
      this.modal6 = true;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
