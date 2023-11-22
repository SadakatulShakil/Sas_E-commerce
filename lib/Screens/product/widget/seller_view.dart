import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';

class SellerView extends StatelessWidget {
  const SellerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sellerIconSize = 50;
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      color: Theme.of(context).cardColor,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: sellerIconSize,height: sellerIconSize,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sellerIconSize),
                border: Border.all(width: .5,color: Theme.of(context).hintColor)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(sellerIconSize),
              child: FadeInImage.assetNetwork(fit: BoxFit.cover,
                placeholder: Images.inspireImage, height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                image: Images.inspireImage,
                imageErrorBuilder: (c, o, s) => Image.asset(
                  Images.inspireImage, height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,fit: BoxFit.cover,
                ),
              ),
            ),

          ),
          const SizedBox(width: Dimensions.paddingSizeSmall,),

          Expanded(
            child: Column(children: [
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      /// tap to go seller page
                    },
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Fatema',
                          style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                        ),

                        Text('Fatema Majumdar',
                          style: TextStyle(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// do share task here
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    child: Container(width: 30, height: 30,
                      decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.share, color: Theme.of(context).cardColor, size: Dimensions.iconSizeSmall),
                    ),
                  ),
                )
              ]),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
              Row(
                  children: [
                Column(children: [
                  Text('1',
                    style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w600),),
                  Text('Reviews',
                    style: TextStyle(color: Theme.of(context).hintColor),),
                ],),
                const SizedBox(width: Dimensions.paddingSizeExtraLarge),

                Column(children: [
                  Text('10',
                    style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w600),),
                  Text('Products',
                    style: TextStyle(color: Theme.of(context).hintColor),),

                ],),
                const Spacer(),

                InkWell(
                  onTap: (){
                    /// Do visit store task here
                  },
                  child: Container(
                    width: 100,height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraLarge)
                    ),
                    child: Center(child: Text('Visit Store',
                      style: TextStyle(color: Theme.of(context).primaryColor),)),
                  ),
                )
              ]
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
