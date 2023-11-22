import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';

class PromiseScreen extends StatelessWidget {
  const PromiseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width/8.5;
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Expanded(child: Column(children: [
        SizedBox(width: width, child: Image.asset(Images.sevenDayEasyReturn),),
          Text('7 Days Return Policy',maxLines: 2,
            overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),],),
      ),
      const SizedBox(width: Dimensions.paddingSizeDefault,),

        Expanded(child: Column(children: [
          SizedBox(width: width, child: Image.asset(Images.safePayment),),
          Text('Safe Payment',
              maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),],),
      ),
      const SizedBox(width: Dimensions.paddingSizeDefault,),


        Expanded(child: Column(children: [
          SizedBox(width: width, child: Image.asset(Images.hundredParAuthentic),),
          Text('100% Authentic Products',
            maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),],),
        ),
    ],);
  }
}
