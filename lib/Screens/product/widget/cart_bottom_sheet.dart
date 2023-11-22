import 'package:flutter/material.dart';

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
                        child: Text('1200',
                          style: TextStyle(color: Theme.of(context).cardColor,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Text(
                     '1300',
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
              Text('Quantity', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              QuantityButton(isIncrement: false, quantity: 1,
                  stock: 10, minimumOrderQuantity: 1,
                  digitalProduct: true),
              Text('1', style: TextStyle(fontWeight: FontWeight.w600)),
              QuantityButton(isIncrement: true, quantity: 1, stock: 10,
                  minimumOrderQuantity: 1,
                  digitalProduct: true),
            ]),
            const SizedBox(height: Dimensions.paddingSizeSmall),


            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Total Price', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Text('1200',
                style: TextStyle(color: Colors.green, fontSize: Dimensions.fontSizeLarge),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeSmall),

            Row(children: [
              Expanded(
                child: CustomButton(
                  buttonText: 'Add to Cart',
                  onTap: (){
                    showCustomSnackBar('Added to Cart', context, isError: false);
                         },
                  backgroundColor: Colors.green.shade200,
                  radius: 20,
                ),),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child:
                CustomButton(
                  buttonText: 'Add to Cart',
                  onTap: (){
                    showCustomSnackBar('Added to Cart', context, isError: false);
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
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int? quantity;
  final bool isCartWidget;
  final int? stock;
  final int? minimumOrderQuantity;
  final bool digitalProduct;

  const QuantityButton({Key? key,
    required this.isIncrement,
    required this.quantity,
    required this.stock,
    this.isCartWidget = false,required this.minimumOrderQuantity,required this.digitalProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        /// quantity button task
      },
      icon: Container(
        width: 40,height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Theme.of(context).primaryColor)
        ),
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: isIncrement ? quantity! >= stock! && !digitalProduct? Colors.red : Colors.black
              : quantity! > 1
              ? Colors.black
              : Colors.black,
          size: isCartWidget?26:20,
        ),
      ),
    );
  }
}


