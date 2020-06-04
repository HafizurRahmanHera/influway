import Vue from "vue";
import { mapGetters } from "vuex";



import moment from 'moment'
Vue.filter('myDate', function (value) {
    if (!value) return ''
    //return value
    var offset = new Date().getTimezoneOffset();
    //console.log('offset', offset)
    let o = Math.abs(offset)
    var testDateUtc = moment.utc(value);
    var localDate = moment(testDateUtc).utcOffset(o);
    return moment(localDate).fromNow()
    // return localDate.format("YYYY-MM-DD hh:mm:ss")
});

Vue.mixin({
  methods: {
    async callApi(method, url, dataObj) {
      try {
        let data = await this.$axios({
          method: method,
          url: url,
          data: dataObj
        });
        return data;
      } catch (e) {
        return e.response;
      }
    },

    in(msg, i = "Hey!") {
      this.$Notice.info({
        title: i,
        desc: msg
      });
    },
    s(msg, i = "Great!") {
      this.$Notice.success({
        title: i,
        desc: msg
      });
    },
    wr(msg, i = "Hi!") {
      this.$Notice.warning({
        title: i,
        desc: msg
      });
    },
    e(msg, i = "Oops!") {
      this.$Notice.error({
        title: i,
        desc: msg
      });
    },
    swr() {
      this.$Notice.error({
        title: "Oops",
        desc: "Something went wrong, please try again later"
      });
    },

    // message

    ns(title) {
      this.$Message.success(title);
    },
    ni(title) {
      this.$Message.info(title);
    },
    nw(title) {
      this.$Message.warning(title);
    },
    ne(title) {
      this.$Message.error(title);
    },
    nswr() {
      this.$Message.error("Something went wrong, please try again later");
    },

    // calculate current token amount
    currentTotalToken(userTokens){
      if (userTokens.receivedTokens && userTokens.deductedTokens) {
        return Number(userTokens.receivedTokens.tokens)-Number(userTokens.deductedTokens.tokens)
      }else if(userTokens.receivedTokens && userTokens.deductedTokens==null){
        return userTokens.receivedTokens.tokens
      }else if(userTokens.receivedTokens==null && userTokens.deductedTokens){
        return 0-Number(userTokens.deductedTokens.tokens)
      }else{
        return 0
      }
    },

    // shorten text to a certain character length with end of word
    shortenText(text,char_length=750){
      if (text=='' || text.length<=char_length+50) {
        return text
      }
      // var yourString = "The quick brown fox jumps over the lazy dog"; //replace with your string.
      var maxLength = char_length // maximum number of characters to extract

      //trim the string to the maximum length
      var trimmedString = text.substr(0, maxLength);

      //re-trim if we are in the middle of a word
      trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(".")))
      if (trimmedString.length>(char_length+50)) {
        return trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))+' ...'
      }else{
        return trimmedString+' ...'
      }

    }

  },
  computed: {
    ...mapGetters({
      authInfo: "getAuthInfo",
      authHiddenInfo: "getAuthHiddenInfo",
      isLoggedIn: "getIsLoggedIn",
      userTokens: "getUserTokens",
      userFollowInfo: "getUserFollowInfo",
      likeTokenValue: "getLikeTokenValue",
    })
  }
});
