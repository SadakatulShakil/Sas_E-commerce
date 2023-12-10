import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Models/custom_list_model.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';

class OrderListView extends StatefulWidget {
  bool backExits;

  OrderListView({Key? key, required this.backExits}) : super(key: key);

  @override
  _OrderListViewState createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  int selectedIndex = 0;

  List<CustomListItem> list1 = [
    CustomListItem(
        image: Images.orderItem, title: "Item 1", description: "Description 1"),
    CustomListItem(
        image: Images.orderItem, title: "Item 1", description: "Description 1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list1.length,
        padding:
            const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                  color: Theme.of(context).cardColor,
                  child: ListTile(
                    leading: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .5, color: Colors.red)),
                      child: Image.asset(
                        Images.cat_men,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(list1[index].title, maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    subtitle: Text('Quantity- '+'2', maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeDefault,
                        )),
                    trailing: Text('৳ 1200', maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimensions.fontSizeDefault,
                          color: Colors.green
                        )),
                  )
                  //CustomListTile(list1[index])
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final CustomListItem item;

  CustomListTile(this.item);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(color: Colors.white,

      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: .5, color: Colors.red)),
              child: Image.asset(
                Images.cat_men,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text('name of product from cart', maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: Dimensions.fontSizeDefault,
                          )),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall,),
                    Text(
                      '৳ 1200',maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(width: Dimensions.fontSizeDefault,),
                    Text(
                      'Quantity : 2',maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

