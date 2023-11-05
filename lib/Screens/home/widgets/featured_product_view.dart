import 'package:flutter/material.dart';

import '../../../Models/category_model.dart';
import '../../../utill/stored_images.dart';
import '../../auth/common/product_widget.dart';

class FeaturedProductView extends StatelessWidget {
  final bool isHome;

  const FeaturedProductView({Key? key, required this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (ctx,index){
          return SizedBox(width: (MediaQuery.of(context).size.width/2)-20,
              child: ProductWidget(productModel: productList[index]));

        }
    );
  }
}

