import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/Screens/home/widgets/seller_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Models/topseller_model.dart';
import '../../../utill/stored_images.dart';

class TopSellerView extends StatelessWidget {
  final bool isHomePage;
  const TopSellerView({Key? key, required this.isHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TopSeller> topSellerList = [
      TopSeller(id: 1, name: 'Mens', imageAsset: Images.shop1),
      TopSeller(id: 2, name: 'Womens', imageAsset: Images.shop2),
      TopSeller(id: 3, name: 'Kids', imageAsset: Images.shop3),
      TopSeller(id: 4, name: 'Interior', imageAsset: Images.shop4),
      TopSeller(id: 5, name: 'Sports', imageAsset: Images.shop5),
      TopSeller(id: 6, name: 'Others', imageAsset: Images.shop6),
      // Add more categories as needed
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (1/1),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemCount: isHomePage && topSellerList.length > 6? 6: topSellerList.length,
      shrinkWrap: true,
      physics: isHomePage ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {

        return SellerCard(
            sellerModel: topSellerList[index]);

      },
    );
  }
}

class TopSellerShimmer extends StatelessWidget {
  const TopSellerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1/1),
      ),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {

        return Container(
          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey[200]!, spreadRadius: 2, blurRadius: 5)]),
          margin: const EdgeInsets.all(3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

            Expanded(
              flex: 7,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                )),
              ),
            ),

            Expanded(flex: 3, child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(height: 10, color: Colors.white, margin: const EdgeInsets.only(left: 15, right: 15)),
              ),
            )),

          ]),
        );

      },
    );
  }
}

