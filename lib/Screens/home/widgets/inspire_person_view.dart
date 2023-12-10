import 'package:flutter/material.dart';

import '../../../helper/constant.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/rating_bar.dart';
class InspirePersonView extends StatelessWidget {
  const InspirePersonView({Key? key}) : super(key: key);


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
                color: primaryBackground,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text('-Our Inspiration',
                    style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge,
                        fontWeight: FontWeight.w600, color: primaryColor),),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                      ),

                      Positioned(
                        left: 15,
                        top: 10,
                        child:  CircleAvatar(
                          radius: 70, // Adjusted the radius to match the outer CircleAvatar
                          backgroundColor: Colors.deepPurple,
                          backgroundImage: AssetImage(Images.inspireImage),
                        ),
                      ),

                      Positioned(right: 10,top: 0,
                        child: SizedBox(width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.width/2.5,
                          child:
                          Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('ফাতেমা মজুমদার',
                                    style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                                Text('অনার অফ তৃপ্তি বাহার',
                                  style: TextStyle(color: primaryColor),
                                ),

                              ],),
                          ),),
                      ),
                      Positioned(
                        right: 25,bottom: 20,
                        child: Container(width: 110,height: 35,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
                            color: Theme.of(context).cardColor.withOpacity(.25),
                          ),
                          child: Center(child: Text('Explore now>>',
                            style: TextStyle(color: Theme.of(context).primaryColor),)),),
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

