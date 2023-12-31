import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utill/dimensions.dart';
import '../utill/stored_images.dart';
import 'constant.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final Function? icon;
  final Function? onTap;
  final Duration? eventDuration;
  final bool? isDetailsPage;
  final bool isFlash;
  const TitleRow({Key? key, required this.title,this.icon, this.onTap, this.eventDuration, this.isDetailsPage, this.isFlash = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? days, hours, minutes, seconds;
    if (eventDuration != null) {
      days = eventDuration!.inDays;
      hours = eventDuration!.inHours - days * 24;
      minutes = eventDuration!.inMinutes - (24 * days * 60) - (hours * 60);
      seconds = eventDuration!.inSeconds - (24 * days * 60 * 60) - (hours * 60 * 60) - (minutes * 60);
    }

    return Container(
      decoration: isFlash? BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
        color: Theme.of(context).primaryColor.withOpacity(.05),
      ):null,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFlash?
            Padding(
              padding: isFlash?  const EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall):const EdgeInsets.all(0),
              child: Image.asset(Images.flashDeal, scale: 4,),
            ):const SizedBox(),
            Text(title!, style: TextStyle(fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w600, color: primaryColor)),
            const Spacer(),
            eventDuration == null
                ? const Expanded(child: SizedBox.shrink())
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
              child: Row(children: [
                const SizedBox(width: 5),
                TimerBox(time: days, day: 'day',),
                Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
                TimerBox(time: hours, day: 'hour'),
                Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
                TimerBox(time: minutes, day: 'min'),
                Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
                TimerBox(time: seconds,day: 'sec'),
                const SizedBox(width: 5),
              ]),
            ),

            const Spacer(),
            icon != null
                ? InkWell(
                onTap: icon as void Function()?,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:  SvgPicture.asset(
                    Images.filterImage,
                    height: Dimensions.iconSizeDefault,
                    width: Dimensions.iconSizeDefault,
                    color: primaryColor,
                  ),
                )
            )
                : const SizedBox.shrink(),

            onTap != null && isFlash?
            InkWell(
              onTap: onTap as void Function()?,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/8,height: MediaQuery.of(context).size.width/6.5,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
                            bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall)),
                        color: Theme.of(context).primaryColor.withOpacity(.3)
                    ),
                  ),
                  Positioned(left: 12,right: 12,top: 18,bottom: 18,
                    child: Container(
                        width: 20,height: 20,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(25)),
                            color: Theme.of(context).primaryColor
                        ),
                        child: Icon(Icons.arrow_forward_outlined, size: 15, color: Theme.of(context).cardColor,)),
                  ),
                ],
              ),
            ) :onTap != null && !isFlash ?
            InkWell(
              onTap: onTap as void Function()?,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isDetailsPage == null
                        ? Text('View All',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: Dimensions.fontSizeDefault,
                        ))
                        : const SizedBox.shrink(),
                    Icon(Icons.arrow_forward_outlined,
                      color: isDetailsPage == null ? Colors.redAccent : Theme.of(context).hintColor,
                      size: Dimensions.fontSizeDefault,
                    ),
                  ]),
            ):
            const SizedBox.shrink(),
          ]),
    );
  }
}

class TimerBox extends StatelessWidget {
  final int? time;
  final bool isBorder;
  final String? day;

  const TimerBox({Key? key, required this.time, this.isBorder = false, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/9.5,height: MediaQuery.of(context).size.width/9.5,
      decoration: BoxDecoration(
        color: isBorder ? null : primaryColor,
        border: isBorder ? Border.all(width: 2, color: primaryColor) : null,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(time! < 10 ? '0$time' : time.toString(),
              style: TextStyle(
                color: isBorder ? primaryColor : Theme.of(context).highlightColor,
                fontSize: Dimensions.fontSizeSmall,
              ),
            ),
            Text(day!, style: TextStyle(color: isBorder ?
            primaryColor : Theme.of(context).highlightColor,
              fontSize: Dimensions.fontSizeSmall,)),
          ],
        ),
      ),
    );
  }
}
