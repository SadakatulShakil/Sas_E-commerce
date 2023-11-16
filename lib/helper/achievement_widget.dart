import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Models/category_model.dart';
import 'package:sas_ecommerce/helper/constant.dart';
import 'package:sas_ecommerce/helper/rating_bar.dart';

import '../utill/dimensions.dart';
import '../utill/stored_images.dart';

class AchievementWidget extends StatelessWidget {
  final Category productModel;
  const AchievementWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ratting = "0";

    return InkWell(
      onTap: () {
        // Navigator.push(context, PageRouteBuilder(
        //   transitionDuration: const Duration(milliseconds: 1000),
        //   pageBuilder: (context, anim1, anim2) => ProductDetails(productId: productModel.id,slug: productModel.slug),
        // ));
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.pinkAccent.withOpacity(0.2), spreadRadius: 1, blurRadius: 3)],
          ),
          child: Image.asset(productModel.imageAsset, fit: BoxFit.fill,)),
    );
  }
}
