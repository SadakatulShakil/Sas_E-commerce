import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  final bool isBacButtonExist;
  const AboutUsScreen({Key? key, this.isBacButtonExist = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Provider.of<NotificationProvider>(context, listen: false).initNotificationList(context);

    return Scaffold(
        backgroundColor: Colors.redAccent,
        body:
        Center(
          child: Text("Notification page", style: TextStyle(fontSize: 20, color: Colors.black)),
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
    //   body: Column(children: [
    //
    //     CustomAppBar(title: getTranslated('notification', context), isBackButtonExist: isBacButtonExist),
    //
    //     Expanded(
    //       child: Consumer<NotificationProvider>(
    //         builder: (context, notification, child) {
    //           return notification.notificationList != null ? notification.notificationList!.isNotEmpty ? RefreshIndicator(
    //             backgroundColor: Theme.of(context).primaryColor,
    //             onRefresh: () async {
    //               await Provider.of<NotificationProvider>(context, listen: false).initNotificationList(context);
    //             },
    //             child: ListView.builder(
    //               itemCount: Provider.of<NotificationProvider>(context).notificationList!.length,
    //               padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
    //               itemBuilder: (context, index) {
    //                 return InkWell(
    //                   onTap:() => showDialog(context: context, builder: (context) => NotificationDialog(notificationModel: notification.notificationList![index])),
    //                   child: Container(
    //                     margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
    //                     color: Theme.of(context).cardColor,
    //                     child: ListTile(
    //                       leading: ClipOval(child: FadeInImage.assetNetwork(
    //                         placeholder: Images.placeholder, height: 50, width: 50, fit: BoxFit.cover,
    //                         image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls!.notificationImageUrl}/${notification.notificationList![index].image}',
    //                         imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, height: 50, width: 50, fit: BoxFit.cover),
    //                       )),
    //                       title: Text(notification.notificationList![index].title!, style: titilliumRegular.copyWith(
    //                         fontSize: Dimensions.fontSizeSmall,
    //                       )),
    //                       subtitle: Text(DateConverter.localDateToIsoStringAMPM(DateTime.parse(notification.notificationList![index].createdAt!)),
    //                         style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: ColorResources.getHint(context)),
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           ) : const NoInternetOrDataScreen(isNoInternet: false) : const NotificationShimmer();
    //         },
    //       ),
    //     ),
    //
    //   ]),
    // );
  }
}
//
// class NotificationShimmer extends StatelessWidget {
//   const NotificationShimmer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       padding: const EdgeInsets.all(0),
//       itemBuilder: (context, index) {
//         return Container(
//           height: 80,
//           margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
//           color: ColorResources.getGrey(context),
//           alignment: Alignment.center,
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             enabled: Provider.of<NotificationProvider>(context).notificationList == null,
//             child: ListTile(
//               leading: const CircleAvatar(child: Icon(Icons.notifications)),
//               title: Container(height: 20, color: ColorResources.white),
//               subtitle: Container(height: 10, width: 50, color: ColorResources.white),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

