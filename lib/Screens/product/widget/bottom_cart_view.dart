import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
import '../../cart/cart_screen.dart';
import '../../home/widgets/show_custom_snakbar.dart';
import 'cart_bottom_sheet.dart';

class BottomCartView extends StatefulWidget {

  const BottomCartView({Key? key}) : super(key: key);

  @override
  State<BottomCartView> createState() => _BottomCartViewState();
}

class _BottomCartViewState extends State<BottomCartView> {
  bool vacationIsOn = false;
  bool temporaryClose = false;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: [BoxShadow(color: Theme.of(context).hintColor, blurRadius: .5, spreadRadius: .1)],
      ),
      child: Row(children: [
        Expanded(flex: 3, child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
          child: Stack(children: [
            GestureDetector(
                onTap: (){
                  /// go to cart Screen
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>const CartScreen()
                  ));
                },
                child: Image.asset(Images.cartArrowDownImage, color: primaryColor)),
            Positioned(
              top: 5,
              right: 10,
              child: Container(
                height: 17,
                width: 17,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text('0',
                  style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, color:Colors.white),
                ),
              ),
            )
          ]),
        )),

        Expanded(flex: 11, child: InkWell(
          onTap: () {
              showModalBottomSheet(context: context, isScrollControlled: true,
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(.5),
                  builder: (con) => CartBottomSheet(callback: (){
                    showCustomSnackBar('Add to Cart', context, isError: false);
                  },));


          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: accentShade,
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: Dimensions.fontSizeLarge, color: Colors.white),
            ),
          ),
        )),
      ]),
    );
  }
}
