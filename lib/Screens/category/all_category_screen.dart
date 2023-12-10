import 'package:flutter/material.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../Models/category_model.dart';
import '../../Models/sub_category_model.dart';
import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class AllCategoryScreen extends StatefulWidget {
  bool backExits;
  AllCategoryScreen({Key? key, required this.backExits}) : super(key: key);

  @override
  _AllCategoryScreenState createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  int selectedCatIndex = 0;

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
    final List<SubCategory> subCategoryList = [
      SubCategory(id: 1, parent_id: 1, name: 'Mens', imageAsset: Images.cat_men),
      SubCategory(id: 2, parent_id: 2, name: 'Womens', imageAsset: Images.cat_women),
      SubCategory(id: 3, parent_id: 1, name: 'Kids', imageAsset: Images.cat_kid),
      SubCategory(id: 4, parent_id: 2, name: 'Home decor', imageAsset: Images.cat_home),
      SubCategory(id: 5, parent_id: 8, name: 'Electronics', imageAsset: Images.cat_electronics),
      SubCategory(id: 6, parent_id: 2, name: 'Interior', imageAsset: Images.cat_interior),
      SubCategory(id: 7, parent_id: 1, name: 'Sports', imageAsset: Images.cat_sports),
      SubCategory(id: 8, parent_id: 1, name: 'Others', imageAsset: Images.cat_others),
      // Add more categories as needed
    ];
    List<SubCategory> filterList = subCategoryList.where((element) => element.parent_id == selectedCatIndex+1).toList();
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          CustomAppBar(title: 'Categories', isBackButtonExist: widget.backExits),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: 3),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categoryList.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      Category category = categoryList[index];
                      return InkWell(
                        onTap: () {
                          print('selected index: $index');
                          setState(() {
                            selectedCatIndex = index;
                          });
                        },
                        child: CategoryItem(
                          category: category,
                          title: category.name,
                          icon: category.imageAsset,
                          isSelected: selectedCatIndex == index,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    itemCount: filterList.length+1,
                    itemBuilder: (context, index) {
                      if(index == 0) {
                          return Ink(
                            color: Colors.white,
                            child: ListTile(
                              title: Text('All', maxLines: 2, overflow: TextOverflow.ellipsis),
                              trailing: const Icon(Icons.navigate_next),
                              onTap: () {
                                int count =  subCategoryList.where((element) => element.parent_id == selectedCatIndex+1).toList().length;
                                print('vvvvvvvv: $count');
                                // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                                //   isBrand: false,
                                //   id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].id.toString(),
                                //   name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].name,
                                // )));
                              },
                            ),
                          );
                      }else{
                        SubCategory subCat = filterList[index-1];
                        return Ink(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(subCat.name, maxLines: 2, overflow: TextOverflow.ellipsis),
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
                      // if (index == 0) {
                      //   return Ink(
                      //     color: Colors.white,
                      //     child: ListTile(
                      //       title: Text('All', maxLines: 2, overflow: TextOverflow.ellipsis),
                      //       trailing: const Icon(Icons.navigate_next),
                      //       onTap: () {
                      //         int count =  subCategoryList.where((element) => element.parent_id == selectedCatIndex+1).toList().length;
                      //         print('vvvvvvvv: $count');
                      //         // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                      //         //   isBrand: false,
                      //         //   id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].id.toString(),
                      //         //   name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].name,
                      //         // )));
                      //       },
                      //     ),
                      //   );
                      // } else {
                      //   return Ink(
                      //     color: Theme.of(context).highlightColor,
                      //     child: ListTile(
                      //       title: Text(subCat.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                      //       trailing: Icon(Icons.navigate_next, color: Theme.of(context).textTheme.bodyLarge!.color),
                      //       onTap: () {
                      //         // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                      //         //   isBrand: false,
                      //         //   id: subCategory.id.toString(),
                      //         //   name: subCategory.name,
                      //         // )));
                      //       },
                      //     ),
                      //   );
                      //}
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // List<Widget> _getSubSubCategories(BuildContext context, SubCategory mySubCategory) {
  //   List<Widget> subSubCategories = [];
  //   subSubCategories.add(
  //     Container(
  //       color: Colors.white,
  //       margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
  //       child: ListTile(
  //         title: Row(
  //           children: [
  //             Container(
  //               height: 7,
  //               width: 7,
  //               decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
  //             ),
  //             const SizedBox(width: Dimensions.paddingSizeSmall),
  //             Flexible(
  //               child: Text(
  //                 'All',
  //                 style: TextStyle(
  //                   color: Theme.of(context).textTheme.bodyLarge!.color,
  //                 ),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ),
  //           ],
  //         ),
  //         onTap: () {
  //           // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
  //           //   isBrand: false,
  //           //   id: subCategory.id.toString(),
  //           //   name: subCategory.name,
  //           // )));
  //         },
  //       ),
  //     ),
  //   );
  //   for (int index = 0; index < 1; index++) {
  //     subSubCategories.add(
  //       Container(
  //         color: Colors.white,
  //         margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
  //         child: ListTile(
  //           title: Row(
  //             children: [
  //               Container(
  //                 height: 7,
  //                 width: 7,
  //                 decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
  //               ),
  //               const SizedBox(width: Dimensions.paddingSizeSmall),
  //               Flexible(
  //                 child: Text(
  //                   mySubCategory.name,
  //                   style: TextStyle(
  //                     color: Theme.of(context).textTheme.bodyLarge!.color,
  //                   ),
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           onTap: () {
  //             // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
  //             //   isBrand: false,
  //             //   id: subCategory.subSubCategories![index].id.toString(),
  //             //   name: subCategory.subSubCategories![index].name,
  //             // )));
  //           },
  //         ),
  //       ),
  //     );
  //   }
  //   return subSubCategories;
  // }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final String? title;
  final String? icon;
  final bool isSelected;
  const CategoryItem({Key? key, required this.category, required this.title, required this.icon, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? primaryColor : null,
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
                placeholder: category.imageAsset,
                fit: BoxFit.cover,
                image: category.imageAsset,
                imageErrorBuilder: (c, o, s) => Image.asset(category.imageAsset, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
            child: Text(
              title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Dimensions.fontSizeExtraSmall,
                color: isSelected ? Colors.white : Theme.of(context).hintColor,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
