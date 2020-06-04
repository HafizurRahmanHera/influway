<template>
<no-ssr>
  <div class="d-flex align-items-center bg-auth border-top border-top-2 border-primary">
  <div class="container">
      <div class="row align-items-center">
        <div class="col-12 col-md-6 offset-xl-2 offset-md-1 order-md-2 mb-5 mb-md-0">

          <!-- Image -->
          <div class="text-center">
            <img src="/img/illustrations/happiness.svg" alt="..." class="img-fluid">
          </div>

        </div>
        <div class="col-12 col-md-5 col-xl-4 order-md-1 my-5">

          <!-- Heading -->
          <h1 class="display-4 text-center mb-3">
            Welcome To Influway
          </h1>

          <!-- Subheading -->
          <p class="text-muted text-center mb-5">
            Sign in to your account.
          </p>

          <!-- Form -->
          <form v-on:submit.prevent="onSubmit">

            <!-- Email address -->
            <div class="form-group">

              <!-- Label -->
              <label>Email Address</label>

              <!-- Input -->
              <input v-model="formData.email" type="email" class="form-control" placeholder="name@address.com">

            </div>

            <!-- Password -->
            <div class="form-group">

              <div class="row">
                <div class="col">

                  <!-- Label -->
                  <label>Password</label>

                </div>
                <div class="col-auto">

                  <!-- Help text -->
                  <!-- <a href="password-reset-illustration.html" class="form-text small text-muted"> -->
                  <a href="#" class="form-text small text-muted">
                    Forgot password?
                  </a>

                </div>
              </div> <!-- / .row -->

              <!-- Input group -->
              <div class="input-group input-group-merge">

                <!-- Input -->
                <input v-model="formData.password" type="password" class="form-control form-control-appended" placeholder="Enter your password">

                <!-- Icon -->
                <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fas fa-lock"></i>
                  </span>
                </div>

              </div>
            </div>

            <!-- Submit -->
            <button :disabled="loading" class="btn btn-lg btn-block btn-primary mb-3" type="submit">
              Sign in
            </button>

            <!-- Link -->
            <div class="text-center">
              <small class="text-muted text-center">
                <!-- Don't have an account yet? <a href="sign-up-illustration.html">Sign up</a>. -->
                Don't have an account yet? <a href="https://influway.com/">Sign up</a>.
              </small>
            </div>

          </form>

        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->
    </div>
  </no-ssr>
</template>
<script>
export default {
  middleware: 'guest',
    data(){
        return{
            formData:{
                email:'',
                password:'',
                remember: false,
            },
            loading:false
        }
    },

  methods: {
      async onSubmit(){
        this.loading = true
        if (this.formData.email=='' || this.formData.password=='') {
            this.e('field can not be empty')
            this.loading = false
            return
        }
        // console.log(this.formData)
        // return

          const res = await this.callApi('post','/login',this.formData)
          if(res.status===200){
              // this.s("Login Successfully !")
              // this.$store.dispatch('setAuthInfo',res.data)
              // this.$router.push('/')
              // console.log('login success')
              this.$router.go(0);
              // // this.$router.push('/')
              // // window.location= '/'
              // console.log(this.authInfo)
              // if(this.authInfo.role==1){
              //     // this.$router.push('flanker/'+this.authInfo.id)
              //     // window.location= '/flanker/'+this.authInfo.id
              //     this.$router.push('/product_post')
              // }
              // else if(this.authInfo.role==2){
              //       // window.location ='/profile/'+this.authInfo.id
              //       this.$router.push('/')
              // }
          }
          else if(res.status==401){
              this.e(res.data.message)
              this.loading = false
          }
          else{
              this.swr();
              this.loading = false
          }
      },

    created(){
    }
  }

}
</script>
