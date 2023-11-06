import 'package:flutter/material.dart';

import '../../../Models/category_model.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/stored_images.dart';
class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        height: MediaQuery.of(context).size.width/5,
        width: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: Theme.of(context).highlightColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: category.imageAsset,
            image: category.imageAsset,
            imageErrorBuilder: (c, o, s) => Image.asset(category.imageAsset, fit: BoxFit.cover,),
          ),
        ),
      ),

      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
      Center(
        child: Text(category.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: Dimensions.fontSizeSmall,
              color: Colors.black),
        ),
      ),

    ]);
  }
}
