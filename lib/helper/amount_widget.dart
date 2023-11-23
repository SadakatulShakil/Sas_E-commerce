import 'package:flutter/material.dart';

import '../utill/dimensions.dart';

class AmountWidget extends StatelessWidget {
  final String? title;
  final String amount;

  const AmountWidget({Key? key, required this.title, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title!, style: TextStyle(fontSize: Dimensions.fontSizeDefault)),
        Text(amount, style: TextStyle(fontSize: Dimensions.fontSizeDefault)),
      ]),
    );
  }
}
