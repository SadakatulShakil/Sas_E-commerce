import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/rating_bar.dart';
class RecommendedProductView extends StatelessWidget {
  const RecommendedProductView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(context, PageRouteBuilder(
            //   transitionDuration: const Duration(milliseconds: 1000),
            //   pageBuilder: (context, anim1, anim2) => ProductDetails(productId: recommended.recommendedProduct!.id, slug: recommended.recommendedProduct!.slug,),
            // ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text('Recommended Product',
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.w600),),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 260,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width-35,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(Dimensions.paddingSizeExtraSmall),
                                  bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall)),
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ),

                      Positioned(
                        left: 15,
                        top: 15,
                        child: Column(
                          children: [Container(width: MediaQuery.of(context).size.width/2.5,
                            height: MediaQuery.of(context).size.width/2.5,
                            decoration: BoxDecoration(
                                color: Theme.of(context).highlightColor,
                                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.20),width: .5),
                                borderRadius: const BorderRadius.all(Radius.circular(5))),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.cat_women, fit: BoxFit.cover,
                                image: Images.cat_women,
                                imageErrorBuilder: (c, o, s) => Image.asset(Images.cat_women, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                            Container(width: MediaQuery.of(context).size.width/2.5,
                                padding: const EdgeInsets.only(left: 2,top: 10),
                                child: Center(
                                  child: Text('Ladies Item',maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Theme.of(context).cardColor,
                                          fontSize: Dimensions.fontSizeDefault)),
                                )),
                          ],
                        ),
                      ),

                      Positioned(right: 0,top: 0,
                        child: SizedBox(width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.width/2.5,
                          child:
                          Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('1 out of 5',
                                    style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                                Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBar(rating: 0, size: 18,),
                                    Text('0')
                                  ],
                                ),

                                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                                Text('৳ '+'654',
                                  style: TextStyle(color: Colors.green),
                                ),

                              ],),
                          ),),
                      ),


                      Positioned(
                        right: 25,bottom: 70,
                        child: Container(width: 110,height: 35,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
                            color: Theme.of(context).cardColor.withOpacity(.25),
                          ),
                          child: Center(child: Text('Buy Now',
                            style: TextStyle(color: Theme.of(context).cardColor),)),),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


}

