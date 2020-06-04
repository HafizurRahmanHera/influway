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
const Hash = use('Hash')

const { validateAll } = use('Validator')

class AdminController {
  // async getUsersAllVerificationForms ({request, response, session, auth}) {
  //   // console.log(auth)
  //   let user
  //   try {
  //     user = await auth.getUser()
  //   } catch (error) {
  //     return response.status(401).json(
  //       {
  //         'message': 'Please login!.'
  //       }
  //     )
  //   }
  //   // console.log(user)
  //   let user_id = user.id
  //   // let user_id = 3
  //   return await User.query()
  //                     .where('role', 2)
  //                     .with('verificationForm')
  //                     .orderBy('id','desc')
  //                     .fetch()
  // }

  async getUsersAllVerificationForms ({request, response, session, auth}) {
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
    return await VerificationForm.query()
                      .with('user')
                      .orderBy('id','desc')
                      .fetch()
  }

  async getVerificationFormsDetailsById ({request, response, session, auth, params}) {

    return await VerificationForm.query()
                      .where('id',params.id)
                      .with('user')
                      .with('country')
                      .first()
  }

  async approveUserVerificationForm({ request, response, session, auth }) {
    let data = request.all()
    let user = await User.findOrFail(data.user_id)
    user.verification_status = 4
    await user.save()

    let today = new Date();
    let date = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let date_time = date + " " + time
    // console.log(date_time)

    let form = await VerificationForm.query()
                          .where('user_id',data.user_id)
                          .update({
                            checked_on_date:date_time
                          })

    return user
  }

  async missingUserVerificationForm({ request, response, session, auth }) {
    let data = request.all()
    let user = await User.findOrFail(data.user_id)
    user.verification_status = 2
    await user.save()

    let today = new Date();
    let date = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let date_time = date + " " + time
    // console.log(date_time)

    let form = await VerificationForm.query()
                          .where('user_id',data.user_id)
                          .update({
                            checked_on_date:date_time
                          })
    return user
  }

  async cancelUserVerificationForm({ request, response, session, auth }) {
    let data = request.all()
    let user = await User.findOrFail(data.user_id)
    user.verification_status = 3
    await user.save()
    let today = new Date();
    let date = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
    let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    let date_time = date + " " + time
    // console.log(date_time)

    let form = await VerificationForm.query()
                          .where('user_id',data.user_id)
                          .update({
                            checked_on_date:date_time
                          })

    return user
  }

  async deleteUserVerificationForm({ request, response, session, auth }) {
    let data = request.all()

    let delete_form = await VerificationForm.findOrFail(data.id)

    if (delete_form && delete_form.img_passport) {
      let fs = require('fs');
      fs.unlink('public'+delete_form.img_passport, function (err) {
        if (err) throw err;
        // if no error, file has been deleted successfully
        // console.log(data.image+' image deleted!');
      });
    }
    if (delete_form && delete_form.img_national_id_front_side) {
      let fs = require('fs');
      fs.unlink('public'+delete_form.img_national_id_front_side, function (err) {
        if (err) throw err;
        // if no error, file has been deleted successfully
        // console.log(data.image+' image deleted!');
      });
    }
    if (delete_form && delete_form.img_national_id_back_side) {
      let fs = require('fs');
      fs.unlink('public'+delete_form.img_national_id_back_side, function (err) {
        if (err) throw err;
        // if no error, file has been deleted successfully
        // console.log(data.image+' image deleted!');
      });
    }
    if (delete_form && delete_form.img_driving_licence) {
      let fs = require('fs');
      fs.unlink('public'+delete_form.img_driving_licence, function (err) {
        if (err) throw err;
        // if no error, file has been deleted successfully
        // console.log(data.image+' image deleted!');
      });
    }

    await delete_form.delete()


    let user = await User.findOrFail(data.user_id)
    user.verification_status = 0
    await user.save()
    return user
  }


}

module.exports = AdminController
