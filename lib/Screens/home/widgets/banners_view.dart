import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utill/stored_images.dart';
class BannersView extends StatelessWidget {
  BannersView({Key? key}) : super(key: key);

  int currentIndex = 0;
  final List<String> mainBannerList = [
    'assets/images/banner1.png',
    'assets/images/banner2.jpg',
    'assets/images/banner3.png',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
      SizedBox(
      width: width,
      height: width * 0.4,
      child: mainBannerList != null ? mainBannerList!.isNotEmpty ?
      Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                // Provider.of<BannerProvider>(context, listen: false).setCurrentIndex(index);
              },
            ),
            itemCount: mainBannerList.isEmpty ? 1 : mainBannerList.length,
            itemBuilder: (context, index, _) {

              return InkWell(
                onTap: () {
                  // _clickBannerRedirect(context,
                  //     bannerProvider.mainBannerList![index].resourceId,
                  //     bannerProvider.mainBannerList![index].resourceType =='product'?
                  //     bannerProvider.mainBannerList![index].product : null,
                  //     bannerProvider.mainBannerList![index].resourceType);
                },
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: mainBannerList[index], fit: BoxFit.cover,
                      image: mainBannerList[index],
                      imageErrorBuilder: (c, o, s) => Image.asset(mainBannerList[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: mainBannerList.map((banner) {
                int index = mainBannerList.indexOf(banner);
                return TabPageSelectorIndicator(
                  backgroundColor: index == currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                  borderColor: index == currentIndex ? Theme.of(context).primaryColor : Colors.grey,
                  size: 10,
                );
              }).toList(),
            ),
          ),
        ],
      ) :
      const Center(child: Text('No banner available')) :
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: mainBannerList == null,
        child: Container(margin: const EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        )),
      ),
    ),

        const SizedBox(height: 5),
      ],
    );
  }


}

