import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../helper/custom_button.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../home/widgets/show_custom_snakbar.dart';

class CartBottomSheet extends StatefulWidget {
  final Function? callback;
  const CartBottomSheet({Key? key, this.callback}) : super(key: key);

  @override
  CartBottomSheetState createState() => CartBottomSheetState();
}

class CartBottomSheetState extends State<CartBottomSheet> {

  route(bool isRoute, String message) async {
    // if (isRoute) {
    //   showCustomSnackBar(message, context, isError: false);
    //   Navigator.pop(context);
    // } else {
    //   Navigator.pop(context);
    //   showCustomSnackBar(message, context);
    //
    // }
  }
  int quantity = 1;
  double actualTotal = 1200.0;
  @override
  void initState() {
    // Provider.of<ProductDetailsProvider>(context, listen: false).initData(widget.product!,widget.product!.minimumOrderQty, context);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            // Close Button
            Align(alignment: Alignment.centerRight, child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [BoxShadow(
                  color: Theme.of(context).hintColor,
                  spreadRadius: 1,
                  blurRadius: 5,
                )]),
                child: const Icon(Icons.clear, size: Dimensions.iconSizeSmall),
              ),
            )),

            // Product details
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: .5,color: Theme.of(context).primaryColor.withOpacity(.20))
                        ),
                        child: Image.asset(Images.cat_men,fit: BoxFit.cover,),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mens Denim Jacket',
                                  style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                                  maxLines: 2, overflow: TextOverflow.ellipsis),

                              const SizedBox(height: Dimensions.paddingSizeSmall),
                              Row(
                                children: [
                                  const Icon(Icons.star,color: Colors.orange),
                                  Text(double.parse('0').toStringAsFixed(1),
                                      style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                                      maxLines: 2, overflow: TextOverflow.ellipsis),
                                ],
                              ),
                              Text('Stock available: 10',
                                  style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              Text('Minimum quantiy: 1',
                                  style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ]),
                      ),
                    ]),


                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('৳ 1200',
                          style: TextStyle(color: Theme.of(context).cardColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Text(
                     '৳ 1300',
                      style: TextStyle(color: Colors.redAccent,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall,),

            // Quantity
            Row(children: [
              Text('Quantity: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              QuantityButton(
                isIncrement: false,
                quantity: quantity,
                stock: 10,
                minimumOrderQuantity: 1,
                digitalProduct: true,
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                    actualTotal -=1200;
                  });
                },
              ),
              Text('$quantity', style: TextStyle(fontWeight: FontWeight.w600)),
              QuantityButton(
                isIncrement: true,
                quantity: quantity,
                stock: 10,
                minimumOrderQuantity: 1,
                digitalProduct: true,
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                    actualTotal +=1200;
                  });
                },
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeSmall),


            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Total Price', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Text('৳ $actualTotal',
                style: TextStyle(color: Colors.green, fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w600),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeSmall),

            Row(children: [
              Expanded(
                child: CustomButton(
                  buttonText: 'Add to Cart',
                  onTap: (){
                    /// do add to cart system

                    addCart();
                    Navigator.pop(context);
                    showCustomSnackBar('Added to Cart', context, isError: false);
                         },
                  backgroundColor: Colors.green.shade200,
                  radius: 20,
                ),),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child:
                CustomButton(
                  buttonText: 'Buy Now',
                  onTap: (){
                    _navigateToNextScreen(context);
                    /// do add to buy system
                    showCustomSnackBar('Buy now product', context, isError: false);
                  },
                  backgroundColor: Colors.amber.shade200,
                  radius: 20,
                )
              ),

            ],),
          ])
        ),
      ],
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartScreen()));
  }

  void addCart() {
    String name = 'jjjj';
    String price = '555';
    String quantity = 'pppp';

    int cartValue;
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
          if(widget.quantity > widget.minimumOrderQuantity){
            widget.onQuantityChanged(widget.quantity - 1);
          }else{
            Get.snackbar(
              'Its a warning!',
              'Minimum quantity is '+widget.minimumOrderQuantity.toString(),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.pinkAccent,
              colorText: Colors.white,
              borderRadius: 10,
              margin: EdgeInsets.all(10),
            );
          }

        } else if (widget.isIncrement && (widget.quantity < widget.stock)) {
          widget.onQuantityChanged(widget.quantity + 1);
        }else{
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
          border: Border.all(
              width: 1, color: Theme.of(context).primaryColor),
        ),
        child: Icon(
          widget.isIncrement ? Icons.add : Icons.remove,
          color: widget.isIncrement
              ? widget.quantity >= widget.stock! && !widget.digitalProduct
              ? Colors.red
              : Colors.black
              : widget.quantity > 1
              ? Colors.black
              : Colors.black,
          size: widget.isCartWidget ? 26 : 20,
        ),
      ),
    );
  }
}



