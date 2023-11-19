import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Screens/order/widget/order_type_button.dart';

import '../../Models/custom_list_model.dart';
import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class OrderScreen extends StatefulWidget {
  bool backExits;
  OrderScreen({Key? key, required this.backExits}) : super(key: key);
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;

  List<CustomListItem> list1 = [
    CustomListItem(image: Images.orderItem, title: "Item 1", description: "Description 1"),
    CustomListItem(image: Images.orderItem, title: "Item 2", description: "Description 2"),
    CustomListItem(image: Images.orderItem, title: "Item 3", description: "Description 3"),
  ];

  List<CustomListItem> list2 = [
    CustomListItem(image: Images.orderItem, title: "Item A", description: "Description A"),
    CustomListItem(image: Images.orderItem, title: "Item B", description: "Description B"),
    CustomListItem(image: Images.orderItem, title: "Item C", description: "Description C"),
  ];

  List<CustomListItem> list3 = [
    CustomListItem(image: Images.orderItem, title: "Option X", description: "Description X"),
    CustomListItem(image: Images.orderItem, title: "Option Y", description: "Description Y"),
    CustomListItem(image: Images.orderItem, title: "Option Z", description: "Description Z"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          CustomAppBar(title: 'Order', isBackButtonExist: widget.backExits),
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOrderButton(
                  text: "Pending(3)",
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                CustomOrderButton(
                  text: "Delivered(3)",
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                CustomOrderButton(
                  text: "Canceled(3)",
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: getList(selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getList(int index) {
    switch (index) {
      case 0:
        return list1.map((item) => CustomListTile(item)).toList();
      case 1:
        return list2.map((item) => CustomListTile(item)).toList();
      case 2:
        return list3.map((item) => CustomListTile(item)).toList();
      default:
        return [];
    }
  }
}

class CustomListTile extends StatelessWidget {
  final CustomListItem item;

  CustomListTile(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
        color: Theme.of(context).cardColor,
        child: ListTile(
          leading: ClipOval(child: FadeInImage.assetNetwork(
            placeholder: item.image, height: 50, width: 50, fit: BoxFit.cover,
            image: item.image,
            imageErrorBuilder: (c, o, s) => Image.asset(item.image, height: 50, width: 50, fit: BoxFit.cover),
          )),
          title: Text(item.title, style: TextStyle(
            fontSize: Dimensions.fontSizeSmall,
          )),
          subtitle: Text((item.description),
            style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, color: Colors.blueGrey.shade200),
          ),
        ),
      ),
    );
  }
}
