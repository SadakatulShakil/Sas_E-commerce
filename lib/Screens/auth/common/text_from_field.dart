import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helper/constant.dart';

class GetTextFormField extends StatelessWidget {
  TextEditingController? controller;
  String? hintName;
  IconData? icon;
  bool isObscureText;
  bool isPasswordVisible;
  TextInputType inputType;
  Function(String)? onChangeText;


  GetTextFormField({
    this.controller,
    this.hintName,
    this.icon,
    this.isObscureText = false,
    this.isPasswordVisible = false,
    this.inputType = TextInputType.text,
    this.onChangeText,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        //fdfdf height: 7.h,
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color of the Container
          borderRadius:
          BorderRadius.circular(5), // Set the circular border radius
          border: Border.all(
            color: Colors.white, // Border color
            width: 2, // Border width
          ),
        ),
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
          ],
          controller: controller,
          obscureText: isObscureText,
          keyboardType: inputType,
          onChanged: onChangeText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hintName';
            }
            if (hintName == "Email" && !validateEmail(value)) {
              return 'Please Enter Valid Email';
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {

              },
            ),
              labelStyle: TextStyle(color: greenshede0),
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            hintText: hintName,
            labelText: hintName,
          ),
        ),
      ),
    );
  }
}

validateEmail(String email) {
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}
