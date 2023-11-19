import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Screens/home/widgets/achievement_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/banners_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/category_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/client_opinion_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/featured_product_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/inspire_person_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/latest_product_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/offer_product_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/recommended_product_view.dart';
import 'package:sas_ecommerce/Screens/home/widgets/top_seller_view.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../Models/category_model.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';
import '../../helper/title_row.dart';
import '../category/all_category_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController  = ScrollController();

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
  Future<void> _loadData(bool reload) async {
  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    _loadData(false);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            await _loadData( true);
            //await Provider.of<FlashDealProvider>(Get.context!, listen: false).getMegaDealList(true, false);
          },
          child: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  // App Bar
                  SliverAppBar(
                    floating: true,
                    elevation: 0,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    title: Image.asset(Images.logoImage, height: 35),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                          },
                          icon: Stack(clipBehavior: Clip.none, children: [
                            Image.asset(
                              Images.cartArrowDownImage,
                              height: Dimensions.iconSizeDefault,
                              width: Dimensions.iconSizeDefault,
                              color: icongreen,
                            ),
                            Positioned(top: -4, right: -4,
                              child: CircleAvatar(radius: 7, backgroundColor: Colors.red,
                                child: Text('0',// need a consumer for cart data
                                    style: TextStyle(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall,
                                    )),
                              ),
                            ),
                          ]),
                        ),
                      ),


                    ],
                  ),

                  // Search Button
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverDelegate(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Container(padding: const EdgeInsets.only(
                                left: Dimensions.homePagePadding, right: Dimensions.paddingSizeExtraSmall,
                                top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall,
                              ),
                                height: 60, alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(color: Theme.of(context).cardColor,
                                  boxShadow: [BoxShadow(color: Colors.grey[200]!, spreadRadius: 1, blurRadius: 1)],
                                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
                                child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [

                                  Text('Search product..',
                                      style: TextStyle(color: Theme.of(context).hintColor)),

                                  Container(
                                    width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                                      borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall))
                                  ),
                                    child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.iconSizeSmall),
                                  ),
                                ]),
                              ),
                            ),
                          ))),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(Dimensions.homePagePadding,
                          Dimensions.paddingSizeSmall, Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall  ),
                      child: Column(
                        children: [
                          BannersView(),
                          const SizedBox(height: Dimensions.homePagePadding),

                          // Category
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraExtraSmall,vertical: Dimensions.paddingSizeExtraSmall),
                            child: TitleRow(
                                title: 'Categories',
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreen(backExits: true)))),
                          ),
                          const SizedBox(height: Dimensions.paddingSizeSmall),
                          const Padding(
                            padding: EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: CategoryView(isHomePage: true),
                          ),

                          /// Inspire Person
                          const Padding(
                            padding: EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: InspirePersonView(),
                          ),

                         /// top seller

                          singleVendor?const SizedBox():
                          TitleRow(title: 'Top Seller',
                            onTap: () {
                            print("clicked to: top seller item");
                            //Navigator.push(context, MaterialPageRoute(builder: (_) => const AllTopSellerScreen(topSeller: null,)));
                            },
                          ),
                          singleVendor?const SizedBox(height: 0):const SizedBox(height: Dimensions.paddingSizeSmall),
                          singleVendor?const SizedBox():
                          const Padding(
                            padding: EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: TopSellerView(isHomePage: true),
                          ),

                          /// Client messages

                          TitleRow(title: 'Our Client Opinion',
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                //     AllProductScreen(productType: ProductType.featuredProduct)));
                              }
                          ),
                          const SizedBox(height: Dimensions.paddingSizeSmall),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: ClientOpinionView(scrollController: scrollController, isHome: true,),
                          ),

                          /// Latest Products

                          TitleRow(title: 'Best Selling Products',
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                //     AllProductScreen(productType: ProductType.featuredProduct)));
                              }
                          ),
                          const SizedBox(height: Dimensions.paddingSizeSmall),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: LatestProductView(scrollController: scrollController, isHome: true,),
                          ),


                          ///second banner
                          BannersView(),
                          const SizedBox(height: Dimensions.homePagePadding),

                          /// achievements

                          TitleRow(title: 'Our Seller Achievements',
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                //     AllProductScreen(productType: ProductType.featuredProduct)));
                              }
                          ),
                          const SizedBox(height: Dimensions.paddingSizeSmall),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: AchievementView(scrollController: scrollController, isHome: true,),
                          ),

                          /// Recommended Product
                          Padding(
                            padding: EdgeInsets.only(bottom: Dimensions.homePagePadding),
                            child: RecommendedProductView(scrollController: scrollController, isHome: true,),
                          ),

                          // /// Featured Products
                          //
                          // TitleRow(title: 'Featured Products',
                          //     onTap: () {
                          //       // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          //       //     AllProductScreen(productType: ProductType.featuredProduct)));
                          //     }
                          // ),
                          // const SizedBox(height: Dimensions.paddingSizeSmall),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
                          //   child: FeaturedProductView(scrollController: scrollController, isHome: true,),
                          // ),
                          //
                          // /// Offer Products
                          //
                          // TitleRow(title: 'Offer Products',
                          //     onTap: () {
                          //       // Navigator.push(context, MaterialPageRoute(builder: (_) =>
                          //       //     AllProductScreen(productType: ProductType.featuredProduct)));
                          //     }
                          // ),
                          // const SizedBox(height: Dimensions.paddingSizeSmall),
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: Dimensions.homePagePadding),
                          //   child: OfferProductView(scrollController: scrollController, isHome: true,),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 || oldDelegate.minExtent != 70 || child != oldDelegate.child;
  }
}
