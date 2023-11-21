import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant.dart';

class GetTextFormField extends StatefulWidget {
  TextEditingController? controller;
  FocusNode? node;
  String? hintName;
  IconData? icon;
  bool isObscureText;
  TextInputType inputType;
  Function(String)? onChangeText;

  GetTextFormField({
    this.controller,
    this.node,
    this.hintName,
    this.icon,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.onChangeText,
  });

  @override
  _GetTextFormFieldState createState() => _GetTextFormFieldState();
}

class _GetTextFormFieldState extends State<GetTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.node,
          obscureText: widget.isObscureText,
          keyboardType: widget.inputType,
          onChanged: widget.onChangeText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.hintName}';
            }
            if (widget.hintName == "Email" && !validateEmail(value)) {
              return 'Please Enter Valid Email';
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: Visibility(
              visible: widget.hintName == 'Password' || widget.hintName == 'Confirm Password' ? true : false,
              child: IconButton(
                icon: Icon(
                  !widget.isObscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    widget.isObscureText = !widget.isObscureText;
                  });
                },
              ),
            ),
            labelStyle: TextStyle(color: greenshede0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: greenshede0),
            ),
            hintText: widget.hintName,
            labelText: widget.hintName,
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
