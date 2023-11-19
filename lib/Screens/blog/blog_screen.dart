import 'package:flutter/material.dart';


class BlogScreen extends StatefulWidget {
  final bool isBacButtonExist;
  const BlogScreen({Key? key, this.isBacButtonExist = true}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  // late bool isGuestMode = !Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
  // @override
  // void initState() {
  //   if(!isGuestMode){
  //     Provider.of<OrderProvider>(context, listen: false).initOrderList(context);
  //
  //   }
  //
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body:
        Center(
          child: Text("Blog Screen", style: TextStyle(fontSize: 20, color: Colors.black)),
        )
      // Column(
      //   children: [
      //
      //     CustomAppBar(title: getTranslated('CATEGORY', context)),
      //
      //     Expanded(child: Consumer<CategoryProvider>(
      //       builder: (context, categoryProvider, child) {
      //         return categoryProvider.categoryList.isNotEmpty ? Row(children: [
      //
      //           Container(
      //             width: 100,
      //             margin: const EdgeInsets.only(top: 3),
      //             height: double.infinity,
      //             decoration: BoxDecoration(
      //               color: Theme.of(context).highlightColor,
      //               boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200]!,
      //                   spreadRadius: 1, blurRadius: 1)],
      //             ),
      //             child: ListView.builder(
      //               physics: const BouncingScrollPhysics(),
      //               itemCount: categoryProvider.categoryList.length,
      //               padding: const EdgeInsets.all(0),
      //               itemBuilder: (context, index) {
      //                 Category category = categoryProvider.categoryList[index];
      //                 return InkWell(
      //                   onTap: () => Provider.of<CategoryProvider>(context, listen: false).changeSelectedIndex(index),
      //                   child: CategoryItem(
      //                     title: category.name,
      //                     icon: category.icon,
      //                     isSelected: categoryProvider.categorySelectedIndex == index,
      //                   ),
      //                 );
      //
      //               },
      //             ),
      //           ),
      //
      //           Expanded(child: ListView.builder(
      //             padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      //             itemCount: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].subCategories!.length+1,
      //             itemBuilder: (context, index) {
      //
      //               late SubCategory subCategory;
      //               if(index != 0) {
      //                 subCategory = categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].subCategories![index-1];
      //               }
      //               if(index == 0) {
      //                 return Ink(
      //                   color: Theme.of(context).highlightColor,
      //                   child: ListTile(
      //                     title: Text(getTranslated('all', context)!, style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
      //                     trailing: const Icon(Icons.navigate_next),
      //                     onTap: () {
      //                       Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
      //                         isBrand: false,
      //                         id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].id.toString(),
      //                         name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex!].name,
      //                       )));
      //                     },
      //                   ),
      //                 );
      //               }else if (subCategory.subSubCategories!.isNotEmpty) {
      //                 return Ink(
      //                   color: Theme.of(context).highlightColor,
      //                   child: Theme(
      //                     data: Provider.of<ThemeProvider>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
      //                     child: ExpansionTile(
      //                       key: Key('${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
      //                       title: Text(subCategory.name!, style: titilliumSemiBold.copyWith(color: Theme.of(context).textTheme.bodyLarge!.color), maxLines: 2, overflow: TextOverflow.ellipsis),
      //                       children: _getSubSubCategories(context, subCategory),
      //                     ),
      //                   ),
      //                 );
      //               } else {
      //                 return Ink(
      //                   color: Theme.of(context).highlightColor,
      //                   child: ListTile(
      //                     title: Text(subCategory.name!, style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
      //                     trailing: Icon(Icons.navigate_next, color: Theme.of(context).textTheme.bodyLarge!.color),
      //                     onTap: () {
      //                       Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
      //                         isBrand: false,
      //                         id: subCategory.id.toString(),
      //                         name: subCategory.name,
      //                       )));
      //                     },
      //                   ),
      //                 );
      //               }
      //
      //             },
      //           )),
      //
      //         ]) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
      //       },
      //     )),
      //   ],
      // ),
    );
    // return Scaffold(
    //   backgroundColor: ColorResources.getIconBg(context),
    //   body: Column(
    //     children: [
    //       CustomAppBar(title: getTranslated('ORDER', context), isBackButtonExist: widget.isBacButtonExist),
    //       isGuestMode ? const SizedBox() :
    //       Provider.of<OrderProvider>(context).pendingList != null ?
    //       Consumer<OrderProvider>(
    //         builder: (context, orderProvider, child) => Padding(
    //           padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
    //           child: Row(children: [
    //             OrderTypeButton(text: getTranslated('RUNNING', context), index: 0, orderList: orderProvider.pendingList),
    //             const SizedBox(width: Dimensions.paddingSizeSmall),
    //             OrderTypeButton(text: getTranslated('DELIVERED', context), index: 1, orderList: orderProvider.deliveredList),
    //             const SizedBox(width: Dimensions.paddingSizeSmall),
    //             OrderTypeButton(text: getTranslated('CANCELED', context), index: 2, orderList: orderProvider.canceledList),
    //           ],),),) : const SizedBox(),
    //
    //
    //       isGuestMode ? const Expanded(child: NotLoggedInWidget()) :
    //       Provider.of<OrderProvider>(context).pendingList != null ?
    //       Consumer<OrderProvider>(
    //         builder: (context, order, child) {
    //           List<OrderModel>? orderList = [];
    //           if (Provider.of<OrderProvider>(context, listen: false).orderTypeIndex == 0) {
    //             orderList = order.pendingList;
    //           }
    //
    //           else if (Provider.of<OrderProvider>(context, listen: false).orderTypeIndex == 1) {
    //             orderList = order.deliveredList;
    //           }
    //
    //           else if (Provider.of<OrderProvider>(context, listen: false).orderTypeIndex == 2) {
    //             orderList = order.canceledList;
    //           }
    //           return Expanded(
    //             child: RefreshIndicator(
    //               backgroundColor: Theme.of(context).primaryColor,
    //               onRefresh: () async {
    //                 await Provider.of<OrderProvider>(context, listen: false).initOrderList(context);
    //               },
    //               child: ListView.builder(
    //                 itemCount: orderList!.length,
    //                 padding: const EdgeInsets.all(0),
    //                 itemBuilder: (context, index) => OrderWidget(orderModel: orderList![index]),
    //               ),),);},)
    //           : const Expanded(child: OrderShimmer()),
    //     ],
    //   ),
    // );
  }
}




