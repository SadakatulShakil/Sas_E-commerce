import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';


class ProductTitleView extends StatelessWidget {
  const ProductTitleView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> colorList = [
      '#AABBCC',
      '#AACCBB',
      '#CCBBAA',
    ];
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [

          Expanded(child: Text('Mens Denim Jacket',
              style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w600),
              maxLines: 2)),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),


          Column(children: [
            Text('1200',
              style: TextStyle(color: Theme.of(context).hintColor,
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(height: Dimensions.paddingSizeExtraExtraSmall),


            Text('1300',
              style: TextStyle(color: Colors.red,
                  fontSize: Dimensions.fontSizeLarge),
            ),
          ],),
        ]),
        const SizedBox(height: Dimensions.paddingSizeDefault),

        Row(children: [
          Text('0 reviews | ',
              style: TextStyle(color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSizeDefault,)),

          Text('2 orders | ', style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: Dimensions.fontSizeDefault,
          )),

          Text('1 wish', style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: Dimensions.fontSizeDefault,
          )),

          const Expanded(child: SizedBox.shrink()),
          const SizedBox(width: 5),


          Row(children: [
            const Icon(Icons.star, color: Colors.orange,),
            Text('0.0')
          ],),

        ]),
        const SizedBox(height: Dimensions.paddingSizeSmall),

        Row( children: [
          Text('Select Variant: ',
              style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
          Expanded(
            child: SizedBox(height: 40,
              child: ListView.builder(
                itemCount: colorList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  String colorString = '0xff${colorList[index].substring(1, 7)}';
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    ),
                    child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                      child: Container(height: 30, width: 30,
                        padding: const EdgeInsets.all( Dimensions.paddingSizeExtraSmall),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Color(int.parse(colorString)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
        const SizedBox(),
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: productModel!.choiceOptions!.length,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (context, index) {
        //     return Row(crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text('${getTranslated('available', context)} ${productModel!.choiceOptions![index].title} :',
        //               style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
        //           const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        //           Expanded(
        //             child: Padding(
        //               padding: const EdgeInsets.all(2.0),
        //               child: GridView.builder(
        //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //                   crossAxisCount: 6,
        //                   crossAxisSpacing: 5,
        //                   mainAxisSpacing: 5,
        //                   childAspectRatio: (1 / .7),
        //                 ),
        //                 shrinkWrap: true,
        //                 physics: const NeverScrollableScrollPhysics(),
        //                 itemCount: productModel!.choiceOptions![index].options!.length,
        //                 itemBuilder: (context, i) {
        //                   return Container(
        //                     decoration: BoxDecoration(
        //                       border: Border.all(width: .3,color: Colors.grey),
        //                       borderRadius: BorderRadius.circular(5),
        //                     ),
        //                     child: Center(
        //                       child: Text(productModel!.choiceOptions![index].options![i].trim(), maxLines: 2,
        //                           overflow: TextOverflow.ellipsis, style: titilliumRegular.copyWith(
        //                             fontSize: Dimensions.fontSizeDefault,
        //                           )),
        //                     ),
        //                   );
        //                 },
        //               ),
        //             ),
        //           ),
        //         ]);
        //   },
        // )

      ])
    );
  }
}
