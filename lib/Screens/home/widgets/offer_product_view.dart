import 'package:flutter/material.dart';

import '../../../Models/category_model.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/product_widget.dart';

class OfferProductView extends StatefulWidget {
  final ScrollController scrollController;
  final bool isHome;

  const OfferProductView({Key? key, required this.scrollController, required this.isHome}) : super(key: key);

  @override
  _OfferProductViewState createState() => _OfferProductViewState();
}

class _OfferProductViewState extends State<OfferProductView> {
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
    return Container(
      height: Dimensions.cardHeight,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (ctx, index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 20,
            child: ProductWidget(productModel: productList[index]),
          );
        },
      ),
    );
  }
}
