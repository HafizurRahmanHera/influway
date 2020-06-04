<template>
  <no-ssr>
    <!--===== Main Content ======-->
    <div class="_content">
      <div class="header">
      </div>
      <div class="_my_container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-12 col-lg-8">
            <div class="row">
              <!-- Left Section -->
              <div class="col-md-12">
                <div class="_1blog_section_all _box_shadow _border_radious _mar_b20 _padd25">
                  <!-- <form> -->
                  <div class="row">
                    <div class="col-12 col-md-12">
                      <h3 class="blog_section_left_h3">Edit Vlog</h3>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6">
                      <div class="_input_group">
                        <p class="_label">Title</p>
                        <Input v-model="form.title" placeholder="Vlog TItle" />
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

                    <div class="col-12 col-md-6 col-lg-6">
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
                        <p class="_label">Upload Video</p>

                        <Upload
                          class="vedio_upload"
                          ref="upload"
                          :on-success="handleSuccess"
                          :format="['mp4']"
                          :max-size="304800"
                          :on-format-error="handleFormatError"
                          :on-exceeded-size="handleMaxSize"
                          :before-upload="handleBeforeUpload"
                          action="/uploadVideo"
                          :on-remove="handleRemove"
                        >
                          <Button icon="ios-cloud-upload-outline">Select video</Button>
                        </Upload>
                        <ul class="ivu-upload-list" v-if="pre_uploaded">
                          <li class="ivu-upload-list-file ivu-upload-list-file-finish">
                            <span>
                              <i class="ivu-icon ivu-icon-ios-film"></i>
                              {{uploadList[0].name}}
                            </span>
                            <i
                              @click="removePreVideo"
                              class="ivu-icon ivu-icon-ios-close ivu-upload-list-remove"
                              style
                            ></i>
                          </li>
                        </ul>
                      </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12">
                      <div class="_input_group">
                        <p class="_label">Vlog Description</p>
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
                        <button :disabled="loading" @click="updateVlog" class="btn btn-primary lift" type="button">Update</button>
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
      let [res1, res2] = await Promise.all([
        app.$axios.get(`/getCategories`),
        app.$axios.get(`/getUserVlog/${params.id}`)
      ]);
      if (!res2.data) {
        // redirect("/vlog");
        redirect("/");
      }
      return {
        categories: res1.data,
        vlog: res2.data
      };
    } catch (error) {
      //return redirect('/404')
      return error;
    }
  },
  data() {
    return {
      form: {
        id: null,
        title: "",
        category_id: 0,
        text: "",
        video: "",
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
      pre_uploaded: true,
      uploadList: [],
      quill_char_length:0,
      loading: false,
    };
  },
  created() {

    this.form.id = this.vlog.id;
    this.form.title = this.vlog.title;
    this.quill_char_length=this.vlog.text.length
    if (this.vlog.category_id) {
      this.form.category_id = this.vlog.category_id;
    }
    this.form.text = this.vlog.text;
    this.form.video = this.vlog.video;
    if (this.vlog.video) {
      let video = {
        name: "video.mp4",
        percentage: 100,
        status: "finished",
        // uid:1234567,
        url: this.vlog.video
      };
      this.uploadList.push(video);
    }
    this.form.tags = this.vlog.vlogTags;
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

    async updateVlog() {
      // console.log("create vlog");
      this.loading= true
      if (this.form.title == "") {
        this.e("Title can not be empty");
        this.loading= false
        return;
      } else if (this.form.category_id == 0) {
        this.e("Select a category");
        this.loading= false
        return;
      } else if (this.form.text == "") {
        this.e("Discription can not be empty");
        this.loading= false
        return;
      } else if (!this.uploadList.length) {
        this.e("Select a video!");
        this.loading= false
        return;
      }
      if (this.uploadList.length) {
        // console.log(this.uploadList[0].url)
        this.form.video = this.uploadList[0].url;
      }
      // console.log(this.form);
      // return
      const res = await this.callApi("post", "/updateVlog", this.form);
      if (res.status === 200) {
        // console.log(res);
        this.s("Vlog updated Successfully !");
        // this.$router.push("/vlog");
        this.$router.push(`/${this.authInfo.username}/vlog`);
        this.loading= false
      } else {
        this.swr();
        this.loading= false
      }
    },

    async cancelCreate() {
      // this.$router.push("/vlog");
      this.$router.push(`/${this.authInfo.username}/vlog`);
      // this.form.title = '';
      // this.form.category_id = 0;
      // this.form.text = '';
      // this.custom_product_image_create=null;
      // this.form.tags.splice(0,this.form.tags.length);
      // if (this.uploadList.length) {
      //   const res = await this.callApi("post", "/deleteImageFromFolder", {image:this.uploadList[0].url});
      //   if (res.status === 200) {
      //     // console.log(res);
      //   } else {
      //     this.swr();
      //   }
      //   this.uploadList.splice(0,this.uploadList.length);
      // }
    },

    async handleRemove(file) {
      // console.log('remove video')
      // console.log(file.response.video_path)
      let video_path = file.response.video_path;
      const res = await this.callApi("post", "/deleteVideoFromFolder", {
        video: video_path
      });
      if (res.status === 200) {
        // console.log(res);
      } else {
        this.swr();
      }
      // remove image from folder
      this.uploadList.splice(0, 1);
      // console.log(this.uploadList);
    },
    handleSuccess(res, file) {
      // console.log(res);
      // console.log(file);
      if (res) {
        let video = {
          name: file.name,
          percentage: file.percentage,
          status: file.status,
          // uid:1234567,
          url: res.video_path
        };
        this.uploadList.push(video);
        // console.log(this.custom_product_image_create)
      }
      // console.log(this.uploadList);
    },
    handleFormatError(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc:
          "File format of " + file.name + " is incorrect, please select  mp4."
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "File  " + file.name + " is too large, no more than 300M."
      });
    },
    handleBeforeUpload() {
      const check = this.uploadList.length < 1;
      if (!check) {
        this.$Notice.warning({
          title: "1 video can be uploaded."
        });
      }
      return check;
    },

    removePreVideo() {
      // console.log("removePreVideo");
      this.uploadList.splice(0, 1);
      this.pre_uploaded = false;
      // console.log(this.uploadList);
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
