import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utill/dimensions.dart';
import 'package:flutter/material.dart';
import '../../../utill/dimensions.dart';

class CustomCheckBox extends StatefulWidget {
  final int index;
  final bool isSelected;
  final String? icon;
  final Function(int) onSelected;

  const CustomCheckBox({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.onSelected,
    this.icon,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSelected(widget.index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? Theme.of(context).primaryColor.withOpacity(.5)
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
            boxShadow: [
              BoxShadow(
                color: widget.isSelected
                    ? Theme.of(context).hintColor.withOpacity(.2)
                    : Theme.of(context).hintColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: widget.isSelected,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool? isChecked) {
                  widget.onSelected(widget.index);
                },
              ),
              SizedBox(width: 80, child: Image.asset(widget.icon!)),
            ],
          ),
        ),
      ),
    );
  }
}


