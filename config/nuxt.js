"use strict";

const resolve = require("path").resolve;

module.exports = {
  /*
   ** Headers of the page
   */
  modules: [
    "@nuxtjs/axios"

    // With options
  ],
  axios: {
    baseURL: "https://app.influway.com"
  },

  build: {
    extractCSS: true
  },

  plugins: [
    "~plugins/vuecommon",
    // { src: "~plugins/vuecommon", ssr: false },
    // "~plugins/iview",
    { src: "~plugins/iview", ssr: false },
    { src: "~plugins/grid_layout", ssr: false },
    { src: "~plugins/quill.js", ssr: false }
  ],

  head: {
    title: "INFLUWAY",
    meta: [
      {
        charset: "utf-8"
      },
      {
        name: "viewport",
        content: "width=device-width, initial-scale=1"
      },
      {
        hid: "description",
        name: "description",
        content: "INFLUWAY project"
      }
    ],
    link: [
      {
        rel: "icon",
        type: "image/x-icon",
        // href: "favicon.ico"
        href: "/favicon1.png"
      },
      // { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.7.2/css/all.css' },
      // new css
      // { rel: 'stylesheet', href: "/css/common2.css" },
      // { rel: 'stylesheet', href: "/css/main.css" },

      // new css
      // { rel: 'stylesheet', href: "/css/vendor.bundle49f7.css?ver=104" },
      // { rel: 'stylesheet', href: "/css/style49f7.css?ver=104" },

      { rel: 'stylesheet', href: 'https://use.fontawesome.com/releases/v5.7.2/css/all.css' },
      // new desing
      { rel: 'stylesheet', href: "/css/feather.min.css" },
      { rel: 'stylesheet', href: "/css/flatpickr.min.css" },
      { rel: 'stylesheet', href: "/css/quill.core.css" },
      { rel: 'stylesheet', href: "/css/select2.min.css" },
      { rel: 'stylesheet', href: "/css/vs2015.css" },
      { rel: 'stylesheet', href: 'https://api.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.css' },
      { rel: 'stylesheet', href: "/css/theme.min.css" },
      { rel: 'stylesheet', href: "/css/adnan.css" },


    ],
    script: [
      // new script
      // { src: '/js/jquery.bundle49f7.js?ver=104' },
      // new design
      // { src: 'https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js' },
      { src: '/js/libs/jquery/dist/jquery.min.js' },
      { src: '/js/libs/bootstrap/dist/js/bootstrap.bundle.min.js' },
      { src: '/js/libs/@shopify/draggable/lib/es5/draggable.bundle.legacy.js' },
      { src: '/js/libs/autosize/dist/autosize.min.js' },
      { src: '/js/libs/chart.js/dist/Chart.min.js' },
      { src: '/js/libs/dropzone/dist/min/dropzone.min.js' },
      { src: '/js/libs/flatpickr/dist/flatpickr.min.js' },
      { src: '/js/libs/flatpickr/dist/flatpickr.min.js' },
      { src: '/js/libs/highlightjs/highlight.pack.min.js' },
      { src: '/js/libs/jquery-mask-plugin/dist/jquery.mask.min.js' },
      { src: '/js/libs/list.js/dist/list.min.js' },
      { src: '/js/libs/quill/dist/quill.min.js' },
      { src: '/js/libs/select2/dist/js/select2.min.js' },
      { src: '/js/libs/chart.js/Chart.extension.min.js' },
      { src: 'https://api.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.js' },
      { src: '/js/theme.min.js' },
    ]
  },
  /*
   ** Global CSS
   */
  css: [
    // "~assets/css/main.css"
    ],
  /*
   ** Customize the progress-bar color
   */
  loading: { color: "#744d82" },
  /*
   ** Point to resources
   */
  srcDir: resolve(__dirname, "..", "resources")
};
