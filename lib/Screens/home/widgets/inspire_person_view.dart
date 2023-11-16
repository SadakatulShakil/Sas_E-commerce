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
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text('-Our Inspiration',
                    style: TextStyle(fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.w600, color: primarygreen),),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor
                        ),
                      ),

                      Positioned(
                        left: 15,
                        top: -10,
                        child: Column(
                          children: [Container(width: MediaQuery.of(context).size.width/2.7,
                            height: MediaQuery.of(context).size.width/2.5,
                            decoration: BoxDecoration(
                                color: Theme.of(context).highlightColor,
                                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.20),width: .5),
                                borderRadius: const BorderRadius.all(Radius.circular(5))),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.inspireImage, fit: BoxFit.cover,
                                image: Images.inspireImage,
                                imageErrorBuilder: (c, o, s) => Image.asset(Images.inspireImage, fit: BoxFit.cover),
                              ),
                            ),
                          ),

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
                                Text('ফাতেমা মজুমদার',
                                    style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                                Text('অনার অফ তৃপ্তি বাহার',
                                  style: TextStyle(color: primarygreen),
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

