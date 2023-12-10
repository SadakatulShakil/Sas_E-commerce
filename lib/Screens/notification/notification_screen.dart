import 'package:flutter/material.dart';

import '../../Models/custom_list_model.dart';
import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';
import '../order/order_screen.dart';

class NotificationScreen extends StatelessWidget {
  bool backExits;
  NotificationScreen({Key? key, required this.backExits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<NotificationProvider>(context, listen: false).initNotificationList(context);
    List<CustomListItem> noteList = [
      CustomListItem(image: Images.orderItem, title: "Test notification 1", description: "12:45 | 12-Oct-2023"),
      CustomListItem(image: Images.orderItem, title: "Test notification 2", description: "10:45 | 15-Sep-2023"),
      CustomListItem(image: Images.orderItem, title: "Test notification 3", description: "09:45 | 12-Aug-2023"),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(children: [
        CustomAppBar(title: 'Notification', isBackButtonExist: backExits),
        Expanded(
          child: RefreshIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              onRefresh: () async {
                //await Provider.of<OrderProvider>(context, listen: false).initOrderList(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: noteList.length,
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:() {

                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                            color: Theme.of(context).cardColor,
                            child: ListTile(
                              leading: ClipOval(child: FadeInImage.assetNetwork(
                                placeholder: Images.logoImage, height: 50, width: 50, fit: BoxFit.cover,
                                image: Images.logoImage,
                                imageErrorBuilder: (c, o, s) => Image.asset(Images.logoImage, height: 50, width: 50, fit: BoxFit.cover),
                              )),
                              title: Text(noteList[index].title, style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                              )),
                              subtitle: Text((noteList[index].description),
                                style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, color: Colors.blueGrey.shade200),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Container(height: 150, width: 150,child: Image.asset(Images.noData,)),
                  // Text('Sorry', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.blueAccent),),
                  // Text('No data Found', style: TextStyle(fontSize: 18),)
                ],
              )),)

      ]),
    );
  }
}

