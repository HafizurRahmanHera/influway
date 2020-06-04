<template>
<no-ssr>
		<!--===== Menu ========-->
		<nav class="navbar navbar-expand-lg navbar-light" id="topnav">
        <div class="container">

          <!-- Toggler -->
          <button class="navbar-toggler mr-auto" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <!-- Brand -->
          <!-- <a class="navbar-brand mr-auto" href="index.html">
            <img src="/img/logo.svg" alt="..." class="navbar-brand-img">
          </a> -->
          <nuxt-link to="/" class="navbar-brand mr-auto">
            <!-- <img src="/img/logo.svg" alt="..." class="navbar-brand-img"> -->
            <img src="/images/reg_logo.png" alt="..." class="navbar-brand-img">
          </nuxt-link>

          <!-- Form -->
          <form class="form-inline mr-4 d-none d-lg-flex">
            <!-- <div class="input-group input-group-rounded input-group-merge" data-toggle="lists" data-options='{"valueNames": ["name"]}'> -->
            <div class="input-group input-group-rounded input-group-merge" >

              <!-- Input -->
              <!-- <input type="search" class="form-control form-control-prepended  dropdown-toggle search" data-toggle="dropdown" placeholder="Search" aria-label="Search"> -->
              <input type="search" class="form-control form-control-prepended  dropdown-toggle search"  placeholder="Search" aria-label="Search">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <i class="fas fa-search"></i>
                </div>
              </div>

              <!-- Menu -->
              <div class="dropdown-menu dropdown-menu-card">
                <div class="card-body">

                  <!-- List group -->
                  <div class="list-group list-group-flush list my-n3">
                    <a href="team-overview.html" class="list-group-item px-0">
                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar">
                            <img src="/img/avatars/teams/team-logo-1.jpg" alt="..." class="avatar-img rounded">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Airbnb
                          </h4>

                          <!-- Time -->
                          <p class="small text-muted mb-0">
                            <span class="fe fe-clock"></span> <time datetime="2018-05-24">Updated 2hr ago</time>
                          </p>

                        </div>
                      </div> <!-- / .row -->
                    </a>
                    <a href="team-overview.html" class="list-group-item px-0">
                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar">
                            <img src="/img/avatars/teams/team-logo-2.jpg" alt="..." class="avatar-img rounded">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Medium Corporation
                          </h4>

                          <!-- Time -->
                          <p class="small text-muted mb-0">
                            <span class="fe fe-clock"></span> <time datetime="2018-05-24">Updated 2hr ago</time>
                          </p>

                        </div>
                      </div> <!-- / .row -->
                    </a>
                    <a href="project-overview.html" class="list-group-item px-0">

                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar avatar-4by3">
                            <img src="/img/avatars/projects/project-1.jpg" alt="..." class="avatar-img rounded">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Homepage Redesign
                          </h4>

                          <!-- Time -->
                          <p class="small text-muted mb-0">
                            <span class="fe fe-clock"></span> <time datetime="2018-05-24">Updated 4hr ago</time>
                          </p>

                        </div>
                      </div> <!-- / .row -->

                    </a>
                    <a href="project-overview.html" class="list-group-item px-0">

                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar avatar-4by3">
                            <img src="/img/avatars/projects/project-2.jpg" alt="..." class="avatar-img rounded">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Travels & Time
                          </h4>

                          <!-- Time -->
                          <p class="small text-muted mb-0">
                            <span class="fe fe-clock"></span> <time datetime="2018-05-24">Updated 4hr ago</time>
                          </p>

                        </div>
                      </div> <!-- / .row -->

                    </a>
                    <a href="project-overview.html" class="list-group-item px-0">

                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar avatar-4by3">
                            <img src="/img/avatars/projects/project-3.jpg" alt="..." class="avatar-img rounded">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Safari Exploration
                          </h4>

                          <!-- Time -->
                          <p class="small text-muted mb-0">
                            <span class="fe fe-clock"></span> <time datetime="2018-05-24">Updated 4hr ago</time>
                          </p>

                        </div>
                      </div> <!-- / .row -->

                    </a>
                    <a href="profile-posts.html" class="list-group-item px-0">

                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar">
                            <img src="/img/avatars/profiles/avatar-1.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Dianna Smiley
                          </h4>

                          <!-- Status -->
                          <p class="text-body small mb-0">
                            <span class="text-success">●</span> Online
                          </p>

                        </div>
                      </div> <!-- / .row -->

                    </a>
                    <a href="profile-posts.html" class="list-group-item px-0">

                      <div class="row align-items-center">
                        <div class="col-auto">

                          <!-- Avatar -->
                          <div class="avatar">
                            <img src="/img/avatars/profiles/avatar-2.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>

                        </div>
                        <div class="col ml-n2">

                          <!-- Title -->
                          <h4 class="text-body mb-1 name">
                            Ab Hadley
                          </h4>

                          <!-- Status -->
                          <p class="text-body small mb-0">
                            <span class="text-danger">●</span> Offline
                          </p>

                        </div>
                      </div> <!-- / .row -->

                    </a>
                  </div>

                </div>
              </div> <!-- / .dropdown-menu -->

            </div>
          </form>

          <!-- User -->
          <div class="navbar-user">

            <!-- Dropdown -->
            <!-- <div class="dropdown mr-4 d-none d-lg-flex"> -->

              <!-- Toggle -->
              <!-- <a href="#" class="navbar-user-link" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="icon active">
                  <i class="fe fe-bell"></i>
                </span>
              </a> -->

              <!-- Menu -->
              <!-- / .dropdown-menu -->

            <!-- </div> -->

            <!-- Dropdown -->
            <div class="dropdown">

              <!-- Toggle -->
              <a href="#" class="avatar avatar-sm avatar-online dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img v-if="authInfo.image" :src="authInfo.image" :alt="authInfo.name" class="avatar-img rounded-circle">
                <img v-else src="/images/default.jpg" :alt="authInfo.name" class="avatar-img rounded-circle">
              </a>

              <!-- Menu -->
              <div class="dropdown-menu dropdown-menu-right">
                <!-- <a href="profile-posts.html" class="dropdown-item">Profile</a> -->
                  <nuxt-link :to="`/${authInfo.username}`" class="dropdown-item">My Profile
                  </nuxt-link>
                  <!-- <a href="settings.html" class="dropdown-item">Settings</a> -->


                  <a v-if="authInfo.user_own_site" :href="`https://site.influway.com/sites/${authInfo.username}`" class="dropdown-item">My Site</a>
                  <a v-else @click="wr('You do not have a site! Please create your site.')" class="dropdown-item">My Site</a>


                  <nuxt-link to="/user/token_transaction" class="dropdown-item">Token Transaction
                  </nuxt-link>
                  <hr class="dropdown-divider">
                  <nuxt-link to="/profile" class="dropdown-item">Edit Site
                  </nuxt-link>
                  
                  <nuxt-link to="/profile" class="dropdown-item">Edit Profile
                  </nuxt-link>
                  <!-- <a href="sign-in.html" class="dropdown-item">Logout</a> -->
                  <button @click="logOut" class="dropdown-item">Logout</button>
                  <!-- <nuxt-link @click="logOut" class="dropdown-item">Logout -->
                  <!-- </nuxt-link> -->
              </div>

            </div>

          </div>

          <!-- Collapse -->
          <div class="collapse navbar-collapse mr-auto order-lg-first" id="navbar">

            <!-- Form -->
            <form class="mt-4 mb-3 d-md-none">
              <input type="search" class="form-control form-control-rounded" placeholder="Search" aria-label="Search">
            </form>

            <!-- Navigation -->
            <!-- <ul class="navbar-nav mr-auto">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle " href="#" id="topnavDashboards" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Dashboards
                </a>
                <ul class="dropdown-menu" aria-labelledby="topnavDashboards">
                  <li>
                    <a class="dropdown-item " href="index.html">
                      Default
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="dashboard-alt.html">
                      Alternative
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="topnavPages" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Pages
                </a>
                <ul class="dropdown-menu" aria-labelledby="topnavPages">
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle " href="#" id="topnavProfile" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Profile
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavProfile">
                      <a class="dropdown-item " href="profile-posts.html">
                        Posts
                      </a>
                      <a class="dropdown-item " href="profile-groups.html">
                        Groups
                      </a>
                      <a class="dropdown-item " href="profile-projects.html">
                        Projects
                      </a>
                      <a class="dropdown-item " href="profile-files.html">
                        Files
                      </a>
                      <a class="dropdown-item " href="profile-subscribers.html">
                        Subscribers
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle " href="#" id="topnavProject" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Project
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavProject">
                      <a class="dropdown-item " href="project-overview.html">
                        Overview
                      </a>
                      <a class="dropdown-item " href="project-files.html">
                        Files
                      </a>
                      <a class="dropdown-item " href="project-reports.html">
                        Reports
                      </a>
                      <a class="dropdown-item " href="project-new.html">
                        New project
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle " href="#" id="topnavTeam" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Team
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavTeam">
                      <a class="dropdown-item " href="team-overview.html">
                        Overview
                      </a>
                      <a class="dropdown-item " href="team-projects.html">
                        Projects
                      </a>
                      <a class="dropdown-item " href="team-members.html">
                        Members
                      </a>
                      <a class="dropdown-item " href="team-new.html">
                        New team
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle active" href="#" id="topnavFeed" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Feed
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavFeed">
                      <a class="dropdown-item " href="feed.html">
                        Platform
                      </a>
                      <a class="dropdown-item active" href="social-feed.html">
                        Social
                      </a>
                    </div>
                  </li>
                  <li>
                    <a class="dropdown-item " href="kanban.html">
                      Kanban
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="orders.html">
                      Orders
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="settings.html">
                      Settings
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="invoice.html">
                      Invoice
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="pricing.html">
                      Pricing
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="topnavAuth" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Auth
                </a>
                <ul class="dropdown-menu" aria-labelledby="topnavAuth">
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle" href="#" id="topnavSignIn" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Sign in
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavSignIn">
                      <a class="dropdown-item" href="sign-in-cover.html">
                        Cover
                      </a>
                      <a class="dropdown-item" href="sign-in-illustration.html">
                        Illustration
                      </a>
                      <a class="dropdown-item" href="sign-in-basics.html">
                        Basic
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle" href="#" id="topnavSignUp" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Sign up
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavSignUp">
                      <a class="dropdown-item" href="sign-up-cover.html">
                        Cover
                      </a>
                      <a class="dropdown-item" href="sign-up-illustration.html">
                        Illustration
                      </a>
                      <a class="dropdown-item" href="sign-up.html">
                        Basic
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle" href="#" id="topnavPassword" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Password reset
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavPassword">
                      <a class="dropdown-item" href="password-reset-cover.html">
                        Cover
                      </a>
                      <a class="dropdown-item" href="password-reset-illustration.html">
                        Illustration
                      </a>
                      <a class="dropdown-item" href="password-reset.html">
                        Basic
                      </a>
                    </div>
                  </li>
                  <li class="dropright">
                    <a class="dropdown-item dropdown-toggle" href="#" id="topnavError" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Error
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnavError">
                      <a class="dropdown-item" href="error-illustration.html">
                        Illustration
                      </a>
                      <a class="dropdown-item" href="error.html">
                        Basic
                      </a>
                    </div>
                  </li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle " href="#" id="topnavDocumentation" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Docs
                </a>
                <ul class="dropdown-menu" aria-labelledby="topnavDocumentation">
                  <li>
                    <a class="dropdown-item " href="getting-started.html">
                      Getting started
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="components.html">
                      Components
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-item " href="changelog.html">
                      Changelog
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#modalDemo" data-toggle="modal">
                  Customize
                </a>
              </li>
            </ul> -->
            <ul class="navbar-nav">
                <li class="nav-item dropdown  ">
                  <nuxt-link to="/" class="nav-link " :class="($route.path=='/')?'active':''">
                    <!-- <span class="fe"><i class="fas fa-code-branch"></i></span> -->
                    Explore
                  </nuxt-link>

                </li>
                <!-- influencer -->
                <template v-if="authInfo.role==2">
                <li class="nav-item dropdown">
                  <!-- <nuxt-link to="/lookbook" class="nav-link" :class="($route.path=='/lookbook')?'active':''"> -->
                  <nuxt-link :to="`/${authInfo.username}`" class="nav-link" :class="($route.path==`/${authInfo.username}`)?'active':''">
								    <!-- <span class="fe"><i class="far fa-credit-card"></i></span> -->
								    LookBook
						  	  </nuxt-link>
                </li>
                <!-- <li class="nav-item dropdown">
                  <nuxt-link to="/collage" class="nav-link" :class="($route.path=='/collage')?'active':''">
								    <span class="fe"><i class="fas fa-columns"></i></span>Collage
						  	  </nuxt-link>
                </li> -->
                <li class="nav-item dropdown">
                  <!-- <nuxt-link to="/blog" class="nav-link" :class="($route.path=='/blog')?'active':''"> -->
                  <nuxt-link :to="`/${authInfo.username}/blog`" class="nav-link" :class="($route.path==`/${authInfo.username}/blog`)?'active':''">
								    <!-- <span class="fe"><i class="fab fa-blogger"></i></span> -->
                    Blog
						  	  </nuxt-link>
                </li>
                <li class="nav-item dropdown">
                  <!-- <nuxt-link to="/vlog" class="nav-link" :class="($route.path=='/vlog')?'active':''"> -->
                  <nuxt-link :to="`/${authInfo.username}/vlog`" class="nav-link" :class="($route.path==`/${authInfo.username}/vlog`)?'active':''">
								    <!-- <span class="fe"><i class="fab fa-blogger"></i> </span> -->
                    Vlog
						  	  </nuxt-link>
                </li>

                <!-- <li class="nav-item dropdown">
                  <nuxt-link :to="`/${authInfo.username}/status`" class="nav-link" :class="($route.path==`/${authInfo.username}/status`)?'active':''">

                    Status
						  	  </nuxt-link>
                </li> -->

                <!-- <li class="nav-item dropdown">
                  <template v-if="authInfo.apiToken">
                    <a :href="`https://site.influway.com/session.php?token=${authInfo.apiToken}`" class="nav-link" >
                      {{authInfo.user_own_site? 'Edit your site': 'Create your site'}}
                    </a>
                  </template>
                  <template v-else>
                    <a @click="wr('Please logout and login again!')"  class="nav-link" >
                      Create your site
                    </a>
                  </template>
                </li> -->


                <!-- <li class="nav-item dropdown">
                  <template v-if="authInfo.user_own_site">
                    <a :href="`https://site.influway.com/sites/${authInfo.username}`" class="nav-link" >
                      My site
                    </a>
                  </template>
                  <template v-else>
                    <a @click="wr('You do not have a site! Please create your site.')"  class="nav-link" >
                      My site
                    </a>
                  </template>
                </li> -->

                </template>
                <!-- seller -->
                <template v-else-if="authInfo.role==1">
                <li class="nav-item dropdown">
                  <nuxt-link :to="`/store/${authInfo.username}`" class="nav-link" :class="($route.path== `/store/${authInfo.username}` )?'active':''">
								    <!-- <i class="fe fe-user"></i>My Products -->
                    <!-- <span class="fe"><i class="far fa-credit-card"></i></span> -->
                    My Store
						  	  </nuxt-link>
                </li>
                <li class="nav-item dropdown">
                  <nuxt-link to="/retail" class="nav-link" :class="($route.path=='/retail')?'active':''">
								    <!-- <i class="fe fe-user"></i>My Products -->
                    <!-- <span class="fe"><i class="far fa-credit-card"></i></span> -->
                    My Products
						  	  </nuxt-link>
                </li>

                <li class="nav-item dropdown">
                  <nuxt-link to="/product_post" class="nav-link" :class="($route.path=='/product_post')?'active':''">
								    <!-- <i class="fe fe-user"></i>Post Product -->
                    <!-- <span class="fe"><i class="fas fa-columns"></i></span> -->
                    Post Product
						  	  </nuxt-link>
                </li>
                </template>
                <li class="nav-item dropdown">
                  <nuxt-link to="/store" class="nav-link" :class="($route.path=='/store')?'active':''">
								    <!-- <span class="fe"><i class="fas fa-store"></i> </span> -->
                    Store
						  	  </nuxt-link>
                </li>
                <template v-if="authInfo.role==2">
                <!-- <li class="nav-item dropdown">
                  <nuxt-link to="/story" class="nav-link" :class="($route.path=='/story')?'active':''">
								    <span class="fe"><i class="fas fa-user"></i> </span>Stories
						  	  </nuxt-link>
                </li> -->
                </template>
              </ul>

          </div>

        </div> <!-- / .container -->
      </nav>
		<!--===== Menu ========-->
</no-ssr>
</template>
<script>
// import Vue from 'vue'
// Vue.directive('click-outside', {
//     bind: function (el, binding, vnode) {
//       el.clickOutsideEvent = function (event) {
//         // here I check that click was outside the el and his childrens
//         if (!(el == event.target || el.contains(event.target))) {
//           // and if it did, call method provided in attribute value
//           vnode.context[binding.expression](event);
//         }
//       };
//       document.body.addEventListener('click', el.clickOutsideEvent)
//     },
//     unbind: function (el) {
//       document.body.removeEventListener('click', el.clickOutsideEvent)
//     },
//   });



export default {
  middleware: ["authenticated"],
  data(){
    return {
      show_user_option:false,
      tabindex:0
    }
  },
  methods:{
    async logOut() {
      const res = await this.callApi("get", "/logout");

      if (res.status === 204) {
        // this.s("You are logged out ...");
        // this.$store.dispatch("setAuthInfo", false);
        // this.$router.push('/login')
        this.$router.go(0);
        // window.location.href = '/login'
      }
    },
    // userOption(){

    // }
    handleFocus(){
      // console.log('handleFocus')
      // this.show_user_option=false
      this.tabindex = -1
    },
    handleFocusOut(){
      // console.log('handleFocusOut')
      this.show_user_option=false
      // this.tabindex = 0
    },
    goToProfile(){
      this.show_user_option=false
      this.$router.push('/profile')
    }
  },





}
</script>
<style >
/* .avatar-offline, .avatar-img, .avatar-online, .avatar-img {
  -webkit-mask-image: none;
} */
</style>
