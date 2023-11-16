import 'package:flutter/material.dart';
import 'package:sas_ecommerce/helper/message_widget.dart';

import '../../../Models/category_model.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../../helper/product_widget.dart';

class ClientOpinionView extends StatefulWidget {
  final ScrollController scrollController;
  final bool isHome;

  const ClientOpinionView({Key? key, required this.scrollController, required this.isHome}) : super(key: key);

  @override
  _ClientOpinionViewState createState() => _ClientOpinionViewState();
}

class _ClientOpinionViewState extends State<ClientOpinionView> {
  final List<Category> productList = [
    Category(id: 100, name: 'Mens', imageAsset: Images.client_message),
    Category(id: 200, name: 'Womens', imageAsset: Images.client_message),
    Category(id: 103, name: 'Kids', imageAsset: Images.client_message),
    Category(id: 204, name: 'Home decor', imageAsset: Images.client_message),
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.messageCardHeight,
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (ctx, index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width / 1.5),
            child: MessageWidget(productModel: productList[index]),
          );
        },
      ),
    );
  }
}
