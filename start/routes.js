'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/guides/routing
|
*/

const Route = use('Route')


Route.post('/login', 'HomeController.userLogin').middleware('guest')
Route.post('/register', 'HomeController.userRegister').middleware('guest')

Route.get('/logout', 'HomeController.logout')


Route.post('/uploadImages', 'HomeController.uploadImages')
Route.post('/uploadVideo', 'HomeController.uploadVideo')

Route.get('/getProduct/:id', 'HomeController.getProductById')
Route.get('/getUserProduct/:id', 'HomeController.getUserProduct')

Route.get('/getCollageById/:id', 'HomeController.getCollageById')
Route.get('/getUserCollageProduct/:id', 'HomeController.getUserCollageProduct')


Route.get('/getUserCustomProducts', 'HomeController.getUserCustomProducts')
Route.get('/getUserFollowingCustomProducts', 'HomeController.getUserFollowingCustomProducts')
Route.get('/getUserFollowingCustomProductsTop4', 'HomeController.getUserFollowingCustomProductsTop4')
Route.get('/getUserCustomProductsById/:username', 'HomeController.getUserCustomProductsById')

Route.get('/getOwnerProfileById/:username', 'HomeController.getOwnerProfileById')

Route.get('/getCustomProductById/:id', 'HomeController.getCustomProductById')
Route.get('/getUserCustomProduct/:id', 'HomeController.getUserCustomProduct')

Route.get('/getPointProduct/:id', 'HomeController.getPointProduct')
Route.post('/searchProducts', 'HomeController.searchProducts')
Route.post('/createCustomProductLinks', 'HomeController.createCustomProductLinks')
Route.post('/updateCustomProductLinks', 'HomeController.updateCustomProductLinks')

Route.post('/updateCollageLinks', 'HomeController.updateCollageLinks')

Route.post('/postProduct', 'HomeController.postProduct')
Route.post('/updateProduct', 'HomeController.updateProduct')
Route.post('/deleteProduct', 'HomeController.deleteProduct')
Route.post('/deleteCustomProduct', 'HomeController.deleteCustomProduct')
Route.post('/deleteCollageProduct', 'HomeController.deleteCollageProduct')

Route.get('/getProducts', 'HomeController.getProducts')

Route.get('/getUserCollageProducts', 'HomeController.getUserCollageProducts')
Route.get('/getUserCollageProductsById/:username', 'HomeController.getUserCollageProductsById')

Route.get('/getRetailProducts', 'HomeController.getRetailProducts')
Route.get('/getCategories', 'HomeController.getCategories')
Route.get('/getSubcategories', 'HomeController.getSubcategories')
Route.get('/getStoreSubcategoriesById/:id', 'HomeController.getStoreSubcategoriesById')
Route.get('/getProductSubcategoriesById/:id', 'HomeController.getProductSubcategoriesById')
Route.get('/getColors', 'HomeController.getColors')
Route.get('/getSizes', 'HomeController.getSizes')
Route.post('/uploadUserImage', 'HomeController.uploadUserImage')
Route.post('/uploadCoverImage', 'HomeController.uploadCoverImage')

Route.post('/createCollageLinks', 'HomeController.createCollageLinks')

Route.get('/test', 'HomeController.test')


Route.get('/getShops', 'HomeController.getShops')


Route.get('/getShopProducts/:username', 'HomeController.getShopProducts')
Route.get('/getShopById/:username', 'HomeController.getShopById')
Route.post('/searchShopsByName', 'HomeController.searchShopsByName')
Route.post('/getShopsByCategoryId', 'HomeController.getShopsByCategoryId')

Route.post('/deleteImageFromFolder', 'HomeController.deleteImageFromFolder')
Route.post('/deleteVideoFromFolder', 'HomeController.deleteVideoFromFolder')
Route.post('/createBlog', 'HomeController.createBlog')
Route.post('/createVlog', 'HomeController.createVlog')
Route.get('/getUserBlogs', 'HomeController.getUserBlogs')
Route.get('/getUserBlogsById/:username', 'HomeController.getUserBlogsById')


Route.get('/getBlogById/:id', 'HomeController.getBlogById')
Route.get('/getUserBlog/:id', 'HomeController.getUserBlog')
Route.get('/getUserVlog/:id', 'HomeController.getUserVlog')

Route.post('/updateBlog', 'HomeController.updateBlog')
Route.post('/updateVlog', 'HomeController.updateVlog')
Route.post('/deleteBlog', 'HomeController.deleteBlog')
Route.post('/deleteVlog', 'HomeController.deleteVlog')

Route.get('/getUserVlogs', 'HomeController.getUserVlogs')
Route.get('/getUserVlogsById/:username', 'HomeController.getUserVlogsById')

Route.get('/getUserVlogById/:id', 'HomeController.getUserVlogById')
Route.get('/getUserBlogById/:id', 'HomeController.getUserBlogById')



// feed
Route.get('/getAllFeeds', 'HomeController.getAllFeeds')
Route.post('/postComment', 'HomeController.postComment')
Route.get('/getPopularProducts', 'HomeController.getPopularProducts')
Route.get('/getPopularStores', 'HomeController.getPopularStores')
Route.post('/deleteFeedLike', 'HomeController.deleteFeedLike')
Route.post('/postFeedLike', 'HomeController.postFeedLike')
Route.post('/postFeedStatusLike', 'HomeController.postFeedStatusLike')
Route.post('/deleteFeedStatusLike', 'HomeController.deleteFeedStatusLike')

// product review
Route.post('/postUserProductReview', 'HomeController.postUserProductReview')
Route.post('/updateUserProductReview', 'HomeController.updateUserProductReview')
// sort product
Route.post('/getShopProductsBySorting', 'HomeController.getShopProductsBySorting')

// user token, followers_count and following_count
Route.get('/getUserDetails', 'HomeController.getUserDetails')


// follow and unfollow user
Route.post('/followUser', 'HomeController.followUser')
Route.post('/unfollowUser', 'HomeController.unfollowUser')

//get Category By Id
Route.get('/getCategoryById/:id', 'HomeController.getCategoryById')

// update user/shop info,email and password
Route.post('/updateUserInfo', 'HomeController.updateUserInfo')
Route.post('/updateShopInfo', 'HomeController.updateShopInfo')
Route.post('/updateEmail', 'HomeController.updateEmail')
Route.post('/updatePassword', 'HomeController.updatePassword')
Route.post('/updateEthereumAddress', 'HomeController.updateEthereumAddress')

// get user token transaction
Route.get('/getUserAllTransactions', 'HomeController.getUserAllTransactions')
// create user verification form
Route.post('/createUserVerificationForm', 'HomeController.createUserVerificationForm')

// get Countries
Route.get('/getCountries', 'HomeController.getCountries')

// get Token Dollar Value
Route.get('/getTokenDollarValue', 'HomeController.getTokenDollarValue')

// get Token like Value
Route.get('/getLikeTokenValue', 'HomeController.getLikeTokenValue')


// get Follow Random 5 Users Suggestion
Route.get('/getFollowRandom5UserSuggestion', 'HomeController.getFollowRandom5UserSuggestion')

// post status
Route.post('/postStatus', 'HomeController.postStatus')

// status
Route.get('/getUserStatusById/:id', 'HomeController.getUserStatusById')
Route.get('/getUserStatusesById/:username', 'HomeController.getUserStatusesById')
Route.get('/getUserStatuses', 'HomeController.getUserStatuses')
Route.post('/deleteStatus', 'HomeController.deleteStatus')
Route.get('/getUserStatus/:id', 'HomeController.getUserStatus')
Route.post('/updateStatus', 'HomeController.updateStatus')

// get feed with acroll
Route.get('/getAllFeedsWithScroll/:id', 'HomeController.getAllFeedsWithScroll')

// Search route
Route.get('/app/searchByKey', 'HomeController.searchByKey')

Route.get('/app/getloginUser', 'HomeController.getloginUser')

Route.get('/app/initdata', 'HomeController.initdata')



// admin routes
// Route.get('/getUsersAllVerificationForms', 'AdminController.getUsersAllVerificationForms')
// Route.get('/getVerificationFormsDetailsById/:id', 'AdminController.getVerificationFormsDetailsById')
// //
// Route.post('/approveUserVerificationForm', 'AdminController.approveUserVerificationForm')
// Route.post('/missingUserVerificationForm', 'AdminController.missingUserVerificationForm')
// Route.post('/cancelUserVerificationForm', 'AdminController.cancelUserVerificationForm')
// Route.post('/deleteUserVerificationForm', 'AdminController.deleteUserVerificationForm')



Route.any('*', 'NuxtController.render')
