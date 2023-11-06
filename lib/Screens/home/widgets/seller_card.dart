import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/Models/topseller_model.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
class SellerCard extends StatefulWidget {
  final TopSeller sellerModel;
  const SellerCard({Key? key, required this.sellerModel}) : super(key: key);

  @override
  State<SellerCard> createState() => _SellerCardState();
}

class _SellerCardState extends State<SellerCard> {
  bool vacationIsOn = false;
  @override
  Widget build(BuildContext context) {

    // if(widget.sellerModel!.vacationEndDate != null){
    //   DateTime vacationDate = DateTime.parse(widget.sellerModel!.vacationEndDate!);
    //   DateTime vacationStartDate = DateTime.parse(widget.sellerModel!.vacationStartDate!);
    //   final today = DateTime.now();
    //   final difference = vacationDate.difference(today).inDays;
    //   final startDate = vacationStartDate.difference(today).inDays;
    //
    //   if(difference >= 0 && widget.sellerModel!.vacationStatus == 1 && startDate <= 0){
    //     vacationIsOn = true;
    //   }
    //
    //   else{
    //     vacationIsOn = false;
    //   }
    //   if (kDebugMode) {
    //     print('------=>${widget.sellerModel!.name}${widget.sellerModel!.vacationEndDate}/${widget.sellerModel!.vacationStartDate}${vacationIsOn.toString()}/${difference.toString()}/${startDate.toString()}');
    //   }
    //
    // }


    return InkWell(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (_) => TopSellerProductScreen(topSeller: widget.sellerModel)));
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
                    color: Theme.of(context).highlightColor,

                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: widget.sellerModel.imageAsset,
                      image: widget.sellerModel.imageAsset,
                      imageErrorBuilder: (c, o, s) => Image.asset(widget.sellerModel.imageAsset, fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // if(widget.sellerModel.temporaryClose == 1  || vacationIsOn)
          //   Container(
          //     decoration: BoxDecoration(
          //       color: Colors.black.withOpacity(.5),
          //       borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
          //     ),
          //   ),
          //
          // widget.sellerModel!.temporaryClose ==1?
          //   Center(child: Text(getTranslated('temporary_closed', context)!, textAlign: TextAlign.center,
          //     style: robotoRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),)):
          // vacationIsOn?
          // Center(child: Text(getTranslated('close_for_now', context)!, textAlign: TextAlign.center,
          //   style: robotoRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),)):
          const SizedBox()
        ],
      ),
    );
  }
}
