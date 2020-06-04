<template>
  <no-ssr>
    <div>
      <!-- HEADER -->
      <div class="header"></div>
      <!--===== Main Content ======-->
      <div class="_content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12 col-md-12 col-lg-11">
              <div class="row">
                <!-- Left Section -->
                <div class="col-md-11">
                  <div class="_1blog_section_all _box_shadow _border_radious _mar_b20 _padd25">
                    <!-- <form v-on:submit.prevent="onSubmit"> -->
                    <div class="row">
                      <div class="col-12 col-md-12">
                        <h3 class="blog_section_left_h3">Edit your status</h3>
                      </div>

                      <div class="col-12 col-md-12 col-lg-12">
                        <div class="_input_group">
                          <p class="_label">Status text</p>
                          <Input
                            type="textarea"
                            placeholder="Write a status..."
                            :autosize="{minRows: 5, maxRows: 15}"
                            v-model="status_text"
                          />
                          <small class="text-muted">
                            <!-- 0/500 -->
                            {{status_text_length}}/5000
                          </small>
                        </div>
                      </div>

                      <div class="col-12 col-md-6 col-lg-6">
                        <div class="_input_group">
                          <!-- <p class="_label">Upload Product Images</p> -->
                          <!-- <input class="_int" type="file" name="pic" accept="image/*"> -->

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
                            :default-file-list="defaultList"
                            :on-success="handleSuccess"
                            :format="['jpg','jpeg','png']"
                            :max-size="2048"
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

                      <div class="col-12 col-md-12 col-lg-12">
                        <div class="_input_button">
                          <button
                            :disabled="loading"
                            class="btn btn-success d-block d-md-inline-block lift"
                            type="submit"
                            @click="onSubmit"
                          >Update</button>
                          <!-- <button class="_2btn" type="button">Cancel</button> -->
                        </div>
                      </div>
                    </div>
                    <!-- </form> -->
                  </div>
                </div>
                <!-- Left Section -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--===== Main Content ======-->
    </div>
  </no-ssr>
</template>

<script>
export default {
  // middleware: ['authenticated','retail'],
  middleware: ["authenticated"],
  async asyncData({ app, store, redirect, params }) {
    try {
      // let {data} = await app.$axios.get(`/getProducts`)
      let [data1] = await Promise.all([
        app.$axios.get(`/getUserStatus/${params.id}`)
      ]);
      if (!data1.data) {
        // redirect("/status");
        redirect("/");
      }
      return {
        product: data1.data
      };
    } catch (error) {
      //return redirect('/404')
    }
  },
  data() {
    return {
      formData: {
        id: "",
        text: "",
        images: []
      },
      tag_text: "",
      custom_product_image_create: null,

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
      imgURL: "",
      visible: false,
      uploadList: [],

      checked_sizes: [
        // true,
        // false,
        // true,
        // false,
        // true
      ],
      checked_colors: [],
      loading: false,

      status_text:'',
      status_text_length:0,
    };
  },
  watch: {
    status_text(val) {
      this.status_text_length = val.length
    },
  },
  created() {
    // console.log(this.product)
    this.formData.id = this.product.id;
    this.formData.text = this.product.text;
    this.status_text = this.product.text;

    // this.uploadList= this.product.productImages

    this.product.images.forEach(items => {
      // console.log(items);
      let img = {
        name: "pro" + items.id,
        percentage: 100,
        status: "finished",
        // uid:1234567,
        url: items.image
      };
      this.uploadList.push(img);
    });
  },
  methods: {
    async onSubmit() {

      this.formData.text = this.status_text
      this.formData.images = this.uploadList;

      // console.log(this.formData);
      this.loading = true;
      // return;
      if (this.formData.text == "") {
        this.e("Please write a status!");
        this.loading = false;
        return;
      } else if (this.formData.text > 5000) {
        this.e("Status text can not be more then 5000 charecter!");
        this.loading = false;
        return;
      }

      // this.formData.images = this.uploadList;

      const res = await this.callApi("post", "/updateStatus", this.formData);
      if (res.status === 200) {
        this.s("Status updated Successfully !");
        // console.log(res);
        // this.$router.push(`/status`);
        this.$router.push(`/${this.authInfo.username}/status`);
        // this.$router.push(`/product_details/${res.data.id}`);
        this.loading = false;
      } else {
        this.swr();
        this.loading = false;
      }
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    handleRemove(file,index) {
      // console.log(file)
      // const fileList = this.$refs.upload.fileList;
      // this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      // this.uploadList.splice(file, 1);
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
    }
  }
};
</script>

<style scoped>
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

  .my_check .ivu-checkbox-wrapper {
    margin: 0;
    border: 1px solid;
  }

  .ivu-checkbox-group {
    font-size: 14px;
    display: contents;
  }

  .ivu-checkbox-wrapper {
    cursor: pointer;
    font-size: 12px;
    display: inline-block;
    margin-right: 8px !important;
    margin-top: 8px !important;
  }
</style>

