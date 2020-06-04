export default function ({ store, redirect }) {
    // If the user is not authenticated
    if(store.state.authInfo) {
      let user=store.state.authInfo
      // if (user.role!=2) {
        // return redirect('/product_post')
        return redirect(`/${user.username}/blog`)
      // }
    }else{
      return redirect('/login')
    }
  }
