import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../helper/custom_button.dart';
import '../../helper/custom_password_textfield.dart';
import '../../helper/custom_textfield.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _fNameFocus = FocusNode();
  final FocusNode _lNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  File? file;
  final picker = ImagePicker();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void _choose() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  _updateUserAccount() async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String phoneNumber = _phoneController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    /// Do update functionality here
    print('Update button clicked');
    // if(Provider.of<ProfileProvider>(context, listen: false).userInfoModel!.fName == _firstNameController.text
    //     && Provider.of<ProfileProvider>(context, listen: false).userInfoModel!.lName == _lastNameController.text
    //     && Provider.of<ProfileProvider>(context, listen: false).userInfoModel!.phone == _phoneController.text && file == null
    //     && _passwordController.text.isEmpty && _confirmPasswordController.text.isEmpty) {
    //
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Change something to update'),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else if (firstName.isEmpty || lastName.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('NAME_FIELD_MUST_BE_REQUIRED', context)!),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else if (email.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)!),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else if (phoneNumber.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)!),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else if((password.isNotEmpty && password.length < 6)
    //     || (confirmPassword.isNotEmpty && confirmPassword.length < 6)) {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password should be at least 6 character'),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else if(password != confirmPassword) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)!),
    //       backgroundColor: ColorResources.red));
    // }
    //
    // else {
    //   UserInfoModel updateUserInfoModel = Provider.of<ProfileProvider>(context, listen: false).userInfoModel!;
    //   updateUserInfoModel.method = 'put';
    //   updateUserInfoModel.fName = _firstNameController.text;
    //   updateUserInfoModel.lName = _lastNameController.text;
    //   updateUserInfoModel.phone = _phoneController.text;
    //   String pass = _passwordController.text;
    //
    //   await Provider.of<ProfileProvider>(context, listen: false).updateUserInfo(
    //     updateUserInfoModel, pass, file, Provider.of<AuthProvider>(context, listen: false).getUserToken(),
    //   ).then((response) {
    //     if(response.isSuccess) {
    //       Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
    //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Updated Successfully'),
    //           backgroundColor: Colors.green));
    //       _passwordController.clear();
    //       _confirmPasswordController.clear();
    //       setState(() {});
    //     }else {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message!),
    //           backgroundColor: Colors.red));
    //     }
    //   });
    // }
  }



  @override
  Widget build(BuildContext context) {
        _firstNameController.text = 'Jhon Gulbar';
        _lastNameController.text = 'Dev Gulbar';
        _emailController.text = 'jhongulbar.dev@gamil.com';
        _phoneController.text = '01751330394';
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Image.asset(Images.toolbarBackground, fit: BoxFit.fill, height: 500,),
          ),

          Container(padding: const EdgeInsets.only(top: 35, left: 15),
            child: Row(children: [
              CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.white,),
              const SizedBox(width: 10),

              Text('Profile',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ]),
          ),

          Container(padding: const EdgeInsets.only(top: 55),
            child: Column(children: [
              Column(
                children: [
                  Container(margin: const EdgeInsets.only(top: Dimensions.marginSizeExtraLarge),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.white, width: 3),
                      shape: BoxShape.circle,),
                    child: Stack(clipBehavior: Clip.none,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(50),
                          child: file == null ?
                          FadeInImage.assetNetwork(
                            placeholder: Images.inspireImage, width: Dimensions.profileImageSize,
                            height: Dimensions.profileImageSize, fit: BoxFit.cover,
                            image: Images.inspireImage,
                            imageErrorBuilder: (c, o, s) => Image.asset(Images.inspireImage,
                                width: Dimensions.profileImageSize, height: Dimensions.profileImageSize, fit: BoxFit.cover),
                          ) :
                          Image.file(file!, width: Dimensions.profileImageSize,
                              height: Dimensions.profileImageSize, fit: BoxFit.fill),),
                        Positioned(bottom: 0, right: -10,
                          child: CircleAvatar(backgroundColor: lightgreenshede,
                            radius: 14,
                            child: IconButton(onPressed: _choose,
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.edit, color: Colors.white, size: 18),),),
                        ),
                      ],
                    ),
                  ),

                  Text('Jhon Gulbar',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),)
                ],
              ),

              const SizedBox(height: Dimensions.marginSizeDefault),


              Expanded(child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.marginSizeDefault),
                      topRight: Radius.circular(Dimensions.marginSizeDefault),)),
                child: ListView(physics: const BouncingScrollPhysics(),
                  children: [
                    Container(margin: const EdgeInsets.only(left: Dimensions.marginSizeDefault,
                        right: Dimensions.marginSizeDefault),
                      child: Row(children: [
                        Expanded(child: Column(
                          children: [Row(children: [
                            Icon(Icons.person, color: lightgreenshede, size: 20,),
                            const SizedBox(width: Dimensions.marginSizeExtraSmall),
                            Text('First Name')
                          ],
                          ),
                            const SizedBox(height: Dimensions.marginSizeSmall),

                            CustomTextField(textInputType: TextInputType.name,
                              focusNode: _fNameFocus,
                              nextNode: _lNameFocus,
                              hintText: 'Enter first name',
                              controller: _firstNameController,
                            ),
                          ],
                        )),
                        const SizedBox(width: Dimensions.paddingSizeDefault),

                        Expanded(child: Column(
                          children: [
                            Row(children: [
                              Icon(Icons.person, color: lightgreenshede, size: 20,),
                              const SizedBox(width: Dimensions.marginSizeExtraSmall),
                              Text('Last Name')
                            ],),
                            const SizedBox(height: Dimensions.marginSizeSmall),

                            CustomTextField(
                              textInputType: TextInputType.name,
                              focusNode: _lNameFocus,
                              nextNode: _emailFocus,
                              hintText: 'Enter last name',
                              controller: _lastNameController,
                            ),
                          ],
                        )),
                      ],
                      ),
                    ),



                    Container(margin: const EdgeInsets.only(
                        top: Dimensions.marginSizeDefault,
                        left: Dimensions.marginSizeDefault,
                        right: Dimensions.marginSizeDefault),
                      child: Column(children: [
                        Row(children: [Icon(Icons.alternate_email,
                            color: lightgreenshede, size: 20,),
                          const SizedBox(width: Dimensions.marginSizeExtraSmall,),
                          Text('Email')
                        ],
                        ),
                        const SizedBox(height: Dimensions.marginSizeSmall),

                        CustomTextField(textInputType: TextInputType.emailAddress,
                          focusNode: _emailFocus,
                          isEnable : false,
                          nextNode: _phoneFocus,
                          fillColor: Theme.of(context).hintColor.withOpacity(.12),
                          hintText: 'Enter email',
                          controller: _emailController,
                        ),
                      ],
                      ),
                    ),


                    Container(margin: const EdgeInsets.only(
                        top: Dimensions.marginSizeDefault,
                        left: Dimensions.marginSizeDefault,
                        right: Dimensions.marginSizeDefault),
                      child: Column(children: [
                        Row(children: [
                          Icon(Icons.dialpad, color: lightgreenshede, size: 20,),
                          const SizedBox(width: Dimensions.marginSizeExtraSmall),
                          Text('Phone No')
                        ],),
                        const SizedBox(height: Dimensions.marginSizeSmall),

                        CustomTextField(
                          textInputType: TextInputType.phone,
                          focusNode: _phoneFocus,
                          hintText: 'Enter phone no',
                          nextNode: _addressFocus,
                          controller: _phoneController,
                          isPhoneNumber: true,
                        ),],
                      ),
                    ),


                    Container(margin: const EdgeInsets.only(
                        top: Dimensions.marginSizeDefault,
                        left: Dimensions.marginSizeDefault,
                        right: Dimensions.marginSizeDefault),
                      child: Column(children: [
                        Row(children: [
                          Icon(Icons.lock_open, color: lightgreenshede, size: 20,),
                          const SizedBox(width: Dimensions.marginSizeExtraSmall),
                          Text('Password')
                        ],),
                        const SizedBox(height: Dimensions.marginSizeSmall),

                        CustomPasswordTextField(controller: _passwordController,
                          focusNode: _passwordFocus,
                          nextNode: _confirmPasswordFocus,
                          textInputAction: TextInputAction.next,
                        ),
                      ],),
                    ),


                    Container(margin: const EdgeInsets.only(
                        top: Dimensions.marginSizeDefault,
                        left: Dimensions.marginSizeDefault,
                        right: Dimensions.marginSizeDefault),
                      child: Column(children: [
                        Row(
                          children: [
                            Icon(Icons.lock_open, color: lightgreenshede, size: 20,),
                            const SizedBox(width: Dimensions.marginSizeExtraSmall),
                            Text('Re-enter Password')
                          ],),
                        const SizedBox(height: Dimensions.marginSizeSmall),


                        CustomPasswordTextField(controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocus,
                          textInputAction: TextInputAction.done,
                        ),


                        const SizedBox(height: Dimensions.paddingSizeLarge),


                      ],),
                    ),
                  ],
                ),
              ),
              ),
              Container(margin: const EdgeInsets.symmetric(horizontal: Dimensions.marginSizeLarge,
                  vertical: Dimensions.marginSizeSmall),
                child: CustomButton(onTap: _updateUserAccount, buttonText: 'Update Account')
              ),
            ],
            ),
          ),
        ],
      )
    );
  }
}
