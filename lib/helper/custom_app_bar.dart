import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utill/dimensions.dart';
import '../utill/stored_images.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool isBackButtonExist;
  final IconData? icon;
  final Function? onActionPressed;
  final Function? onBackPressed;

  const CustomAppBar({Key? key, required this.title, this.isBackButtonExist = true, this.icon, this.onActionPressed, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: 50,
        alignment: Alignment.center,
        child: Row(children: [

          isBackButtonExist ? IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20,
                color: Colors.black),
            onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.of(context).pop(),
          ) : const SizedBox.shrink(),
          const SizedBox(width: Dimensions.paddingSizeSmall),

          Expanded(
            child: Text(
              title!, style: TextStyle(fontSize: 20,
              color: Colors.black,),
              maxLines: 1, overflow: TextOverflow.ellipsis,
            ),
          ),

          icon != null ? IconButton(
            icon: Icon(icon, size: Dimensions.iconSizeLarge, color: Colors.white),
            onPressed: onActionPressed as void Function()?,
          ) : const SizedBox.shrink(),

        ]),
      ),
    ]);
  }
}
