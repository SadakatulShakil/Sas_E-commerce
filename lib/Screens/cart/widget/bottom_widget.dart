import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../checkout/checkout_screen.dart';
import '../../home/widgets/show_custom_snakbar.dart';

class BottomWidgetView extends StatefulWidget {

  const BottomWidgetView({Key? key}) : super(key: key);

  @override
  State<BottomWidgetView> createState() => _BottomWidgetViewState();
}

class _BottomWidgetViewState extends State<BottomWidgetView> {
  bool vacationIsOn = false;
  bool temporaryClose = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(height: 80, padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
        vertical: Dimensions.paddingSizeDefault),

      decoration: BoxDecoration(color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Center(
                    child: Row(
                      children: [
                        Text('Total Price : ', style: TextStyle(
                            fontSize: Dimensions.fontSizeDefault),
                        ),
                        Text('৳ 1200', style: TextStyle(
                            color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeLarge),
                        ),
                      ],
                    ))),
            InkWell(
              onTap: () {
               /// do go to check out page
                Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(
                  totalOrderAmount: 1200,shippingFee: 50, discount: 0, tax: 0, onlyDigital: true, )));
              },
              child: Container(width: MediaQuery.of(context).size.width/3.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                        vertical: Dimensions.fontSizeSmall),
                    child: Text('Checkout',
                        style: TextStyle(fontSize: Dimensions.fontSizeDefault,
                          color: Theme.of(context).cardColor,
                        )),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
