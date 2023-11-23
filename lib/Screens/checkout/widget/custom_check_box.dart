import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utill/dimensions.dart';

class CustomCheckBox extends StatefulWidget {
  final int index;
  final bool isDigital;
  final String? icon;

  const CustomCheckBox({Key? key, required this.index, this.isDigital = false, this.icon}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  int paymentMethodIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///set Order payment type
        setState(() {
          // Update the payment method index here
          paymentMethodIndex = widget.index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
              color: paymentMethodIndex == widget.index
                  ? Theme.of(context).primaryColor.withOpacity(.5)
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
              boxShadow: [
                BoxShadow(
                    color: paymentMethodIndex == widget.index
                        ? Theme.of(context).hintColor.withOpacity(.2)
                        : Theme.of(context).hintColor.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1))
              ]),
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: paymentMethodIndex == widget.index,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool? isChecked) {
                  setState(() {
                    // Update the payment method index here
                    paymentMethodIndex = widget.index;
                  });
                  // Call your method to set Order payment type here
                },
              ),
              SizedBox(width: 100, child: Image.asset(widget.icon!)),
            ],
          ),
        ),
      ),
    );
  }
}
