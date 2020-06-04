export default function ({ store, redirect }) {
    // If the user is not authenticated
    if(store.state.authInfo) {
      return redirect('/')
      // let user=store.state.authInfo
      // if (user.role==1) {
      //   // return redirect('/product_post')
      //   return redirect('/')
      // }else if(user.role==2){
      //   return redirect('/')
      // }
      // return redirect('/')
    }
  }
