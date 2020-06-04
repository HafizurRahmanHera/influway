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
                      <h3 class="blog_section_left_h3">Edit your product</h3>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Product Title</p>
                        <Input type="text" placeholder="Product title" v-model="formData.title" />
                      </div>
                    </div>

                    <!-- <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Product Category</p>
                        <Select v-model="formData.category_id">
                          <template v-if="categories.length">
                            <Option
                              v-for="category in categories"
                              :value="category.id"
                              :key="category.id"
                            >{{category.name}}</Option>
                          </template>
                        </Select>
                      </div>
                    </div> -->

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Product Category</p>
                        <Select v-model="selected_subcategory" multiple >
                          <Option v-for="item in subcategoryList" :value="item.value" :key="item.value">{{ item.label }}</Option>
                        </Select>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Price</p>
                        <Input type="number" placeholder="Price" v-model="formData.price" />
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Itmes in Stock</p>
                        <Input type="number" placeholder="20" v-model="formData.stock" />
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <div class="card_right_four">
                          <p class="_label">Colors</p>

                          <CheckboxGroup class="my_check" v-model="checked_colors">
                            <Checkbox
                              :class="{ '_white': color.color_name=='white'}"
                              v-for="color in colors"
                              :key="color.id"
                              :label="color.id"
                              :style="{'background-color':color.color_code}"
                            >{{color.color}}</Checkbox>
                          </CheckboxGroup>
                        </div>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Available Sizes</p>

                        <CheckboxGroup v-model="checked_sizes">
                          <Checkbox
                            v-for="size in sizes"
                            :key="size.id"
                            :label="size.id"
                          >{{size.size}}</Checkbox>
                        </CheckboxGroup>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Upload Product Images</p>
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
                            <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
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

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Tags</p>
                        <div class>
                          <div class="blog_int_add_sec blog_in2">
                            <Input
                              v-model="tag_text"
                              @on-enter="addTag"
                              type="text"
                              placeholder="Write a tag"
                            />
                            <button @click="addTag" class="blog_int_add" type="button">Add</button>
                          </div>

                          <ul class="blog_section_right_ul">
                            <li v-for="(tag,index) in formData.tags" :key="index">
                              {{tag.tag}}
                              <p @click="removeTag(index)" class="_delate">
                                <i class="fas fa-times"></i>
                              </p>
                            </li>
                            <!-- <li>
																Tag1
																<p class="_delate"><i class="fas fa-times"></i></p>
															</li>
															<li>
																Tag1
																<p class="_delate"><i class="fas fa-times"></i></p>
                            </li>-->
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_group">
                        <p class="_label">Product Description</p>
                        <Input
                          type="textarea"
                          placeholder="descripton"
                          :rows="6"
                          v-model="formData.details"
                        />
                      </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_button">
                        <button :disabled="loading" class="btn btn-success d-block d-md-inline-block lift" type="submit" @click="onSubmit">Update</button>
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
  middleware: ["retail"],
  async asyncData({ app, store, redirect, params }) {
    try {
      // let {data} = await app.$axios.get(`/getProducts`)
      let [data1, data2, data3, data4, data5, data6] = await Promise.all([
        app.$axios.get(`/getCategories`),
        app.$axios.get(`/getColors`),
        app.$axios.get(`/getSizes`),
        app.$axios.get(`/getUserProduct/${params.id}`),
        app.$axios.get(`/getSubcategories`),
        app.$axios.get(`/getProductSubcategoriesById/${params.id}`),
      ]);
      if (!data4.data) {
        redirect("/retail");
      }
      return {
        categories: data1.data,
        colors: data2.data,
        sizes: data3.data,
        product: data4.data,
        subategories: data5.data,
        product_subategories: data6.data,
      };
    } catch (error) {
      //return redirect('/404')
    }
  },
  data() {
    return {
      formData: {
        id: "",
        title: "",
        price: "",
        stock: "",
        details: "",
        category_id: null,
        images: [],
        sizes: [],
        colors: [],
        tags: [],
        subcategories:[]
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
      subcategoryList: [
            // {
            //     value: 'New York',
            //     label: 'New York'
            // },
            // {
            //     value: 'London',
            //     label: 'London'
            // },
        ],
      selected_subcategory: []
    };
  },
  created() {
    // console.log(this.product)
    this.formData.id = this.product.id;
    this.formData.title = this.product.title;
    this.formData.price = this.product.price;
    this.formData.stock = this.product.stock;
    this.formData.details = this.product.details;
    this.formData.category_id = this.product.category_id;
    // this.uploadList= this.product.productImages

    // console.log(this.uploadList)
    // this.formData.colors= this.product.productColors.color
    // this.formData.sizes= this.product.productSizes.size
    // console.log(this.product.productColors.color)

    // console.log(this.product.productSizes.size)

    this.product.productSizes.forEach(items => {
      // console.log(items);
      this.checked_sizes.push(items.size_id);
    });
    // console.log(this.checked_sizes)
    this.product.productColors.forEach(items => {
      // console.log(items);
      this.checked_colors.push(items.color_id);
    });
    // console.log(this.checked_colors)
    this.product.productTags.forEach(items => {
      // console.log(items);
      this.formData.tags.push({ tag: items.tag });
    });

    this.product.productImages.forEach(items => {
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

    this.subategories.forEach(element => {
      let item = {
        value: element.id,
        label: element.name
      }
      this.subcategoryList.push(item)
    });
    this.product_subategories.forEach(element => {
      this.selected_subcategory.push(element.subcategory.id)
    });
  },
  methods: {
    async onSubmit() {
      this.formData.images = this.uploadList;
      this.formData.sizes = this.checked_sizes;
      this.formData.colors = this.checked_colors;
      // console.log(this.formData);
      this.loading= true
      // return;
      if (this.formData.title == "") {
        this.e("Product title can not be empty");
        this.loading= false
        return;
      } else if (this.formData.price == "") {
        this.e("Product price can not be empty");
        this.loading= false
        return;
      } else if (this.formData.stock == "") {
        this.e("Items in stock can not be empty");
        this.loading= false
        return;
      // } else if (this.formData.category_id == "") {
      //   this.e("Product category can not be empty");
      //   this.loading= false
      //   return;
      } else if (this.uploadList.length < 1) {
        this.e("Select an image");
        this.loading= false
        return;
      }

      if (this.selected_subcategory.length) {
        this.formData.subcategories = this.selected_subcategory
      }else{
        this.e("Product category can not be empty");
        this.loading= false
        return;
      }

      // this.formData.images = this.uploadList;

      const res = await this.callApi("post", "/updateProduct", this.formData);
      if (res.status === 200) {
        this.s("Product updated Successfully !");
        // console.log(res);
        this.$router.push(`/product_details/${res.data}`);
        // this.$router.push(`/product_details/${res.data.id}`);
        this.loading= false
      } else {
        this.swr();
        this.loading= false
      }
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    handleRemove(file) {
      // const fileList = this.$refs.upload.fileList;
      // this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      this.uploadList.splice(file, 1);
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
      const check = this.uploadList.length < 5;
      if (!check) {
        this.$Notice.warning({
          title: "Up to five pictures can be uploaded."
        });
      }
      return check;
    },

    addTag() {
      if (this.tag_text == "") {
        return;
      }
      this.formData.tags.push({ tag: this.tag_text });
      // this.formData.tags.push(this.tag_text);
      this.tag_text = "";
    },
    removeTag(index) {
      this.formData.tags.splice(index, 1);
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

