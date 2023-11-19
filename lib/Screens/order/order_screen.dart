import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/Screens/order/widget/order_type_button.dart';

import '../../Models/category_model.dart';
import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';


class OrderScreen extends StatefulWidget {
  bool backExits;
  OrderScreen({Key? key, required this.backExits}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Category> pendingList = [];
  List<Category> deliveredList = [];
  List<Category> canceledList = [];
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: 'Order', isBackButtonExist: widget.backExits),
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child: Row(children: [
              OrderTypeButton(text: 'Running', index: 0),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              OrderTypeButton(text: 'Delivered', index: 1),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              OrderTypeButton(text: 'Canceled', index: 2),
            ],),),
          Expanded(
            child: RefreshIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              onRefresh: () async {
                //await Provider.of<OrderProvider>(context, listen: false).initOrderList(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 150, width: 150,child: Image.asset(Images.noData,)),
                  Text('Sorry', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.blueAccent),),
                  Text('No data Found', style: TextStyle(fontSize: 18),)
                ],
              )),)
        ],
      ),
    );
  }

}




