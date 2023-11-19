import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/Screens/about_us/about_us_screen.dart';
import 'package:sas_ecommerce/Screens/address/address_screen.dart';
import 'package:sas_ecommerce/Screens/community/community_screen.dart';
import 'package:sas_ecommerce/Screens/contact_us/contactr_us_screen.dart';
import 'package:sas_ecommerce/Screens/faq/faq_screen.dart';
import 'package:sas_ecommerce/Screens/more/widget/sign_out_confirmation_dialog.dart';
import 'package:sas_ecommerce/Screens/privacy_policy/privacy_screen.dart';
import 'package:sas_ecommerce/Screens/refund%20policy/refund_screen.dart';
import 'package:sas_ecommerce/Screens/settings/settings_screen.dart';
import 'package:sas_ecommerce/Screens/terms_and_condition/terms_screen.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../helper/animated_custom_dialog.dart';
import '../../helper/guest_dialog.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';
import '../profile/profile_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool isGuestMode = false;
  String? version;
  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(children: [
        Positioned(top: 0, left: 0, right: 0,
          child: Image.asset(Images.morePageHeader,
            height: 180, fit: BoxFit.fill,
            color: lightgreenshede1,
          ),
        ),


        Positioned(top: 25, left: Dimensions.paddingSizeSmall,
          right: Dimensions.paddingSizeSmall,
          child: Row(
              children: [
            Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
              child: Image.asset(Images.logoWithNameImageWhite, height: 35),
            ),
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: InkWell(
                onTap: () {
                  if(isGuestMode) {
                    showAnimatedDialog(context, const GuestDialog(), isFlip: true);
                  }else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    // if(Provider.of<ProfileProvider>(context, listen: false).userInfoModel != null) {
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                    // }
                  }
                },
                child: Row(children: [
                  Text('Jhon Gulbar', style: TextStyle(color: Colors.white,),),
                  const SizedBox(width: Dimensions.paddingSizeSmall),


                  isGuestMode ? const CircleAvatar(child: Icon(Icons.person, size: 35)) :
                  CircleAvatar(child: Icon(Icons.person, size: 35))
                ]),
              ),
            ),
          ])
        ),


        Container(
          margin: const EdgeInsets.only(top: 140),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  // Top Row Items
                  SizedBox(height: MediaQuery.of(context).size.width/3.6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
                          Expanded(
                            child: ListView(scrollDirection:Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  SquareButton(image: Images.aboutUs, title: 'Community',
                                      navigateTo: const CommunityScreen(),count: 1,hasCount: false),

                                  SquareButton(image: Images.blog, title: 'Blog',
                                      navigateTo: const CommunityScreen(),count: 1,hasCount: false),

                                  SquareButton(image: Images.offers, title: 'Offers',
                                      navigateTo: const CommunityScreen(),count: 1,hasCount: false),

                                  SquareButton(image: Images.wishlist, title: 'Wishlist',
                                      navigateTo: const CommunityScreen(),count: 1,hasCount: false)
                                ]),
                          ),
                          Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColor,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),


                  // Buttons
                  TitleButton(image: Images.address, title: 'Address',
                      navigateTo: const AddressScreen()),

                  TitleButton(image: Images.settings, title: 'Settings',
                      navigateTo: const SettingsScreen()),

                  TitleButton(image: Images.termCondition, title: 'Terms & Condition',
                      navigateTo: const TermsAndConditionScreen()),

                  TitleButton(image: Images.privacyPolicy, title: 'Privacy Plolicy',
                      navigateTo: const PrivacyPolicyScreen()),

                  TitleButton(image: Images.refundPolicy, title: 'Refund Policy',
                      navigateTo: const RefundPolicyScreen()),

                  TitleButton(image: Images.helpCenter, title: 'FAQ',
                      navigateTo: const FaqScreen()),

                  TitleButton(image: Images.aboutUs, title: 'About Us',
                      navigateTo: const AboutUsScreen()),

                  TitleButton(image: Images.contactUs, title: 'Contact Us',
                      navigateTo: const ContactUsScreen()),

                  ListTile(
                    leading: Image.asset(Images.logoWithImage, width: 25, height: 25, fit: BoxFit.fill,),
                    title: Text('App Info',
                        style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                    trailing: const Text('1.0.0'),
                  ),

                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: primarygreen, size: 25,),
                    title: Text('Sign Out',
                        style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
                    onTap: () => showAnimatedDialog(context, const SignOutConfirmationDialog(), isFlip: true),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }
}


class SquareButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  final int count;
  final bool hasCount;


  const SquareButton({Key? key, required this.image, required this.title, required this.navigateTo, required this.count, required this.hasCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => navigateTo)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width / 4,
            height: width / 4,
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: lightgreenshede1,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(image, color: Colors.white),
                hasCount?
                Positioned(top: -4, right: -4,
                  child: CircleAvatar(radius: 7, backgroundColor: Colors.white,
                    child: Text(count.toString(),
                        style: TextStyle(color: Theme.of(context).cardColor,
                          fontSize: Dimensions.fontSizeExtraSmall,
                        )),
                  )
                ):const SizedBox(),
              ],
            ),
          ),
        ),
        Flexible(
          child: Text(title!, maxLines: 1,overflow: TextOverflow.clip,
              style: TextStyle(fontSize: Dimensions.fontSizeDefault, color: primarygreen, fontWeight: FontWeight.w600)),
        ),
      ]),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String? title;
  final Widget navigateTo;
  const TitleButton({Key? key, required this.image, required this.title, required this.navigateTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 25, height: 25, fit: BoxFit.fill),
      title: Text(title!, style: TextStyle(fontSize: Dimensions.fontSizeLarge)),
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => navigateTo),
      ),
    );
  }
}

