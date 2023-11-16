import 'package:flutter/material.dart';
import '../../../Models/category_model.dart';
import '../../../helper/constant.dart';
import '../../../helper/review_product_widget.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/rating_bar.dart';

class RecommendedProductView extends StatefulWidget {
  final ScrollController scrollController;
  final bool isHome;

  const RecommendedProductView({Key? key,  required this.scrollController, required this.isHome}) : super(key: key);

  @override
  _RecommendedProductViewState createState() => _RecommendedProductViewState();
}

class _RecommendedProductViewState extends State<RecommendedProductView> {
  final List<Category> productList = [
    Category(id: 100, name: 'Mens', imageAsset: Images.cat_men),
    Category(id: 200, name: 'Womens', imageAsset: Images.cat_women),
    Category(id: 103, name: 'Kids', imageAsset: Images.cat_kid),
    Category(id: 204, name: 'Home decor', imageAsset: Images.cat_home),
    Category(id: 500, name: 'Electronics', imageAsset: Images.cat_electronics),
    Category(id: 603, name: 'Interior', imageAsset: Images.cat_interior),
    Category(id: 507, name: 'Sports', imageAsset: Images.cat_sports),
    Category(id: 618, name: 'Others', imageAsset: Images.cat_others),
    // Add more categories as needed
  ];

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
                color: lightgreenshede,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text(
                    '-Best Review',
                    style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w600, color: primarygreen),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 260,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 35,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(Dimensions.paddingSizeExtraSmall),
                                  bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: Dimensions.homePagePadding),
                            child: Container(
                              height: Dimensions.cardHeight,
                              child: ListView.builder(
                                controller: widget.scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: productList.length,
                                itemBuilder: (ctx, index) {
                                  return SizedBox(
                                    width: (MediaQuery.of(context).size.width / 4),
                                    child: ReviewProductWidget(productModel: productList[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: -.3,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 70, // Adjusted the radius to match the outer CircleAvatar
                              backgroundColor: Colors.deepPurple,
                              backgroundImage: AssetImage(Images.best_review),
                            ),
                          ],
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
                                  style: TextStyle(color: primarygreen),
                                ),

                              ],),
                          ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
