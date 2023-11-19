import 'package:flutter/material.dart';
import '../Screens/auth/auth_screen.dart';
import '../utill/dimensions.dart';
import '../utill/stored_images.dart';

class GuestDialog extends StatelessWidget {
  const GuestDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(clipBehavior: Clip.none, fit: StackFit.loose, children: [

        Positioned(
          left: 0, right: 0, top: -50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(Images.login, height: 80, width: 80),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text('THIS SECTION IS LOCK', style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Text('GOTO LOGIN SCREEN AND TRY AGAIN', textAlign: TextAlign.center, style: TextStyle(fontSize: Dimensions.fontSizeSmall)),
              const SizedBox(height: Dimensions.paddingSizeLarge),

              Divider(height: 0, color: Theme.of(context).hintColor),
              Row(children: [

                Expanded(child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
                    child: Text('CANCEL', style: TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                )),

                Expanded(child: InkWell(
                  onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  AuthScreen()), (route) => false),
                  child: Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10))),
                    child: Text('LOGIN', style: TextStyle(color: Colors.white)),
                  ),
                )),

              ]),
            ],
          ),
        ),

      ]),
    );
  }
}
