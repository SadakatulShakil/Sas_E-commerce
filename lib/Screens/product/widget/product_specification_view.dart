import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';


class ProductSpecification extends StatelessWidget {
  const ProductSpecification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
       Padding(
         padding: const EdgeInsets.only(left: 8.0),
         child: Align(
           alignment: Alignment.centerLeft,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Specification', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                 Text('Full View >', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.pink),),
               ],
             )),
       ),
        const SizedBox(height: Dimensions.paddingSizeLarge),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Expanded(
              child: Column(
                children: [
                  Text('1. Made from Home'),
                  Text('2. 100% non hyginic'),
                  Text('3. Easy return policy'),
                  Text('4. Pure test guranty'),
                ],
              )),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
      ],
    );
  }
}
