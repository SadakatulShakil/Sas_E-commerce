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
          return InkWell(
            onTap: () {},
            child: Container(
                margin:
                    const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                color: Theme.of(context).cardColor,
                child: CustomListTile(list1[index])),
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
    return InkWell(
      onTap: () {

      },
      child: Container(
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
      ),
    );
  }
}

class QuantityButton extends StatefulWidget {
  final bool isIncrement;
  final int quantity;
  final Function(int) onQuantityChanged;
  final bool isCartWidget;
  final int stock;
  final int minimumOrderQuantity;
  final bool digitalProduct;

  const QuantityButton({
    Key? key,
    required this.isIncrement,
    required this.quantity,
    required this.onQuantityChanged,
    required this.stock,
    this.isCartWidget = false,
    required this.minimumOrderQuantity,
    required this.digitalProduct,
  }) : super(key: key);

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!widget.isIncrement) {
          if (widget.quantity > widget.minimumOrderQuantity) {
            widget.onQuantityChanged(widget.quantity - 1);
          } else {
            Get.snackbar(
              'Its a warning!',
              'Minimum quantity is ' + widget.minimumOrderQuantity.toString(),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.pinkAccent,
              colorText: Colors.white,
              borderRadius: 10,
              margin: EdgeInsets.all(10),
            );
          }
        } else if (widget.isIncrement && (widget.quantity < widget.stock)) {
          widget.onQuantityChanged(widget.quantity + 1);
        } else {
          Get.snackbar(
            'Its a warning!',
            'Stock not available',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.pinkAccent,
            colorText: Colors.white,
            borderRadius: 10,
            margin: EdgeInsets.all(10),
          );
        }
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.redAccent,
          border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        ),
        child: Icon(
          widget.isIncrement ? Icons.add : Icons.remove,
          color: Colors.white,
          size: widget.isCartWidget ? 26 : 20,
        ),
      ),
    );
  }
}
