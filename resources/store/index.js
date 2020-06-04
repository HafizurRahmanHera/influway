export const strict = false
export const state = () => ({
  authInfo: false,
  authHiddenInfo: false,
  showNavber: true,
  userTokens: false,
  userFollowInfo: false,
  likeTokenValue: false,
})

export const getters = {
  getIsLoggedIn (state) {
    return !!state.authInfo
  },
  getAuthInfo (state) {
    return state.authInfo
  },
  getAuthHiddenInfo (state) {
    return state.authHiddenInfo
  },
  getShowNavber (state) {
    return state.showNavber
  },
  getUserTokens (state) {
    return state.userTokens
  },
  getUserFollowInfo (state) {
    return state.userFollowInfo
  },
  getLikeTokenValue (state) {
    return state.likeTokenValue
  }
}

export const mutations = {
  setAuthInfo (state, data) {
    // console.log('setAuthInfo')
    state.authInfo = data
  },
  setAuthHiddenInfo (state, data) {
    // console.log('setAuthInfo')
    state.authHiddenInfo = data
  },
  setShowNavber (state, data) {
    state.showNavber = data
  },
  setUserTokens (state, data) {
    // console.log('setUserTokens')
    // console.log(data)
    state.userTokens = data
  },
  updateUserReceivedTokens (state, data) {
    if (state.userTokens && state.userTokens.receivedTokens) {
      state.userTokens.receivedTokens.tokens += data
    }else{
      let item ={
        tokens: data
      }
      state.userTokens.receivedTokens = item
    }
  },
  updateUserDeductedTokens (state, data) {
    if (state.userTokens && state.userTokens.deductedTokens) {
      state.userTokens.deductedTokens.tokens += data
    }else{
      let item ={
        tokens: data
      }
      state.userTokens.deductedTokens = item
    }
  },

  setUserFollowInfo (state, data) {
    // console.log('setUserTokens')
    // console.log(data)
    state.userFollowInfo = data
  },
  updateUserFollowingCount (state, data) {
    if(data=='add'){
      state.userFollowInfo.following_count++
    }else if(data=='minus'){
      if (state.userFollowInfo.following_count!=0) {
        state.userFollowInfo.following_count--
      }
    }
  },
  setLikeTokenValue (state, data) {
    state.likeTokenValue = data
  },
}

export const actions = {
  async nuxtServerInit ({ commit }, {$axios}) {
    try {
           // get the initial data
      let res = await $axios.get('/app/initdata')
      // update the state of the aiuth
      // commit('setAuthInfo', data.user)
      commit('setAuthInfo', res.data.user)
      commit('setAuthHiddenInfo', res.data.hidden_info)
            // console.log(res.data)
    } catch (e) {
      console.log(e.response)
    }
  },
  setAuthInfo ({commit}, data) {
    commit('setAuthInfo', data)
  },
  setAuthHiddenInfo ({commit}, data) {
    commit('setAuthHiddenInfo', data)
  },
  setShowNavber ({commit}, data) {
    commit('setShowNavber', data)
  },
  updateUserReceivedTokens ({commit}, data) {
    commit('updateUserReceivedTokens', data)
  },
  updateUserDeductedTokens ({commit}, data) {
    commit('updateUserDeductedTokens', data)
  },
  setUserTokens ({commit}, data) {
    commit('setUserTokens', data)
  },
  setUserFollowInfo ({commit}, data) {
    commit('setUserFollowInfo', data)
  },
  updateUserFollowingCount ({commit}, data) {
    commit('updateUserFollowingCount', data)
  },
  setLikeTokenValue ({commit}, data) {
    commit('setLikeTokenValue', data)
  },
}

