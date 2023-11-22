import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sas_ecommerce/helper/message_widget.dart';

import '../../../Models/category_model.dart';
import '../../../helper/achievement_widget.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/product_widget.dart';

class AchievementView extends StatefulWidget {
  final ScrollController scrollController;
  final bool isHome;

  const AchievementView({Key? key, required this.scrollController, required this.isHome}) : super(key: key);

  @override
  _AchievementViewState createState() => _AchievementViewState();
}

class _AchievementViewState extends State<AchievementView> {
  final List<Category> productList = [
    Category(id: 100, name: 'Mens', imageAsset: Images.achievement1),
    Category(id: 200, name: 'Womens', imageAsset: Images.achievement2),
    Category(id: 103, name: 'Kids', imageAsset: Images.achievement3),
    Category(id: 204, name: 'Home decor', imageAsset: Images.ispire_image),
    Category(id: 204, name: 'Home decor', imageAsset: Images.achievement3),
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: StaggeredGridView.countBuilder(
        itemCount: productList.length,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        itemBuilder: (context, index) {
          return Container(
                    height: index == 0?160:index == 4?100:(index % 5+1) * 50,
                    child: AchievementWidget(productModel: productList[index]),
                  );
        },
      )
    );
  }
}
