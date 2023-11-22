import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Screens/product/widget/bottom_cart_view.dart';
import 'package:sas_ecommerce/Screens/product/widget/product_specification_view.dart';
import 'package:sas_ecommerce/Screens/product/widget/product_title_view.dart';
import 'package:sas_ecommerce/Screens/product/widget/promise_screen.dart';
import 'package:sas_ecommerce/Screens/product/widget/seller_view.dart';
import 'package:sas_ecommerce/Screens/product/widget/shop_product_view.dart';

import '../../helper/custom_app_bar.dart';
import '../../helper/rating_bar.dart';
import '../../helper/title_row.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class ProductDetails extends StatefulWidget {

  const ProductDetails({Key? key,}) : super(key: key);



  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  _loadData( BuildContext context) async{}
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
     backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
           Stack(children: [
             Image.asset(Images.cat_men,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/2,fit: BoxFit.cover,),
             Positioned(
               top: 30, // Adjust the top position as needed
               left: 10, // Adjust the left position as needed
               child: IconButton(
                 icon: Icon(Icons.arrow_back_ios),
                 color: Colors.white, // Adjust the color as needed
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
               ),
             ),
             Positioned(
               bottom: 30, // Adjust the top position as needed
               right: 10, // Adjust the left position as needed
               child: Card(
                 elevation: 2,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: InkWell(
                     onTap: (){
                       setState(() {
                         isFavourite = !isFavourite;
                       });
                     },
                       child: isFavourite?Icon(Icons.favorite, color: Colors.redAccent,):Icon(Icons.favorite_border, color: Colors.redAccent,),
               ),
                 ),
             ),
             )
           ],),
            Container(
              transform: Matrix4.translationValues(0.0, -25.0, 0.0),
              padding: const EdgeInsets.only(top: Dimensions.fontSizeDefault),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(Dimensions.paddingSizeExtraLarge),
                    topRight:Radius.circular(Dimensions.paddingSizeExtraLarge) ),
              ),
              child: Column(
                children: [
                  ProductTitleView(),
                  Divider(),
                  Container(height: 150,
                    margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: ProductSpecification(),),
                  Divider(),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,
                      horizontal: Dimensions.fontSizeDefault),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor
                      ),
                      child: const PromiseScreen()),
                  SellerView(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    color: Theme.of(context).cardColor,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Text('Customer Reviews',
                        style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w600),),
                      const SizedBox(height: Dimensions.paddingSizeDefault,),
                      Container(width: 230,height: 30,
                        decoration: BoxDecoration(color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraLarge),),


                        child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingBar(rating: double.parse('0'), size: 18,),
                            const SizedBox(width: Dimensions.paddingSizeDefault),
                            Text('0.0 out of 5'),
                          ],
                        ),
                      ),

                      const SizedBox(height: Dimensions.paddingSizeDefault),
                      Text('Total 0 Reviews'),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                    ]),
                  ),
                ],
              ),
            ),
            /// More Products

            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: TitleRow(title: 'More From the Shop', isDetailsPage: true)),


            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: MoreProductView(),),


            // TitleRow(title: 'More From this shop',
            //     onTap: () {
            //       ///view All product
            //     }
            // ),
            // const SizedBox(height: Dimensions.paddingSizeSmall),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
            //   child: MoreProductView(),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomCartView(),
    );
  }
}

