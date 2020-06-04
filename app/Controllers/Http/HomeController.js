'use strict'

const Helpers = use('Helpers')
const Product = use('App/Models/Product')
const CustomProduct = use('App/Models/CustomProduct')
const CustomProductLink = use('App/Models/CustomProductLink')
const User = use('App/Models/User')
const Category = use('App/Models/ProductCategory')
const Color = use('App/Models/Color')
const Size = use('App/Models/Size')
const ProductColor = use('App/Models/ProductColor')
const ProductSize = use('App/Models/ProductSize')
const ProductImage = use('App/Models/ProductImage')
const Collage = use('App/Models/Collage')
const CollageLinkedProduct = use('App/Models/CollageLinkedProduct')
const Blog = use('App/Models/Blog')
const BlogTag = use('App/Models/BlogTag')
const Vlog = use('App/Models/Vlog')
const VlogTag = use('App/Models/VlogTag')
const Feed = use('App/Models/Feed')
const Comment = use('App/Models/Comment')
const ProductTag = use('App/Models/ProductTag')
const Like = use('App/Models/Like')
const ProductReview = use('App/Models/ProductReview')
const TokenValue = use('App/Models/TokenValue')
const TokenTransaction = use('App/Models/TokenTransaction')
const Follow = use('App/Models/Follow')
const ProductCategory = use('App/Models/ProductCategory')
const VerificationForm = use('App/Models/VerificationForm')
const Country = use('App/Models/Country')
const TokenDollarValue = use('App/Models/TokenDollarValue')
const TokenDeductValue = use('App/Models/TokenDeductValue')
const Status = use('App/Models/Status')
const StatusImage = use('App/Models/StatusImage')
const Subcategory = use('App/Models/Subcategory')
const StoreSubcategory = use('App/Models/StoreSubcategory')
const ProductSubcategory = use('App/Models/ProductSubcategory')
const Hash = use('Hash')
const Database = use('Database')
const uniqid = require('uniqid')


const { validateAll } = use('Validator')

class HomeController {

  async uploadImages({ request, response }) {
    const uploadImage = request.file('file', {
        types: ['png', 'jpg', 'jpeg'],
        size: '5mb'
    })

    // console.log(uploadImage)
    const name = `${new Date().getTime()}` + '.' + uploadImage.subtype
    // const name = 'temp_custom_product.' + uploadImage.subtype

    await uploadImage.move(Helpers.publicPath('uploads'), {
        name: name
    })
    if (!uploadImage.moved()) {
        return uploadImage.error()
    }

    return response.status(200).json({
        message: 'Image has been uploaded successfully!',
        image_path: `/uploads/${name}`
    })
  }

  async uploadVideo({ request, response }) {
    const uploadVideo = request.file('file', {
        // types: ['png', 'jpg', 'jpeg'],
        types: ['mp4'],
        size: '305mb'
    })

    // console.log(uploadVideo)
    const name = `${new Date().getTime()}` + '.' + uploadVideo.subtype
    // const name = 'temp_custom_product.' + uploadVideo.subtype

    await uploadVideo.move(Helpers.publicPath('videos'), {
        name: name
    })
    if (!uploadVideo.moved()) {
        return uploadVideo.error()
    }

    return response.status(200).json({
        message: 'Video has been uploaded successfully!',
        video_path: `/videos/${name}`
    })
  }

  async getProducts({ request, response,auth }) {
     const user = await auth.getUser()
    // console.log(user)
    return await Product.query()
                        // .with('productCategory')
                        .with('subcategory.subcategory')
                        .with('productImages')
                        .with('productSizes.size')
                        .with('productColors.color')
                        .with('productTags')
                        .fetch()
  }
  async getloginUser({ request, response,auth }) {
     const user = await auth.getUser()
    return user;
  }

  async getRetailProducts({ request, response, auth }) {
    let user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1

    return await Product.query()
                        .where('user_id',user.id)
                        .orderBy('id','desc')
                        // .with('productCategory')
                        .with('subcategory.subcategory')
                        .with('productImages')
                        .with('productSizes.size')
                        .with('productColors.color')
                        .with('productTags')
                        .paginate(page, 10)
  }

  async getCategories({ request, response }) {
    return await Category.all()
  }
  async getSubcategories({ request, response }) {
    return await Subcategory.all()
  }
  async getStoreSubcategoriesById({ params, request, response }) {

    return await StoreSubcategory.query()
                                  .where('store_id', params.id)
                                  .with('subcategory')
                                  .fetch()
  }
  async getProductSubcategoriesById({ params, request, response }) {

    return await ProductSubcategory.query()
                                  .where('product_id', params.id)
                                  .with('subcategory')
                                  .fetch()
  }

  async getColors({ request, response }) {
    return await Color.all()
  }
  async getSizes({ request, response }) {
    return await Size.all()
  }

  async getProductById({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    const product = await Product.query()
                        .where('id', params.id)
                        // .with('productCategory')
                        .with('subcategory.subcategory')
                        .with('productImages')
                        .with('productSizes.size')
                        .with('productColors.color')
                        .with('productTags')
                        .with('allReviews.user')
                        .with('rating')
                        .with('userReview',(builder)=>{
                          builder.where('user_id',user.id)
                        })
                        .first()
    if (!product) {
      return {product:null,related_products:null}
    }
    const related_products = await Product.query()
                        .where('category_id', product.category_id)
                        .where('id','!=', product.id)
                        // .with('productCategory')
                        .with('subcategory.subcategory')
                        .with('productImages')
                        .with('productSizes')
                        .with('productSizes.size')
                        .with('productColors')
                        .with('productColors.color')
                        .with('productTags')
                        .limit(4)
                        .fetch()

    return {product:product,related_products:related_products}

    if (user.role==1) {
      return response.redirect('/retail')
    }else{
      return response.redirect('/')
    }

  }

  async getUserProduct({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    // console.log(user)
    const product = await Product.query()
                      .where('id', params.id)
                      .where('user_id', user.id)
                      // .with('productCategory')
                      .with('subcategory.subcategory')
                      .with('productImages')
                      .with('productSizes.size')
                      .with('productColors.color')
                      .with('productTags')
                      .first()
    return product
  }

  async getUserStatus({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    // console.log(user)
    const product = await Status.query()
                      .where('id', params.id)
                      .where('user_id', user.id)
                      .with('images')
                      .first()
    return product
  }

  async getCustomProductById({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    // let custom_product = await CustomProduct.query()
    //                   .where('id', params.id)
    //                   .first()

    return await CustomProduct.query()
                          .where('id', params.id)
                          .with('linkedProducts.product.productImages')
                          .with('comments.user')
                          .withCount('like')
                          .with('userLike', (builder)=>{
                            builder.where('user_id',user.id)
                          })
                          .with('user', (builder)=>{
                            builder.withCount('follower')
                              .withCount('following')
                            builder.with('follower', (builder)=>{
                              builder.where('follower_user_id', user.id)
                                // .where('following_user_id', custom_product.user_id)
                                .where('following_user_id',(builder)=>{
                                  builder.select('user_id')
                                        .from('custom_products')
                                        .where('id', params.id)
                                })
                                // .with('followerUser')
                                // .with('followingUser')
                            })
                          })
                          .first()

  }

  async getUserCustomProduct({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    // console.log(user)
    const custom_product = await CustomProduct.query()
                        .where('id', params.id)
                        .where('user_id', user.id)
                        .with('linkedProducts')
                        .with('linkedProducts.product')
                        .with('linkedProducts.product.productImages')
                        .first()
    return custom_product
  }

  async getCollageById({ params, request, response, view, auth }) {
    const user = await auth.getUser()

    // let collage = await Collage.query()
    //                   .where('id', params.id)
    //                   .first()

    const collage_product = await Collage.query()
                          .where('id', params.id)
                          .with('linkedProducts')
                          .with('linkedProducts.product')
                          .with('linkedProducts.product.productImages')
                          .with('comments')
                          .with('comments.user')
                          .withCount('like')
                          .with('userLike', (builder)=>{
                            builder.where('user_id',user.id)
                          })
                          .with('user', (builder)=>{
                            builder.withCount('follower')
                              .withCount('following')
                            builder.with('follower', (builder)=>{
                              builder.where('follower_user_id',user.id )
                                // .where('following_user_id', collage.user_id)
                                .where('following_user_id',(builder)=>{
                                  builder.select('user_id')
                                        .from('collages')
                                        .where('id', params.id)
                                })
                                // .with('followerUser')
                                // .with('followingUser')
                            })
                          })
                          .first()
      return collage_product
  }

  async getUserCollageProduct({ params, request, response, view, auth }) {
    const user = await auth.getUser()
    const collage_product = await Collage.query()
                        .where('id', params.id)
                        .where('user_id', user.id)
                        .with('linkedProducts')
                        .with('linkedProducts.product')
                        .with('linkedProducts.product.productImages')
                        .first()
      return collage_product
  }

  async deleteProduct({ params, request, response, view, auth }) {
    const product_id = request.all().id
    // console.log(product_id)
    const user = await auth.getUser()

    const product = await Product.query()
                        .where('id', product_id)
                        .where('user_id', user.id)
                        .with('productImages')
                        .first()

    if (!product) {
      return null
    }

    // ok
    const delete_custom_product_link = await CustomProductLink.query()
                        .where('linked_product_id', product_id)
                        .delete()

    // ok
    const delete_product_colors= await ProductColor.query()
                        .where('product_id', product_id)
                        .delete()
    // ok
    const delete_product_sizes= await ProductSize.query()
                        .where('product_id', product_id)
                        .delete()
    // ok
    const product_images= await ProductImage.query()
                        .where('product_id', product_id)
                        .fetch()

    const tem_product_images = product_images.toJSON()

    // ok
    const delete_product_images= await ProductImage.query()
                        .where('product_id', product_id)
                        .delete()

    // console.log(tem_product_images)

    let fs = require('fs');
    tem_product_images.forEach((element,index) => {
        // console.log(element)
        // console.log(element.id)
        fs.unlink('public'+element.image, function (err) {
          if (err) throw err;
          // if no error, file has been deleted successfully
          // console.log(element.image+' image deleted!');
        });
    });


    return await product.delete()

    return response.status(401).json(
        {
            'message': 'Something wrong happend.'
        }
    )


  }

  async test({ params, request, response, view, auth }) {

    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }
  console.log(user.email)
    // return user
      return response.status(200).json({
        'email': user.email,
        'user': user
      })

  }


  async deleteCustomProduct({ params, request, response, view, auth }) {
    const custom_product_id = request.all().id
    // console.log(custom_product_id)
    const user = await auth.getUser()

    const custom_product = await CustomProduct.query()
                        .where('id', custom_product_id)
                        .where('user_id', user.id)
                        .first()
    if (!custom_product) {
      return null
    }

    const delete_custom_product_link = await CustomProductLink.query()
                        .where('custom_product_id', custom_product_id)
                        .delete()

    let fs = require('fs');

    fs.unlink('public'+custom_product.image, function (err) {
      if (err) throw err;
      // if no error, file has been deleted successfully
      // console.log(custom_product.image+' image deleted!');
    });

    let delete_item = await custom_product.delete()

    // deduct token only if user is verified
    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenDeductValue.query().where('lookbook','!=','').first()
      // deduct user token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'delete',
        token:token_value.lookbook,
        item_type:"Lookbook",
        feed_id:null,
        user_id:user.id
      })
      return {delete_item:delete_item,token_value:token_value.lookbook}
    }

    return {delete_item:delete_item,token_value:0}


    return response.status(401).json(
        {
            'message': 'Something wrong happend.'
        }
    )

  }

  async deleteCollageProduct({ params, request, response, view, auth }) {
    const collage_product_id = request.all().id
    // console.log(collage_product_id)
    const user = await auth.getUser()

    const collage_product = await Collage.query()
                        .where('id', collage_product_id)
                        .where('user_id', user.id)
                        .first()
    if (!collage_product) {
      return null
    }

    // const delete_collage_product_link = await CollageLinkedProduct.query()
    //                     .where('collage_id', collage_product_id)
    //                     .delete()

    let delete_item = await collage_product.delete()

    // deduct token only if user is verified
    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenDeductValue.query().where('collage','!=','').first()
      // deduct user token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'delete',
        token:token_value.collage,
        item_type:"Collage",
        feed_id:null,
        user_id:user.id
      })
      return {delete_item:delete_item,token_value:token_value.collage}
    }
    return {delete_item:delete_item,token_value:0}

    return response.status(401).json(
        {
            'message': 'Something wrong happend.'
        }
    )


  }


  async getUserCustomProducts({ request, response, auth }) {
    let user = await auth.getUser()
    // console.log(user.id)
    let page = request.input('page') ? request.input('page') : 1
    return await CustomProduct.query()
                          .where('user_id', user.id)
                          .with('linkedProducts')
                          .with('comments')
                          .with('comments.user')
                          .with('linkedProducts.product')
                          .with('linkedProducts.product.productImages')
                          .with('linkedProducts.product.productSizes')
                          .with('linkedProducts.product.productColors')
                          .orderBy('id','desc')
                          .paginate(page, 10)
  }

  async getUserCustomProductsById({params, request, response, auth }) {
    let user = await auth.getUser()
    // console.log(user.id)
    let page = request.input('page') ? request.input('page') : 1
    return await CustomProduct.query()
                          // .where('user_id', params.id)
                          .where('user_id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                          .with('linkedProducts')
                          .with('comments')
                          .with('comments.user')
                          .with('linkedProducts.product')
                          .with('linkedProducts.product.productImages')
                          .with('linkedProducts.product.productSizes')
                          .with('linkedProducts.product.productColors')
                          .orderBy('id','desc')
                          .paginate(page, 10)
  }
  async getUserFollowingCustomProducts({params, request, response, auth }) {
    let user = await auth.getUser()
    // console.log(user.id)
    let page = request.input('page') ? request.input('page') : 1
    return await CustomProduct.query()
                          .whereIn('user_id', (builder)=>{
                            builder.select('following_user_id')
                                    .from('follows')
                                    .where('follower_user_id',user.id)
                          })
                          .with('user')
                          .with('comments.user')
                          .with('linkedProducts.product.productImages')
                          .with('linkedProducts.product.productSizes')
                          .with('linkedProducts.product.productColors')
                          .orderBy('id','desc')
                          .paginate(page, 10)
  }
  async getUserFollowingCustomProductsTop4({params, request, response, auth }) {
    let user = await auth.getUser()
    // console.log(user.id)
    return await CustomProduct.query()
                          .whereIn('user_id', (builder)=>{
                            builder.select('following_user_id')
                                    .from('follows')
                                    .where('follower_user_id',user.id)
                          })
                          .with('user')
                          .orderBy('id','desc')
                          .limit(4)
                          .fetch()
  }

  async getFollowRandom5UserSuggestion({params, request, response, auth }) {
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    // return await User.query().orderBy(Database.raw('RAND()')).limit(5).fetch();
    return await User.query()
                      .whereNot('id',user.id)
                      .where('role',2)
                      // .whereNot('id', '>', 15)
                      .whereNotIn('id', (builder)=>{
                            builder.select('following_user_id')
                                    .from('follows')
                                    .where('follower_user_id',user.id)
                          })
                      .orderBy(Database.raw('RAND()'))
                      .limit(5)
                      .fetch();
  }

  async getOwnerProfileById({params, request, response, auth }) {
    // console.log('getOwnerProfileById')
    let user = await auth.user
    return await User.query()
                          // .where('id', params.id)
                          .where('id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                          .withCount('follower')
                          .withCount('following')
                          .with('follower', (builder)=>{
                            builder.where('follower_user_id',user.id )
                                  .where('following_user_id', (builder)=>{
                                    builder.select('id')
                                      .from('users')
                                      .where('username',params.username)
                                  })
                                  // .with('followerUser')
                                  // .with('followingUser')
                          })
                          .first()
  }

  async getPointProduct ({response, params}) {
    return await Product.query()
                        .where('id', params.id)
                        .first()

  }

  async searchProducts ({request, response, session}) {
    // const data = request.all()
    const search = request.input('search')
    // return search
    return await Product.query()
                        .where('title', 'LIKE', '%'+search+'%')
                        .with('productImages')
                        .fetch()
  }

  async createCustomProductLinks ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    const cus_product = await CustomProduct.create({title:'custom pro',image:data.custom_product, user_id:user.id})
    // console.log('cus_pro')
    // console.log(cus_product)
    let custom_product_id=cus_product.id
     // let custom_product_id=3

    let link_product = []
    data.custom_product_links.forEach(element => {
      // console.log(element.x)
      let item = {
        x_cor:null,
        y_cor:null,
        linked_product_id:null,
        custom_product_id:null
      }
      item.x_cor= element.x
      item.y_cor= element.y
      item.linked_product_id= element.por_id
      item.custom_product_id= custom_product_id

      link_product.push(this.promiseFunction(item))
    });

    await Promise.all(link_product)

    // create feed
    let feed = await Feed.create({
      type:'lookbook',
      lookbook_id:custom_product_id,
    })

    // update custom product feed_id
    let update_pro = await CustomProduct.findOrFail(custom_product_id)
    update_pro.feed_id = feed.id
    await update_pro.save()


    // add token only if user is verified
    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenValue.query().where('lookbook','!=','').first()
      // add user token transaction
      const add_token = await TokenTransaction.create({
        action_type:'created',
        token:token_value.lookbook,
        item_type:"Lookbook",
        feed_id:feed.id,
        user_id:user.id
      })
      return {cus_product:cus_product,token_value:token_value.lookbook}
    }

    return {cus_product:cus_product,token_value:0}
  }

  async updateCustomProductLinks ({request, response, session, auth}) {
    const data = request.all()

    const user = await auth.getUser()

    const custom_product = await CustomProduct.findOrFail(data.custom_product_id)

    if (custom_product.user_id!=user.id) {
      return null
    }


    const delete_custom_product_links = await CustomProductLink.query()
                                      .where('custom_product_id',data.custom_product_id)
                                      .delete()

    let link_product = []
    data.custom_product_links.forEach(element => {
      let item = {
        x_cor:null,
        y_cor:null,
        linked_product_id:null,
        custom_product_id:null
      }
      item.x_cor= element.x
      item.y_cor= element.y
      item.linked_product_id= element.por_id
      item.custom_product_id= data.custom_product_id

      link_product.push(this.promiseFunction(item))
    });

    await Promise.all(link_product)

    return delete_custom_product_links
  }

  async updateCollageLinks ({request, response, session, auth}) {
    const data = request.all()

    const user = await auth.getUser()


    // const custom_product = await CustomProduct.findOrFail(data.custom_product_id)
    const collage_product = await Collage.findOrFail(data.collage_product_id)

    if (collage_product.user_id!=user.id) {
      return null
    }


    const delete_collage_product_links = await CollageLinkedProduct.query()
                                      .where('collage_id',data.collage_product_id)
                                      .delete()

    // console.log(data.collage_product_links)
    let link_product = []
    data.collage_product_links.forEach(element => {
      // console.log(element.x)
      let item = {
        x: 0,
        y: 0,
        w: 0,
        h: 0,
        i: 0,
        collage_id: null
      };
      item.x= element.x,
      item.y= element.y,
      item.w= element.w,
      item.h= element.h,
      item.i= element.i
      item.collage_id= collage_product.id
      link_product.push(this.promiseFunctionCollageLinkedProduct(item))
      // link_product.push(item)
    });
    // console.log(link_product)
    await Promise.all(link_product)

    return delete_collage_product_links
  }

  async createCollageLinks ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    const collage_product = await Collage.create({user_id:user.id})


    // console.log(data.collage_product_links)
    let link_product = []
    data.collage_product_links.forEach(element => {
      // console.log(element.x)
      let item = {
        x: 0,
        y: 0,
        w: 0,
        h: 0,
        i: 0,
        collage_id: null
      };
      item.x= element.x,
      item.y= element.y,
      item.w= element.w,
      item.h= element.h,
      item.i= element.i
      item.collage_id= collage_product.id
      link_product.push(this.promiseFunctionCollageLinkedProduct(item))
      // link_product.push(item)
    });
    // console.log(link_product)
    await Promise.all(link_product)

    // create feed
    let feed = await Feed.create({
      type:'collage',
      collage_id:collage_product.id,
    })

    // update custom product feed_id
    let update_pro = await Collage.findOrFail(collage_product.id)
    update_pro.feed_id = feed.id
    await update_pro.save()


    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenValue.query().where('collage','!=','').first()
      // console.log(token_value.collage)

      // add user token transaction
      const add_token = await TokenTransaction.create({
        action_type:'created',
        token:token_value.collage,
        item_type:"Collage",
        feed_id:feed.id,
        user_id:user.id
      })
      return {collage_product:collage_product, token_value:token_value.collage}
    }
    return {collage_product:collage_product, token_value:0}
  }

  async getUserCollageProducts({ request, response, auth }) {
    let user = await auth.getUser()
    // console.log(user.id)
    let page = request.input('page') ? request.input('page') : 1
    return await Collage.query()
                          .where('user_id', user.id)
                          .with('linkedProducts')
                          .with('linkedProducts.product')
                          .with('linkedProducts.product.productImages')
                          .orderBy('id','desc')
                          .paginate(page, 10)
  }

  async getUserCollageProductsById({params, request, response, auth }) {
    let page = request.input('page') ? request.input('page') : 1
    return await Collage.query()
                          // .where('user_id', params.id)
                          .where('user_id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                          .with('linkedProducts')
                          .with('linkedProducts.product')
                          .with('linkedProducts.product.productImages')
                          .orderBy('id','desc')
                          .paginate(page, 10)
  }


  async postProduct ({request, response, session, auth}) {
    const data = request.all()
    // return data
    let user = await auth.getUser()


    const product = await Product.create({
      title:data.title,
      price:data.price,
      stock:data.stock,
      details:data.details,
      category_id:data.category_id,
      user_id:user.id
    })


    // console.log(data.custom_product)
    // console.log(data.custom_product_links)


    let product_id=product.id
    // let product_id=2

    // const images = await ProductImage.create({
    //   image:data.product_image_path,
    //   product_id:product_id,
    // })

    let product_image = []
    data.images.forEach((element,index) => {
        if (element) {
          // console.log(element)
          // console.log(index)
          let item = {
            image:null,
            product_id:null
          }
          item.image= element.url
          item.product_id= product_id
          product_image.push(this.promiseFunctionProductImage(item))
        }
    })

    let product_color = []
    data.colors.forEach((element,index) => {
        if (element) {
          // console.log(element)
          // console.log(index)
          let item = {
            color_id:null,
            product_id:null
          }
          item.color_id= index
          item.product_id= product_id
          product_color.push(this.promiseFunctionProductColor(item))
        }
    })

    let product_size = []
    data.sizes.forEach((element,index) => {
      if (element) {
        // console.log(element)
        // console.log(index)
        let item = {
          size_id:null,
          product_id:null
        }

        item.size_id= index
        item.product_id= product_id
        product_size.push(this.promiseFunctionProductSize(item))
      }
    })

    let product_tag = []
    data.tags.forEach((element,index) => {
        if (element) {
          // console.log(element)
          // console.log(index)
          let item = {
            tag:null,
            product_id:null
          }
          item.tag= element.tag
          item.product_id= product_id
          product_tag.push(this.promiseFunctionProductTag(item))
        }
    })

    let subcategories = []
    data.subcategories.forEach(element => {
      // console.log(element)
      let item = {
        product_id:null,
        subcategory_id:null
      }
      item.product_id= product_id
      item.subcategory_id= element
      subcategories.push(this.promiseFunctionCreateProductSubcategories(item))
    });

    return product
  }

  promiseFunctionCreateProductSubcategories(data){
    ProductSubcategory.create(data)
  }

  async postStatus ({request, response, session, auth}) {
    const data = request.all()
    // return data

    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    const status = await Status.create({
      text:data.text,
      user_id:user.id
    })

    let status_id=status.id

    let status_image = []
    data.images.forEach((element,index) => {
        if (element) {
          // console.log(element)
          // console.log(index)
          let item = {
            image:null,
            status_id:null
          }
          item.image= element.url
          item.status_id= status_id
          status_image.push(this.promiseFunctionStatusImage(item))
        }
    })

    // create feed
    let feed = await Feed.create({
      type:'status',
      status_id:status_id,
    })

    // update custom product feed_id
    let update_status = await Status.findOrFail(status_id)
    update_status.feed_id = feed.id
    await update_status.save()


    // add token only if user is verified
    // if (user.verification_status==4) {
    //   // get token_vlaue
    //   let token_value = await TokenValue.query().where('lookbook','!=','').first()
    //   // add user token transaction
    //   const add_token = await TokenTransaction.create({
    //     action_type:'created',
    //     token:token_value.lookbook,
    //     item_type:"Lookbook",
    //     feed_id:feed.id,
    //     user_id:user.id
    //   })
    //   return {cus_product:cus_product,token_value:token_value.lookbook}
    // }
    // return {cus_product:cus_product,token_value:0}


    return await Feed.query()
                    .where('id',feed.id)

                    .with('status')
                    .with('status.user')
                    // .with('status.userDetails')
                    .with('status.comments')
                    .with('status.comments.user')
                    .with('status.images')

                    .with('userLike', (builder) => {
                      builder.where('user_id',user.id)
                    })
                    .withCount('like')
                    .first()

    // return status


  }

  promiseFunctionStatusImage(data){
    StatusImage.create(data)
  }

  async updateProduct ({request, response, session, auth}) {
    const data = request.all()
    // return data
    const user = await auth.getUser()

    const product_id=data.id

    const update_product = await Product.findOrFail(product_id)
    // console.log(custom_product)
    if (update_product.user_id!=user.id) {
      return null
    }

    update_product.title=data.title,
    update_product.price=data.price,
    update_product.details=data.details,
    update_product.category_id=data.category_id
    await update_product.save()

    const deleteImg = await ProductImage.query()
                                    .where('product_id',product_id)
                                    .delete()

    let product_image = []
    data.images.forEach((element,index) => {
        // console.log('image')
          // console.log(element.url)
          // console.log(index)
          let item = {
            image:null,
            product_id:null
          }
          item.image= element.url
          item.product_id= product_id
          product_image.push(this.promiseFunctionProductImage(item))
    })

    const deleteColor = await ProductColor.query()
                                    .where('product_id',product_id)
                                    .delete()

    let product_color = []
    data.colors.forEach((element,index) => {

          // console.log('color')
          // console.log(element)
          // console.log(index)
          let item = {
            color_id:null,
            product_id:null
          }
          item.color_id= element
          item.product_id= product_id
          product_color.push(this.promiseFunctionProductColor(item))

    })

    const deleteSize = await ProductSize.query()
                                    .where('product_id',product_id)
                                    .delete()

    let product_size = []
    data.sizes.forEach((element,index) => {

        // console.log('size')
        // console.log(element)
        let item = {
          size_id:null,
          product_id:null
        }

        item.size_id= element
        item.product_id= product_id
        product_size.push(this.promiseFunctionProductSize(item))

    })

    const deleteTag = await ProductTag.query()
                                    .where('product_id',product_id)
                                    .delete()

    let product_tag = []
    data.tags.forEach((element,index) => {
        // console.log('image')
          // console.log(element.url)
          // console.log(index)
          let item = {
            tag:null,
            product_id:null
          }
          item.tag= element.tag
          item.product_id= product_id
          product_tag.push(this.promiseFunctionProductTag(item))
    })

    const deleteSubcat = await ProductSubcategory.query()
                                    .where('product_id',product_id)
                                    .delete()

    let subcategories = []
    data.subcategories.forEach(element => {
      // console.log(element)
      let item = {
        product_id:null,
        subcategory_id:null
      }
      item.product_id= product_id
      item.subcategory_id= element
      subcategories.push(this.promiseFunctionCreateProductSubcategories(item))
    });

    return data.id
  }
  async updateStatus ({request, response, session, auth}) {
    const data = request.all()
    // return data
    const user = await auth.getUser()

    const status_id=data.id

    const update_status = await Status.findOrFail(status_id)
    // console.log(custom_product)
    if (update_status.user_id!=user.id) {
      return null
    }

    update_status.text=data.text,
    await update_status.save()

    const deleteImg = await StatusImage.query()
                                    .where('status_id',status_id)
                                    .delete()

    let product_image = []
    data.images.forEach((element,index) => {
        // console.log('image')
          // console.log(element.url)
          // console.log(index)
          let item = {
            image:null,
            status_id:null
          }
          item.image= element.url
          item.status_id= status_id
          product_image.push(this.promiseFunctionStatusImage(item))
    })


    return data.id
  }

  async uploadUserImage ({request, response, session, auth}) {
    const data = request.all()
    // return data
    let user = await auth.getUser()
    // console.log(data.image)

    // if (data.image) {
    //   const images = await User.query()
    //                             .where('id',user.id)
    //                             .update({
    //                               image:data.image
    //                             })
    //     return images
    // }
    let old_img = user.image
    if (data.image) {
      // user.image = data.image
      // await user.save()
      // console.log(old_img);
      // if (old_img) {
      //   let fs = require('fs');
      //   fs.unlink('public'+old_img, function (err) {
      //     if (err) throw err;
      //       // if no error, file has been deleted successfully
      //       console.log(old_img+' image deleted!');
      //   });
      // }

      // return user

      const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  image:data.image
                                })
      if (user_data) {
        const new_data = await User.query()
                      .where('id',user.id)
                      .first()
                      return new_data
      }else{
        return response.status(401).json(
          {
            'message': 'something wrong happend!.'
          }
        )
      }
    }

    return response.status(401).json(
        {
            'message': 'Invalid request.'
        }
    )

  }
  async uploadCoverImage ({request, response, session, auth}) {
    const data = request.all()
    // return data
    let user = await auth.getUser()
    // console.log(data.image)

    // if (data.image) {
    //   const images = await User.query()
    //                             .where('id',user.id)
    //                             .update({
    //                               image:data.image
    //                             })
    //     return images
    // }
    let old_img = user.cover_image
    if (data.image) {
      // user.cover_image = data.image
      // await user.save()
      // console.log(old_img);
      // if (old_img) {
      //   let fs = require('fs');
      //   fs.unlink('public'+old_img, function (err) {
      //     if (err) throw err;
      //       // if no error, file has been deleted successfully
      //       console.log(old_img+' image deleted!');
      //   });
      // }

      // return user

      const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  cover_image:data.image
                                })
      if (user_data) {
        const new_data = await User.query()
                      .where('id',user.id)
                      .first()
                      return new_data
      }else{
        return response.status(401).json(
          {
            'message': 'something wrong happend!.'
          }
        )
      }
    }

    return response.status(401).json(
        {
            'message': 'Invalid request.'
        }
    )

  }

  promiseFunctionCollageLinkedProduct(data){
    CollageLinkedProduct.create(data)
  }
  promiseFunctionProductImage(data){
    ProductImage.create(data)
  }
  promiseFunctionProductTag(data){
    ProductTag.create(data)
  }
  promiseFunctionProductColor(data){
    ProductColor.create(data)
  }
  promiseFunctionProductSize(data){
    // console.log('data')
    // console.log(data)
    ProductSize.create(data)
  }

  promiseFunction(data){
    // console.log('data')
    // console.log(data)
    CustomProductLink.create(data)
  }

  async getShops({params,request,response}){
    // return await User.query()
    //                   .where('role', 1)
    //                   .with('shopCategory')
    //                   .fetch()


    let page = request.input('page') ? request.input('page') : 1
    return await User.query()
                      .where('role', 1)
                      .with('shopCategory')
                      .paginate(page, 16)
  }

  async getShopProducts({request,response, params}){
    let page = request.input('page') ? request.input('page') : 1
    let perPage = request.input('perPage') ? request.input('perPage') : 16
    // return await Product.query()
    //                   .where('user_id', params.id)
    //                   .with('productCategory')
    //                   .with('productImages')
    //                   .with('productSizes')
    //                   .with('productSizes.size')
    //                   .with('productColors')
    //                   .with('productColors.color')
    //                   .with('productTags')
    //                   .withCount('totalRating')
    //                   .orderBy('totalRating_count','desc')
    //                   .paginate(page, 16)
    return await Product.query()
                      // .where('user_id', params.id)
                      .where('user_id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                      // .with('productCategory')
                      .with('subcategory.subcategory')
                      .with('productImages')
                      .with('productSizes')
                      .with('productSizes.size')
                      .with('productColors')
                      .with('productColors.color')
                      .with('productTags')
                      .withCount('totalRating')
                      .orderBy('totalRating_count','desc')
                      .paginate(page, perPage)
  }

  async searchShopsByName ({request, response, session}) {
    const search = request.input('search')
    let page = request.input('page') ? request.input('page') : 1

    return await User.query()
                        .where('name', 'LIKE', '%'+search+'%')
                        .where('role', 1)
                        .with('shopCategory')
                        .paginate(page, 16)
  }

  async getShopsByCategoryId ({request, response, session}) {
    const category_id = request.input('category_id')
    let page = request.input('page') ? request.input('page') : 1
    // return category_id
    return await User.query()
                        .where('shop_category_id', category_id)
                        .where('role', 1)
                        .with('shopCategory')
                        .paginate(page, 16)
  }

  async getShopById ({request, response, session, params}) {
    // return await User.query()
    let user = await User.query()
                        // .where('id', params.id)
                        .where('id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                        .where('role', 1)
                        .with('shopCategory')
                        // .with('subcategory.subcategory')
                        .first()
      user.getInfo = {
        email:user.email
      }
      return user

  }

  deleteImageFromFolder({request, response}){
    let image = request.all().image
    // console.log(image)
    let fs = require('fs');
    fs.unlink('public'+image, function (err) {
      if (err) throw err;
      // if no error, file has been deleted successfully
      // console.log(image+' image deleted!');
    });
    return response.status(200).json('image deleted form folder')
  }

  deleteVideoFromFolder({request, response}){
    let video = request.all().video
    // console.log(image)
    let fs = require('fs');
    fs.unlink('public'+video, function (err) {
      if (err) throw err;
      // if no error, file has been deleted successfully
      // console.log(video+' video deleted!');
    });
    return response.status(200).json('video deleted form folder')
  }

  async createBlog ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    const blog = await Blog.create({
      title:data.title,
      feature_image:data.feature_image,
      text:data.text,
      category_id:data.category_id,
      user_id:user.id
    })



    let blog_tags = []
    data.tags.forEach(element => {
      // console.log(element)
      let item = {
        tag: element.tag,
        blog_id: blog.id
      };
      blog_tags.push(this.promiseFunctionBlogTag(item))
    });
    // console.log(blog_tags)
    await Promise.all(blog_tags)

    // create feed
    let feed = await Feed.create({
      type:'blog',
      blog_id:blog.id,
    })

    // update blog feed_id
    let update_pro = await Blog.findOrFail(blog.id)
    update_pro.feed_id = feed.id
    await update_pro.save()

    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenValue.query().where('blog','!=','').first()
      // console.log(token_value.blog)

      // add user token transaction
      const add_token = await TokenTransaction.create({
        action_type:'created',
        token:token_value.blog,
        item_type:'Blog',
        feed_id:feed.id,
        user_id:user.id
      })
      return {blog:blog, token_value:token_value.blog}
    }
    return {blog:blog, token_value:0}
  }

  async updateBlog ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    let blog = await Blog.find(data.id)

    if (blog.user_id!=user.id) {
      return null
    }

    blog.title=data.title
    blog.text=data.text
    blog.category_id=data.category_id
    let image=blog.feature_image
    blog.feature_image=data.feature_image
    await blog.save()

    if (image && image!=data.feature_image) {
      let fs = require('fs');
      fs.unlink('public'+image, function (err) {
        if (err) throw err;
      });

    }

    await BlogTag.query().where('blog_id',data.id).delete()


    let blog_tags = []
    data.tags.forEach(element => {
      // console.log(element)
      let item = {
        tag: element.tag,
        blog_id: blog.id
      };
      blog_tags.push(this.promiseFunctionBlogTag(item))
    });
    // console.log(blog_tags)
    await Promise.all(blog_tags)

    return blog
  }

  async updateVlog ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    let vlog = await Vlog.find(data.id)

    if (vlog.user_id!=user.id) {
      return null
    }

    vlog.title=data.title
    vlog.text=data.text
    vlog.category_id=data.category_id
    let video = vlog.video
    vlog.video = data.video
    await vlog.save()

    // console.log(video)
    // console.log(data.video)
    if (video!=data.video) {
      let fs = require('fs');
      fs.unlink('public'+video, function (err) {
        if (err) throw err;
        // console.log(video+' deleted')
      });

    }

    await VlogTag.query().where('vlog_id',data.id).delete()


    let vlog_tags = []
    data.tags.forEach(element => {
      // console.log(element)
      let item = {
        tag: element.tag,
        vlog_id: vlog.id
      };
      vlog_tags.push(this.promiseFunctionVlogTag(item))
    });
    // console.log(vlog_tags)
    await Promise.all(vlog_tags)

    return vlog
  }

  promiseFunctionBlogTag(data){
    BlogTag.create(data)
  }


  async getUserBlogs({request,response, auth}){

    let user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1
    return await Blog.query()
                      .where('user_id', user.id)
                      .orderBy('id','desc')
                      .with('blogTags')
                      .with('blogCategory')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }
  async getUserStatuses({request,response, auth}){

    let user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1
    return await Status.query()
                      .where('user_id', user.id)
                      .orderBy('id','desc')
                      .with('images')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }

  async getUserBlogsById({request,params,response, auth}){
    let page = request.input('page') ? request.input('page') : 1
    return await Blog.query()
                      // .where('user_id', params.id)
                      .where('user_id', (builder)=>{
                        builder.select('id')
                            .from('users')
                            .where('username',params.username)
                        })
                      .orderBy('id','desc')
                      .with('blogTags')
                      .with('blogCategory')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }
  async getUserStatusesById({request,params,response, auth}){
    let page = request.input('page') ? request.input('page') : 1
    return await Status.query()
                      // .where('user_id', params.id)
                      .where('user_id', (builder)=>{
                        builder.select('id')
                            .from('users')
                            .where('username',params.username)
                        })
                      .orderBy('id','desc')
                      .with('images')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }

  async getBlogById({params, request, auth}){
    return await Blog.query()
                      .where('id', params.id)
                      .with('blogTags')
                      .with('blogCategory')
                      .first()
  }

  async getUserBlog({params, request, auth}){
    // console.log('getUserBlog')
    const user = await auth.getUser()
    const blog = await Blog.query()
                      .where('id', params.id)
                      .where('user_id', user.id)
                      .with('blogTags')
                      .with('blogCategory')
                      .first()
    // console.log(blog.toJSON())
    return blog
  }

  async deleteBlog ({request, response, session, auth}) {
    const blog_id = request.all().id
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    let blog = await Blog.query()
                          .where('id',blog_id)
                          .where('user_id',user.id)
                          .first()
    if (!blog) {
      return null
    }

    if (blog.feature_image) {
      let fs = require('fs');
      fs.unlink('public'+blog.feature_image, function (err) {
        if (err) throw err;
      });
    }

    let delete_item = await blog.delete()

    // deduct token only if user is verified
    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenDeductValue.query().where('blog','!=','').first()
      // deduct user token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'delete',
        token:token_value.blog,
        item_type:"Blog",
        feed_id:null,
        user_id:user.id
      })
      return {delete_item:delete_item,token_value:token_value.blog}
    }
    return {delete_item:delete_item,token_value:0}

    return blog
  }
  async deleteStatus ({request, response, session, auth}) {
    const status_id = request.all().id
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    let status = await Status.query()
                          .where('id',status_id)
                          .where('user_id',user.id)
                          .first()
    if (!status) {
      return null
    }

    // if (status.feature_image) {
    //   let fs = require('fs');
    //   fs.unlink('public'+status.feature_image, function (err) {
    //     if (err) throw err;
    //   });
    // }

    let delete_item = await status.delete()

    // deduct token only if user is verified

    return {delete_item:delete_item,token_value:0}

  }

  // vlog part
  async getUserVlogs({request,response, auth}){
    let user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1
    return await Vlog.query()
                      .where('user_id', user.id)
                      .orderBy('id','desc')
                      .with('vlogTags')
                      .with('vlogCategory')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }

  async getUserVlogsById({request,params,response, auth}){
    let page = request.input('page') ? request.input('page') : 1
    return await Vlog.query()
                      // .where('user_id', params.id)
                      .where('user_id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',params.username)
                          })
                      .orderBy('id','desc')
                      .with('vlogTags')
                      .with('vlogCategory')
                      .withCount('comments')
                      .withCount('like')
                      .paginate(page, 10)
  }

  async getUserVlogById({params,response, auth}){
    const user = await auth.getUser()
    // let vlog = await Vlog.query()
    //                   .where('id', params.id)
    //                   .first()
    return await Vlog.query()
                      .where('id', params.id)
                      .orderBy('id','desc')
                      .with('vlogTags')
                      .with('vlogCategory')
                      .with('comments')
                      .with('comments.user')
                      .withCount('like')
                      .with('userLike', (builder)=>{
                        builder.where('user_id',user.id)
                      })
                      .with('user', (builder)=>{
                        builder.withCount('follower')
                          .withCount('following')
                        builder.with('follower', (builder)=>{
                          builder.where('follower_user_id', user.id)
                            // .where('following_user_id', vlog.user_id)
                            .where('following_user_id',(builder)=>{
                                  builder.select('user_id')
                                        .from('vlogs')
                                        .where('id', params.id)
                                })
                            // .with('followerUser')
                            // .with('followingUser')
                        })
                      })
                      .first()
  }

  async getUserBlogById({params,response, auth}){
    const user = await auth.getUser()

    let blog = await Blog.query()
                      .where('id', params.id)
                      .first()

    return await Blog.query()
                      .where('id', params.id)
                      .orderBy('id','desc')
                      .with('blogTags')
                      .with('blogCategory')
                      .with('comments')
                      .with('comments.user')
                      .withCount('like')
                      .with('userLike', (builder)=>{
                        builder.where('user_id',user.id)
                      })
                      .with('user', (builder)=>{
                        builder.withCount('follower')
                          .withCount('following')
                        builder.with('follower', (builder)=>{
                          builder.where('follower_user_id', user.id )
                            .where('following_user_id', blog.user_id)
                            // .with('followerUser')
                            // .with('followingUser')
                        })
                      })
                      .first()
  }
  async getUserStatusById({params,response, auth}){
    const user = await auth.getUser()

    let status = await Status.query()
                      .where('id', params.id)
                      .first()

    return await Status.query()
                      .where('id', params.id)
                      .orderBy('id','desc')
                      .with('images')
                      .with('comments')
                      .with('comments.user')
                      .withCount('like')
                      .with('userLike', (builder)=>{
                        builder.where('user_id',user.id)
                      })
                      .with('user', (builder)=>{
                        builder.withCount('follower')
                          .withCount('following')
                        builder.with('follower', (builder)=>{
                          builder.where('follower_user_id', user.id )
                            .where('following_user_id', status.user_id)
                            // .with('followerUser')
                            // .with('followingUser')
                        })
                      })
                      .first()
  }




  async createVlog ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    const vlog = await Vlog.create({
      title:data.title,
      video:data.vidoe,
      text:data.text,
      category_id:data.category_id,
      user_id:user.id
    })

    let vlog_tags = []
    data.tags.forEach(element => {
      // console.log(element)
      let item = {
        tag: element.tag,
        vlog_id: vlog.id
      };
      vlog_tags.push(this.promiseFunctionVlogTag(item))
    });
    // console.log(vlog_tags)
    await Promise.all(vlog_tags)

    // create feed
    let feed = await Feed.create({
      type:'vlog',
      vlog_id:vlog.id,
    })

    // update custom product feed_id
    let update_pro = await Vlog.findOrFail(vlog.id)
    update_pro.feed_id = feed.id
    await update_pro.save()

    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenValue.query().where('vlog','!=','').first()
      // console.log(token_value.vlog)

      // add user token transaction
      const add_token = await TokenTransaction.create({
        action_type:'created',
        token:token_value.vlog,
        item_type:'Vlog',
        feed_id:feed.id,
        user_id:user.id
      })
      return {vlog:vlog, token_value:token_value.vlog}
    }
    return {vlog:vlog, token_value:0}
  }

  promiseFunctionVlogTag(data){
    VlogTag.create(data)
  }

  async deleteVlog ({request, response, session, auth}) {
    const vlog_id = request.all().id
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    let vlog = await Vlog.query()
                          .where('id',vlog_id)
                          .where('user_id',user.id)
                          .first()
    if (!vlog) {
      return null
    }

    if (vlog.video) {
      let fs = require('fs');
      fs.unlink('public'+vlog.video, function (err) {
        if (err) throw err;
      });
    }

    let delete_item = await vlog.delete()

    // deduct token only if user is verified
    if (user.verification_status==4) {
      // get token_vlaue
      let token_value = await TokenDeductValue.query().where('vlog','!=','').first()
      // deduct user token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'delete',
        token:token_value.vlog,
        item_type:"Vlog",
        feed_id:null,
        user_id:user.id
      })
      return {delete_item:delete_item,token_value:token_value.vlog}
    }
    return {delete_item:delete_item,token_value:0}

    return vlog
  }

  async getUserVlog({params, request, auth}){
    const user = await auth.getUser()
    return await Vlog.query()
                      .where('id', params.id)
                      .where('user_id', user.id)
                      .with('vlogTags')
                      .with('vlogCategory')
                      .first()
  }

  // feed part
  async getAllFeeds({params, request, auth}){
    const user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1
    return await Feed.query()
                    .with('lookbook')
                    .with('lookbook.user')
                    // .with('lookbook.userDetails')
                    .with('lookbook.comments')
                    .with('lookbook.comments.user')
                    .with('lookbook.linkedProducts')
                    .with('lookbook.linkedProducts.product')
                    .with('lookbook.linkedProducts.product.productImages')

                    .with('collage')
                    .with('collage.user')
                    // .with('collage.userDetails')
                    .with('collage.comments')
                    .with('collage.comments.user')
                    .with('collage.linkedProducts')
                    .with('collage.linkedProducts.product')
                    .with('collage.linkedProducts.product.productImages')

                    .with('blog')
                    .with('blog.user')
                    // .with('blog.userDetails')
                    .with('blog.comments')
                    .with('blog.comments.user')
                    .with('blog.blogTags')
                    .with('blog.blogCategory')

                    .with('vlog')
                    .with('vlog.user')
                    // .with('vlog.userDetails')
                    .with('vlog.comments')
                    .with('vlog.comments.user')
                    .with('vlog.vlogTags')
                    .with('vlog.vlogCategory')

                    .with('status')
                    .with('status.user')
                    // .with('status.userDetails')
                    .with('status.comments')
                    .with('status.comments.user')
                    .with('status.images')

                    .with('userLike', (builder) => {
                      builder.where('user_id',user.id)
                    })
                    .withCount('like')
                    .orderBy('id','desc')
                    // .fetch()
                    .paginate(page, 10)
  }

  async getAllFeedsWithScroll({params, request, auth}){
    const user = await auth.getUser()
    // let page = request.input('page') ? request.input('page') : 1
    return await Feed.query()
                    .where('id','<',params.id)
                    .with('lookbook')
                    .with('lookbook.user')
                    // .with('lookbook.userDetails')
                    .with('lookbook.comments')
                    .with('lookbook.comments.user')
                    .with('lookbook.linkedProducts')
                    .with('lookbook.linkedProducts.product')
                    .with('lookbook.linkedProducts.product.productImages')

                    .with('collage')
                    .with('collage.user')
                    // .with('collage.userDetails')
                    .with('collage.comments')
                    .with('collage.comments.user')
                    .with('collage.linkedProducts')
                    .with('collage.linkedProducts.product')
                    .with('collage.linkedProducts.product.productImages')

                    .with('blog')
                    .with('blog.user')
                    // .with('blog.userDetails')
                    .with('blog.comments')
                    .with('blog.comments.user')
                    .with('blog.blogTags')
                    .with('blog.blogCategory')

                    .with('vlog')
                    .with('vlog.user')
                    // .with('vlog.userDetails')
                    .with('vlog.comments')
                    .with('vlog.comments.user')
                    .with('vlog.vlogTags')
                    .with('vlog.vlogCategory')

                    .with('status')
                    .with('status.user')
                    // .with('status.userDetails')
                    .with('status.comments')
                    .with('status.comments.user')
                    .with('status.images')

                    .with('userLike', (builder) => {
                      builder.where('user_id',user.id)
                    })
                    .withCount('like')
                    .orderBy('id','desc')
                    .limit(10)
                    .fetch()
                    // .paginate(page, 10)
  }

  async postComment ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)

    let user = await auth.getUser()
    const comment = await Comment.create({
      text:data.text,
      feed_id:data.feed_id,
      user_id:user.id
    })

    return comment
  }


  async getPopularProducts({ params, request, response, view, auth }) {
    const product = await Product.query()
                        // .where('category_id', product.category_id)
                        // .with('productCategory')
                        .with('subcategory.subcategory')
                        .with('productImages')
                        .with('productSizes')
                        .with('productSizes.size')
                        .with('productColors')
                        .with('productColors.color')
                        .with('productTags')
                        .withCount('totalRating')
                        .orderBy('totalRating_count','desc')
                        .limit(5)
                        .fetch()
    return product
  }
  async getPopularStores({ params, request, response, view, auth }) {
    return await User.query()
                      .where('role', 1)
                      .with('shopCategory')
                      .limit(5)
                      .fetch()
  }

  async deleteFeedLike ({request, response, session, auth}) {
    // const data = request.all()
    // let user = await auth.getUser()
    // const remove_like = await Like.query()
    //           .where('feed_id',data.feed_id)
    //           .where('user_id',user.id)
    //           .delete()
    // return remove_like



    const data = request.all()
    let user = await auth.getUser()
    let feed_owner_id
    let feed

    const remove_like = await Like.query()
              .where('feed_id',data.feed_id)
              .where('user_id',user.id)
              .delete()
    if (!remove_like) {
      return response.status(401).json(
        {
          'message': 'Invalid data'
        }
      )
    }

    let feed_data = await Feed.query()
      // .where('id',100)
      .where('id',data.feed_id)
      .with('lookbook')
      .with('collage')
      .with('blog')
      .with('vlog')
      .first()
    if (feed_data) {

      // console.log(feed_data.id)
      // console.log(feed_data.toJSON())
      feed = feed_data.toJSON()
      if (feed.type=='lookbook') {
        feed_owner_id = feed.lookbook.user_id
        // console.log(feed.lookbook)
      }
      else if (feed.type=='collage') {
        feed_owner_id = feed.collage.user_id
        // console.log(feed.collage)
      }
      else if (feed.type=='blog') {
        feed_owner_id = feed.blog.user_id
        // console.log(feed.blog)
      }
      else if (feed.type=='vlog') {
        feed_owner_id = feed.vlog.user_id
        // console.log(feed.vlog)
      }
    }else{
      return response.status(401).json(
        {
          'message': 'Invalid data'
        }
      )
    }


    let feed_owner = await User.findOrFail(feed_owner_id)
    if (feed_owner && feed_owner.verification_status==4) {
      let token_value = await TokenDeductValue.query().where('owner_like_removed_value','!=','').first()
      // 2 token is removed from feed owner in token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'like_removed',
        token:token_value.owner_like_removed_value,
        item_type:'Like',
        feed_id:data.feed_id,
        user_id:feed_owner_id
      })
    }
    if (user.verification_status==4) {
      let token_value = await TokenValue.query().where('user_like_got_back_value','!=','').first()
      // 3 token is added back to current user in token transaction
      const add_token = await TokenTransaction.create({
        action_type:'got_back',
        token:token_value.user_like_got_back_value,
        item_type:'Like',
        feed_id:data.feed_id,
        user_id:user.id
      })
      return {like:'Like removed', token_value:token_value.user_like_got_back_value}
    }

    return {like:'Like removed', token_value:0}
  }

  async deleteFeedStatusLike ({request, response, session, auth}) {

    const data = request.all()
    let user = await auth.getUser()

    const remove_like = await Like.query()
              .where('feed_id',data.feed_id)
              .where('user_id',user.id)
              .delete()
    if (!remove_like) {
      return response.status(401).json(
        {
          'message': 'Invalid data'
        }
      )
    }


    return {like:'Like removed', token_value:0}
  }











  async postFeedLike ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()
    let feed_owner_id
    let feed

    let feed_data = await Feed.query()
      // .where('id',100)
      .where('id',data.feed_id)
      .with('lookbook')
      .with('collage')
      .with('blog')
      .with('vlog')
      .first()
    if (feed_data) {
      // console.log(feed_data.id)
      // console.log(feed_data.toJSON())
      feed = feed_data.toJSON()
      if (feed.type=='lookbook') {
        feed_owner_id = feed.lookbook.user_id
        // console.log(feed.lookbook)
      }
      else if (feed.type=='collage') {
        feed_owner_id = feed.collage.user_id
        // console.log(feed.collage)
      }
      else if (feed.type=='blog') {
        feed_owner_id = feed.blog.user_id
        // console.log(feed.blog)
      }
      else if (feed.type=='vlog') {
        feed_owner_id = feed.vlog.user_id
        // console.log(feed.vlog)
      }
    }else{
      return response.status(401).json(
        {
          'message': 'Invalid data'
        }
      )
    }

    const like = await Like.create({
      feed_id:data.feed_id,
      user_id:user.id
    })


    let feed_owner = await User.findOrFail(feed_owner_id)
    if (feed_owner && feed_owner.verification_status==4) {
      let token_value = await TokenValue.query().where('owner_like_added_value','!=','').first()
      // feed owner receive 2 token in token transaction
      const add_token = await TokenTransaction.create({
        action_type:'received',
        token:token_value.owner_like_added_value,
        item_type:'Like',
        feed_id:data.feed_id,
        user_id:feed_owner_id
      })
    }

    if (user.verification_status==4) {
      let token_value = await TokenDeductValue.query().where('user_like_deducted_value','!=','').first()
      // 3 token is deducted from current user in token transaction
      const deduct_token = await TokenTransaction.create({
        action_type:'deducted',
        token:token_value.user_like_deducted_value,
        item_type:'Like',
        feed_id:data.feed_id,
        user_id:user.id
      })
      return {like:like, token_value:token_value.user_like_deducted_value}
    }

    return {like:like, token_value:0}
  }

  async postFeedStatusLike ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()

    const like = await Like.create({
      feed_id:data.feed_id,
      user_id:user.id
    })

    return {like:like, token_value:0}
  }

  async postUserProductReview ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()
    const productReview = await ProductReview.create({
      product_id:data.product_id,
      rating:data.rating,
      comment:data.comment,
      user_id:user.id
    })
    return productReview
  }

  async updateUserProductReview ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()
    // const productReview = await ProductReview.create({
    //   product_id:data.product_id,
    //   rating:data.rating,
    //   comment:data.comment,
    //   user_id:user.id
    // })
    // return productReview

    return await ProductReview.query()
                                .where('id',data.id)
                                .where('user_id',user.id)
                                .update({
                                  rating:data.rating,
                                  comment:data.comment,
                                })
  }

  async getShopProductsBySorting ({request, response, session, auth}) {
    const data = request.all()
    // console.log(data)
    let user = await auth.getUser()
    let page = request.input('page') ? request.input('page') : 1
    let perPage = request.input('perPage') ? request.input('perPage') : 16
    let query= Product.query()
                          //  .where('user_id', data.id)
                          .where('user_id', (builder)=>{
                            builder.select('id')
                              .from('users')
                              .where('username',data.username)
                          })
                          // .with('productCategory')
                          .with('subcategory.subcategory')
                          .with('productImages')
                          .with('productSizes')
                          .with('productSizes.size')
                          .with('productColors')
                          .with('productColors.color')
                          .with('productTags')
                          // .withCount('totalRating')
                          // .orderBy('totalRating_count','desc')
                          // .orderBy('price','desc')
        if(data.type==1){
          query.withCount('totalRating')
          .orderBy('totalRating_count','desc')
        }else if(data.type==2){
          query.orderBy('price','asc')
        }else if(data.type==3)(
          query.orderBy('price','desc')
        )
        // return query.fetch()
        return query.paginate(page, perPage)
        // .paginate(page, 16)


  }

  async getUserDetails ({request, response, session, auth}) {
    // console.log(auth)
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }
    // console.log(user)
    let user_id = user.id
    // let user_id = 3
    return await User.query()
                      .where('id', user_id)
                      .with('receivedTokens', (builder)=> {
                        builder.where('user_id',user_id)
                          .where((builder) => {
                            builder.where('action_type','created')
                            .orWhere('action_type','got_back')
                            .orWhere('action_type','received')
                          })
                      })
                      .with('deductedTokens', (builder)=> {
                        builder.where('user_id',user_id)
                          .where((builder)=> {
                            builder.where('action_type','deducted')
                            .orWhere('action_type','like_removed')
                            .orWhere('action_type','delete')
                          })
                      })
                      // .with('receivedTokens.user')
                      // .with('receivedTokens.feedItem.lookbook')
                      // .with('receivedTokens.feedItem.collage')
                      // .with('receivedTokens.feedItem.blog')
                      // .with('receivedTokens.feedItem.vlog')
                      .withCount('follower')
                      .withCount('following')
                      .first()
  }

  async getLikeTokenValue ({request, response, session, auth}) {
    return await TokenDeductValue.query()
                      .where('user_like_deducted_value', '!=',  '')
                      .first()
  }

  async getUserAllTransactions ({request, response, session, auth}) {
    // console.log(auth)
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }
    // console.log(user)
    let user_id = user.id
    // let user_id = 3
    let page = request.input('page') ? request.input('page') : 1
    return await TokenTransaction.query()
                      .where('user_id', user_id)
                      .with('feedItem')
                      .orderBy('id','desc')
                      .paginate(page, 10)
  }
  async getTokenDollarValue ({request, response, session, auth}) {
    // console.log(auth)
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }
    // console.log(user)
    return await TokenDollarValue.first()
  }





  async followUser ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()
    return await Follow.create({
      following_user_id: data.following_user_id,
      follower_user_id: user.id,
    })
  }
  async unfollowUser ({request, response, session, auth}) {
    const data = request.all()
    let user = await auth.getUser()
    let item = await Follow.query()
                        .where('id', data.id)
                        .where('following_user_id', data.following_user_id)
                        .where('follower_user_id', user.id)
                        .delete()
        if (!item) {
          return response.status(500).json({
            msg: 'Invalid data'
          })
        }
        return item
  }

  async getCategoryById({params, request, response, auth }) {
    return await ProductCategory.query()
                          .where('id', params.id)
                          .first()
  }

  async updateUserInfo({ request, response, session, auth }) {
    let user
    try {
      user = await auth.getUser()
      // user = null
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    let data = request.all()

    let rules = {
        name: 'required|string'
    }
    let messages = {
        'name.required': 'Name is required',
    }
    let validation = await validateAll(data, rules, messages)
    if (validation.fails()) {
        return response.status(400).json(validation.messages())
    }

    // user.name = data.name
    // await user.save()

    if (user.username!=data.username) {
        let rules = {
            username: 'required|string|unique:users,username',
        }
        let messages = {
            'username.required': 'Username is required',
            'username.unique': 'Username is already in use',
        }
        let validation = await validateAll(data, rules, messages)
        if (validation.fails()) {
            return response.status(400).json(validation.messages())
        }

        let user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  name:data.name,
                                  username:data.username
                                })
        if (user_data) {
          let new_data = await User.query()
                        .where('id',user.id)
                        .first()
                        return new_data
        }else{
          return response.status(401).json(
            {
              'message': 'something wrong happend!.'
            }
          )
        }
    }

    let user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  name:data.name
                                })
    if (user_data) {
      let new_data = await User.query()
                    .where('id',user.id)
                    .first()
                    return new_data
    }else{
      return response.status(401).json(
        {
          'message': 'something wrong happend!.'
        }
      )
    }

    // return user_data;
  }

  async updateShopInfo({ request, response, session, auth }) {
    let user
    try {
      user = await auth.getUser()
      // user = null
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    let data = request.all()
    let rules = {
        name: 'required|string',
        shop_category_id: 'required|number',
        shop_description: 'required|string',
        address: 'string',
        phone: 'string',
    }
    let messages = {
        'name.required': 'Shop Name is required',
        'shop_category_id.required': 'Shop Category is required',
        'shop_category_id.numeric': 'Shop Category must be a number',
        'shop_description.required': 'Shop Description is required',
    }
    let validation = await validateAll(data, rules, messages)
    if (validation.fails()) {
        return response.status(400).json(validation.messages())
    }

    if (user.username!=data.username) {
        let rules = {
            username: 'required|string|unique:users,username',
        }
        let messages = {
            'username.required': 'Username is required',
            'username.unique': 'Username is already in use',
        }
        let validation = await validateAll(data, rules, messages)
        if (validation.fails()) {
            return response.status(400).json(validation.messages())
        }



        let user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  name:data.name,
                                  username:data.username,
                                  shop_category_id:data.shop_category_id,
                                  shop_description:data.shop_description,
                                  address:data.address,
                                  phone:data.phone,
                                })

        // await StoreSubcategory.query()
        //                       .where('store_id', user.id)
        //                       .delete()

        // let sub_categories = []
        // data.selected_subcategory.forEach(element => {
        //   // console.log(element)
        //   let item = {
        //     store_id:null,
        //     subcategory_id:null,
        //   }
        //   item.store_id= user.id
        //   item.subcategory_id= element
        //   sub_categories.push(this.promiseFunctionCreateStoreSubcategories(item))
        // });

        if (user_data) {
          let new_data = await User.query()
                        .where('id',user.id)
                        .first()
                        return new_data
        }else{
          return response.status(401).json(
            {
              'message': 'something wrong happend!.'
            }
          )
        }
    }

    // user.name = data.name
    // user.shop_category_id = data.shop_category_id
    // user.shop_description = data.shop_description
    // await user.save()
    // return user;

    const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  name:data.name,
                                  shop_category_id:data.shop_category_id,
                                  shop_description:data.shop_description,
                                  address:data.address,
                                  phone:data.phone,
                                })

    // await StoreSubcategory.query()
    //                           .where('store_id', user.id)
    //                           .delete()

    //   let sub_categories = []
    //   data.selected_subcategory.forEach(element => {
    //     // console.log(element)
    //     let item = {
    //       store_id:null,
    //       subcategory_id:null,
    //     }
    //     item.store_id= user.id
    //     item.subcategory_id= element
    //     sub_categories.push(this.promiseFunctionCreateStoreSubcategories(item))
    //   });

    if (user_data) {
      const new_data = await User.query()
                    .where('id',user.id)
                    .first()
                    return new_data
    }else{
      return response.status(401).json(
        {
          'message': 'something wrong happend!.'
        }
      )
    }
  }
  promiseFunctionCreateStoreSubcategories(data){
    StoreSubcategory.create(data)
  }

  async updateEmail({ request, response, session, auth }) {
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    let data = request.all()
    const rules = {
        email: 'required|email|unique:users,email',
    }
    const messages = {
        'email.required': 'Email is required',
        'email.email': 'Invalid Email',
        'email.unique': 'Email is already in use',
    }
    const validation = await validateAll(data, rules, messages)
    if (validation.fails()) {
        return response.status(400).json(validation.messages())
    }

    // user.email = data.email
    // await user.save()
    // return user;
    const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  email:data.email
                                })
    if (user_data) {
      // const new_data = await User.query()
      //               .where('id',user.id)
      //               .first()
      //               // return new_data
      //               return {
      //                 email:new_data.email,
      //                 ethereum_address:new_data.ethereum_address
      //               }
      return await this.getUserHiddenInfo(auth,{email:data.email})
    }else{
      return response.status(401).json(
        {
          'message': 'something wrong happend!.'
        }
      )
    }
  }

  async updatePassword({ request, response, session, auth }) {
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    let data = request.all()

    const issame = await Hash.verify(data.current_password, user.password)
    if (!issame) {
      // console.log('not same')
      return response.status(401).json({
        'message' :"Current Password does not match!"
      })
    }

    const rules = {
        password: 'required|min:6|confirmed',
    }
    const messages = {
        'password.required': 'New Password is required',
        'password.min': 'New Password must be atlest 6 character long',
        'password.confirmed': 'Confirm Password does not match!',
    }
    const validation = await validateAll(data, rules, messages)
    if (validation.fails()) {
        return response.status(400).json(validation.messages())
    }

    // user.password = data.password
    // await user.save()
    // return user;
    data.password = await Hash.make(data.password)
    const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  password:data.password
                                })
    if (user_data) {
      const new_data = await User.query()
                    .where('id',user.id)
                    .first()
                    return new_data
    }else{
      return response.status(401).json(
        {
          'message': 'something wrong happend!.'
        }
      )
    }
  }

  async updateEthereumAddress({ request, response, session, auth }) {
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }

    let data = request.all()
    const rules = {
        ethereum_address: 'required',
    }
    const messages = {
        'ethereum_address.required': 'Address is required',
    }
    const validation = await validateAll(data, rules, messages)
    if (validation.fails()) {
        return response.status(400).json(validation.messages())
    }

    // user.ethereum_address = data.ethereum_address
    // await user.save()
    // return user;
    const user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  ethereum_address:data.ethereum_address
                                })
    if (user_data) {
      // const new_data = await User.query()
      //               .where('id',user.id)
      //               .first()
      //               // return new_data
      //               return {
      //                 email:new_data.email,
      //                 ethereum_address:new_data.ethereum_address
      //               }
      return await this.getUserHiddenInfo(auth,{ethereum_address:data.ethereum_address})
    }else{
      return response.status(401).json(
        {
          'message': 'something wrong happend!.'
        }
      )
    }
  }

  async getCountries ({request, response, session, auth}) {

    return await Country.all()

  }

  async createUserVerificationForm ({request, response, session, auth}) {
    let user
    try {
      user = await auth.getUser()
    } catch (error) {
      return response.status(401).json(
        {
          'message': 'Please login!.'
        }
      )
    }
    if (user.verification_status==1 || user.verification_status==4) {
      return response.status(401).json(
        {
          'message': 'Not allowed!.'
        }
      )
    }

    await VerificationForm.query()
                          .where('user_id',user.id)
                          .delete()

    const data = request.all()
    // console.log(data.custom_product)
    // console.log(data.custom_product_links)


    const v_form = await VerificationForm.create({
      first_name: data.first_name,
      last_name: data.last_name,
      email: data.email,
      phone: data.phone,
      birth_date: data.birth_date,
      telegram_username: data.telegram_username,
      address_line_1: data.address_line_1,
      address_line_2: data.address_line_2,
      city: data.city,
      state: data.state,
      country_id: data.country_id,
      zip_code: data.zip_code,
      document_type: data.document_type,
      wallet_id: data.wallet_id,
      address_for_tokens: data.address_for_tokens,
      img_passport: data.img_passport,
      img_national_id_front_side: data.img_national_id_front_side,
      img_national_id_back_side: data.img_national_id_back_side,
      img_driving_licence: data.img_driving_licence,
      user_id:user.id
    })

    // user.verification_status = 1
    // user.message = ''
    // await user.save()

    let user_data = await User.query()
                                .where('id',user.id)
                                .update({
                                  verification_status:1,
                                  message:'',
                                })


    return v_form

  }






  async initdata ({request, response, auth}) {
    // console.log('initdata')
    try {
      const user = await auth.getUser()
      return {
        user: user,
        // hidden_info:hidden_info
        hidden_info: await this.getUserHiddenInfo(auth,{})
      }
    } catch (error) {
      // console.log(error.message)
      return false
    }
  }
  async getUserHiddenInfo (auth,data) {
    // console.log('initdata')
    try {
      const user = await auth.getUser()
      let res = {
        email:user.email,
        ethereum_address:user.ethereum_address
      }
      if (data.email) {
        res.email = data.email
      }else if(data.ethereum_address){
        res.ethereum_address = data.ethereum_address
      }
      return res
    } catch (error) {
      // console.log(error.message)
      return false
    }
  }

  // async userRegister({ request, response, session, auth }) {

  //     const rules = {
  //         email: 'required|email|unique:users,email',
  //         password: 'required'
  //     }
  //     const messages = {
  //         'email.required': 'Email is required',
  //         'email.unique': 'Email is already in use',
  //     }

  //     let data = request.all()
  //     delete data.password_confirmation
  //     // console.log('register')
  //     // console.log(data)

  //     const validation = await validateAll(data, rules, messages)
  //     if (validation.fails()) {
  //         return response.status(401).json(validation.messages())
  //     }

  //     let user = await User.create(data)

  //     return user;
  //     // return data;


  //     // const formInfo = request.all()
  //     // delete formInfo.password_confirmation
  //     // const data = await User.create(formInfo)
  //     // // eslint-disable-next-line eqeqeq
  //     // if (data.packType == 1) { return data } else {
  //     //   const ledata = {
  //     //     user_id: data.id,
  //     //     name: data.firstName
  //     //   }
  //     //   await Legend.create(ledata)
  //     //   return data
  //     // }
  // }
  async userRegister({ request, response, session, auth }) {

      const rules = {
          name: 'required|string',
          username: 'required|string|unique:users,username',
          email: 'required|email|unique:users,email',
          password: 'required'
      }
      const messages = {
          'name.required': 'Name is required',
          'username.required': 'Username is required',
          'username.unique': 'Username is already in use',
          'email.required': 'Email is required',
          'email.unique': 'Email is already in use',
          'password.required': 'Password is required',
      }

      let data = request.all()
      delete data.password_confirmation
      if (data.role==2 && data.image) {
        let fs = require('fs');
        fs.unlink('public'+data.image, function (err) {
          if (err) throw err;
          // if no error, file has been deleted successfully
          // console.log(data.image+' image deleted!');
        });
        data.image = null
      }
      // console.log('register')
      // console.log(data)

      const validation = await validateAll(data, rules, messages)
      if (validation.fails()) {
          return response.status(401).json(validation.messages())
      }

      let user = await User.create(data)
      return user;
      // return data;
  }

  async userLogin({ request, response, auth, session }) {

      const data = request.all()

      // let user
      // console.log('uuid')
      // console.log('uuid',uuid)
      // return uuid
      // console.log('login')
      // return data
      try {
          let user = await auth.query().remember(data.rememberMe).attempt(data.email, data.password)
          // if(user && (user.role!=1 || user.role!=2)){
          //   session.clear()
          //   await auth.logout()
          //   return response.status(401).json(
          //       {
          //           'message': 'Invalid email or password. Please try again.'
          //       }
          //   )
          // }
          if (user) {
            // console.log(user)
            let user_data = user.toJSON()
            let uuid = uniqid();
            // console.log(user_data)
            let update_data = await User.query().where('id',user_data.id).update({
              apiToken : uuid
            })
            if (update_data) {
              user_data.apiToken = uuid
            }else{
              session.clear()
              await auth.logout()
              return response.status(401).json(
                  {
                      'message': 'Something went wrong! Please try again.'
                  }
              )
            }
            // console.log(user_data)
            return user_data
          }
          return user

      } catch (e) {
          // console.log(e.message)
          return response.status(401).json(
              {
                  'message': 'Invalid email or password. Please try again.'
              }
          )
      }



  }

  async searchByKey({request}){
    let sCategory = request.input('sCategory') ? request.input('sCategory') : ''

    let rawData = Product.query().with('productCategory')
    if(sCategory){
      //sCategory = JSON.parse(sCategory)
      // console.log(sCategory)
        rawData.whereHas('productCategory', (builder) => {
          builder.whereIn('name',sCategory)
        })
    }
    return await rawData.fetch()

  }

  async logout ({auth, session}) {
    // console.log('logout')
    try {
      session.clear()
      await auth.logout()
      return
    } catch (e) {
      return false
    }
  }





}

module.exports = HomeController
