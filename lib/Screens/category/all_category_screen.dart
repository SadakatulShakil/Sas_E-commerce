import 'package:flutter/material.dart';

import '../../Models/category_model.dart';
import '../../Models/sub_category_model.dart';
import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

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
    final List<subCategory> subCategoryList = [
      subCategory(id: 1, parent_id : 8, name: 'Mens', imageAsset: Images.cat_men),
      subCategory(id: 2, parent_id : 7, name: 'Womens', imageAsset: Images.cat_women),
      subCategory(id: 3, parent_id : 6, name: 'Kids', imageAsset: Images.cat_kid),
      subCategory(id: 4, parent_id : 5, name: 'Home decor', imageAsset: Images.cat_home),
      subCategory(id: 5, parent_id : 4, name: 'Electronics', imageAsset: Images.cat_electronics),
      subCategory(id: 6, parent_id : 3, name: 'Interior', imageAsset: Images.cat_interior),
      subCategory(id: 7, parent_id : 2, name: 'Sports', imageAsset: Images.cat_sports),
      subCategory(id: 8, parent_id : 1, name: 'Others', imageAsset: Images.cat_others),
      // Add more categories as needed
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          CustomAppBar(title: 'Categories'),

          Expanded(
              child: Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 3),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey[200]!,
                        spreadRadius: 1, blurRadius: 1)],
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoryList.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      Category category = categoryList[index];
                      return InkWell(
                        onTap: () {

                        },
                        child: CategoryItem(
                          category: category,
                          title: category.name,
                          icon: category.imageAsset,
                          isSelected: 0 == index,
                        ),
                      );

                    },
                  ),
                ),

                Expanded(child: ListView.builder(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  itemCount: subCategoryList.length,
                  itemBuilder: (context, index) {

                    subCategory mySubCategory = subCategoryList[index];
                    if(index != 0) {
                      mySubCategory = subCategoryList[index];
                    }
                    if(index == 0) {
                      //mySubCategory = subCategoryList[index];
                      return Ink(
                        color: Colors.white,
                        child: ListTile(
                          title: Text('All', maxLines: 2, overflow: TextOverflow.ellipsis),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                            //   isBrand: false,
                            //   id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].id.toString(),
                            //   name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].name,
                            // )));
                          },
                        ),
                      );
                    }else if (subCategoryList.isNotEmpty) {
                      subCategoryList[index].parent_id == 1?mySubCategory = subCategoryList[7]:mySubCategory = subCategoryList[5];
                      return Ink(
                        color: Colors.green,
                        child: Theme(
                          data: ThemeData.light(),
                          child: ExpansionTile(
                            key: Key(0.toString()),
                            title: Text(mySubCategory.name, style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), maxLines: 2, overflow: TextOverflow.ellipsis),
                            children: _getSubSubCategories(context, mySubCategory),
                          ),
                        ),
                      );
                    } else {
                      return Ink(
                        color: Theme.of(context).highlightColor,
                        child: ListTile(
                          title: Text(mySubCategory.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                          trailing: Icon(Icons.navigate_next, color: Theme.of(context).textTheme.bodyLarge!.color),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                            //   isBrand: false,
                            //   id: subCategory.id.toString(),
                            //   name: subCategory.name,
                            // )));
                          },
                        ),
                      );
                    }

                  },
                )),

              ])),
        ],
      ),
    );
  }

  List<Widget> _getSubSubCategories(BuildContext context, subCategory mySubCategory) {
    List<Widget> subSubCategories = [];
    subSubCategories.add(Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
      child: ListTile(
        title: Row(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Flexible(child: Text('All', style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color), maxLines: 2, overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
          //   isBrand: false,
          //   id: subCategory.id.toString(),
          //   name: subCategory.name,
          // )));
        },
      ),
    ));
    for(int index=0; index < 1; index++) {
      subSubCategories.add(Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              ),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Flexible(child: Text(mySubCategory.name, style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color), maxLines: 2, overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
            //   isBrand: false,
            //   id: subCategory.subSubCategories![index].id.toString(),
            //   name: subCategory.subSubCategories![index].name,
            // )));
          },
        ),
      ));
    }
    return subSubCategories;
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final String? title;
  final String? icon;
  final bool isSelected;
  const CategoryItem({Key? key,required this.category, required this.title, required this.icon, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.green : null,
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: isSelected ? Colors.white : Theme.of(context).hintColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: category.imageAsset, fit: BoxFit.cover,
                image: category.imageAsset,
                imageErrorBuilder: (c, o, s) => Image.asset(category.imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
            child: Text(title!, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(
              fontSize: Dimensions.fontSizeExtraSmall,
              color: isSelected ? Colors.white : Theme.of(context).hintColor,
            )),
          ),
        ]),
      ),
    );
  }
}

