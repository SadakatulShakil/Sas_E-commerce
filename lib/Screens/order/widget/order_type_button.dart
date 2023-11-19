import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderTypeButton extends StatelessWidget {
  final String? text;
  final int index;

  const OrderTypeButton({Key? key, required this.text, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Expanded(
      child: TextButton(
        onPressed: () {
          ///order Details Task
        selectedIndex = index;
        },
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selectedIndex == index ? Theme.of(context).primaryColor : Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('${text!}(0)',
              style: TextStyle(color: selectedIndex == index
                  ? Colors.white : Theme.of(context).primaryColor)),
        ),
      ),
    );
  }
}