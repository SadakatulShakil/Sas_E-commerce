import 'package:flutter/material.dart';
import '../../../Models/category_model.dart';
import '../../../helper/constant.dart';
import '../../../helper/product_widget.dart';
import '../../../helper/review_product_widget.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../helper/rating_bar.dart';

class MoreProductView extends StatefulWidget {

  const MoreProductView({Key? key, }) : super(key: key);

  @override
  _MoreProductViewState createState() => _MoreProductViewState();
}

class _MoreProductViewState extends State<MoreProductView> {
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
          StaggeredGridView.countBuilder(
            itemCount: productList.length,
            crossAxisCount: 2,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(productModel: productList[index]);
            },
          ),

        ]);
  }
}
