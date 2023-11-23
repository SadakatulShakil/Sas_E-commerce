import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/Screens/cart/widget/bottom_widget.dart';
import 'package:sas_ecommerce/Screens/cart/widget/cart_list_widget.dart';

import '../../helper/custom_app_bar.dart';
import '../../utill/dimensions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key,}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  Future<void> _loadData()async{
    /// load cart data
  }
  List<bool> chooseShipping = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          CustomAppBar(title: 'Cart', isBackButtonExist: true),
          Expanded(
              child: CartListView(backExits: true)
          )
        ],
      ),
      bottomNavigationBar: BottomWidgetView(),
    );
  }
}
