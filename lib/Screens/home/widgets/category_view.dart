import 'package:flutter/material.dart';

import '../../../Models/category_model.dart';
import '../../../utill/stored_images.dart';
import 'category_widget.dart';

class CategoryView extends StatelessWidget {
  final bool isHomePage;
  const CategoryView({Key? key, required this.isHomePage}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<Category> categoryList = [
      Category(id: 1, name: 'Mens', imageAsset: Images.cat_men),
      Category(id: 2, name: 'Womens', imageAsset: Images.cat_women),
      Category(id: 3, name: 'Kids', imageAsset: Images.cat_kid),
      Category(id: 4, name: 'Home decor', imageAsset: Images.cat_home),
      Category(id: 5, name: 'Electronics', imageAsset: Images.cat_electronics),
      Category(id: 6, name: 'Interior', imageAsset: Images.cat_interior),
      Category(id: 7, name: 'Sports', imageAsset: Images.cat_sports),
      Category(id: 8, name: 'Others', imageAsset: Images.cat_others),
      // Add more categories as needed
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 5,
        childAspectRatio: (1/1.3),
      ),
      itemCount: isHomePage
          ? categoryList.length > 8
          ? 8
          : categoryList.length
          : categoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {

        return InkWell(
          onTap: () {
            print('clicked to:' +categoryList[index].name.toString());
            // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
            //   isBrand: false,
            //   id: categoryList[index].id.toString(),
            //   name: categoryList[index].name,
            // )));
          },
          child: CategoryWidget(category: categoryList[index]),
        );

      },
    );
  }
}



