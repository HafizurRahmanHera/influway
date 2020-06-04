<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header">
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-12 col-lg-10">
            <div class="row">
              <!-- Left Section -->
              <div class="col-md-12">
                <div class="_1blog_section_all _box_shadow _border_radious _mar_b20 _padd25">
                  <!-- <form> -->
                  <div class="row">
                    <div class="col-12 col-md-12">
                      <h3 class="blog_section_left_h3">Create Blog</h3>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Title</p>
                        <Input v-model="form.title" type="text" placeholder="Vlog TItle" />
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Category</p>
                        <Select v-model="form.category_id">
                          <Option selected :value="0">Select category</Option>
                          <Option
                            v-for="category in categories"
                            :key="category.id"
                            :value="category.id"
                          >{{category.name}}</Option>
                        </Select>
                      </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_group">
                        <p class="_label">Tags</p>
                        <div class>
                          <div class="blog_int_add_sec blog_in2">
                            <Input v-model="tag_text" @on-enter="addTag" placeholder="Write a tag">
                              <span class="_cursor" @click="addTag" slot="append">Add</span>
                            </Input>
                          </div>

                          <ul class="blog_section_right_ul">
                            <li v-for="(tag,index) in form.tags" :key="index">
                              {{tag.tag}}
                              <p @click="removeTag(index)" class="_delate">
                                <i class="fas fa-times"></i>
                              </p>
                            </li>
                            <!-- <li>
																Tag1
																<p class="_delate"><i class="fas fa-times"></i></p>
                            </li>-->
                          </ul>
                        </div>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Feature Image</p>
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

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_group">
                        <p class="_label">Blog Description</p>
                        <!-- <textarea class="_1textarea" rows="4" placeholder="Write your blog here..."></textarea> -->
                        <div
                          style="width: 100%; height: 300px;"
                          :content="form.text"
                          @change="onEditorChange($event)"
                          v-quill:myQuillEditor="editorOption"
                        ></div>
                        <p>Description character length = {{quill_char_length}} (limit 3000)</p>
                      </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_button">
                        <button :disabled="loading" @click="createBlog" class="btn btn-primary lift" type="button">Publish</button>
                        <button @click="cancelCreate" class="btn btn-default lift" type="button">Cancel</button>
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
  </no-ssr>
</template>

<script>
export default {
  middleware: ["influencer"],
  async asyncData({ app, store, redirect, params }) {
    try {
      let [res1] = await Promise.all([app.$axios.get(`/getCategories`)]);
      // console.log(data)
      return {
        categories: res1.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      form: {
        title: "",
        category_id: 0,
        text: "",
        feature_image: "",
        tags: [
          // {tag:'shirt'},
          // {tag:'pant'}
          // 'pant','shirt'
        ]
      },
      tag_text: "",
      editorOption: {
        // some quill options
        modules: {
          toolbar: [
            ["bold", "italic", "underline", "strike"],
            ["blockquote", "code-block"],
            [{ header: 1 }, { header: 2 }],
            [{ list: "ordered" }, { list: "bullet" }],
            [{ script: "sub" }, { script: "super" }],
            [{ indent: "-1" }, { indent: "+1" }],
            [{ direction: "rtl" }],
            [{ size: ["small", false, "large", "huge"] }],
            [{ header: [1, 2, 3, 4, 5, 6, false] }],
            [{ font: [] }],
            [{ color: [] }, { background: [] }],
            [{ align: [] }],
            ["clean"]
            // ['link', 'image', 'video']
          ]
          // syntax: {
          //   highlight: text => hljs.highlightAuto(text).value
          // }
        }
      },
      imgURL: "",
      visible: false,
      uploadList: [],
      quill_char_length:0,
      loading: false,
    };
  },
  methods: {
    addTag() {
      if (this.tag_text == "") {
        return;
      }
      this.form.tags.push({ tag: this.tag_text });
      // this.form.tags.push(this.tag_text);
      this.tag_text = "";
    },
    removeTag(index) {
      this.form.tags.splice(index, 1);
    },
    onEditorChange({ editor, html, text }) {
      // console.log("editor change! editor:", editor);
      // console.log("editor change! html:", html);
      // console.log("editor change! text", text);
      this.quill_char_length=html.length
      // console.log(this.quill_char_length)
      if(this.quill_char_length<=3000){
        this.form.text = html;
      }else{
        this.wr('Text character limit reached!')
      }
    },

    async createBlog() {
      // console.log("create blog");
      this.loading= true
      if (this.form.category_id == 0) {
        this.e("Select a category");
        this.loading= false
        return;
      } else if (this.form.title == "") {
        this.e("Title can not be empty");
        this.loading= false
        return;
      } else if (this.form.text == "") {
        this.e("Discription can not be empty");
        this.loading= false
        return;
      }
      if (this.uploadList.length) {
        // console.log(this.uploadList[0].url);
        this.form.feature_image = this.uploadList[0].url;
      }
      // console.log(this.form);
      const res = await this.callApi("post", "/createBlog", this.form);
      if (res.status === 200) {
        this.s("Blog created successfully!");
        // console.log(res);
        if (res.data.token_value>0) {
          this.$store.dispatch('updateUserReceivedTokens', res.data.token_value)
          this.s("You have received "+res.data.token_value + " tokens");
        }else{
          this.wr("To get token you have to verify your account!");
        }
        // this.$router.push("/blog");
        this.$router.push(`/${this.authInfo.username}/blog`);
        this.loading= false
      } else {
        this.swr();
        this.loading= false
      }
    },

    async cancelCreate() {
      this.form.title = "";
      this.form.category_id = 0;
      this.form.text = "";
      // this.custom_product_image_create=null;
      this.form.tags.splice(0, this.form.tags.length);
      if (this.uploadList.length) {
        const res = await this.callApi("post", "/deleteImageFromFolder", {
          image: this.uploadList[0].url
        });
        if (res.status === 200) {
          // console.log(res);
        } else {
          this.swr();
        }
        this.uploadList.splice(0, this.uploadList.length);
      }
    },

    handleView(url) {
      this.imgURL = url;
      this.visible = true;
    },
    async handleRemove(file, index) {
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
    }
  }
};
</script>

<style scoped>
.tag_input_box input[type="text"] {
  width: 84%;
}
.tag_list li {
  display: inline-block;
  border: 1px solid #ddd;
  padding: 5px 10px;
  position: relative;
  margin-right: 11px;
  margin-bottom: 15px;
  margin-top: 5px;
  /* margin: 5px 5px 15px 5px */
}
</style>



