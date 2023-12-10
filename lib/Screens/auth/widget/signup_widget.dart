import 'package:flutter/material.dart';

import '../../../helper/constant.dart';
import '../../../helper/text_from_field.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Text(
              'Sign Up,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GetTextFormField(
                    hintName: "First name",
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GetTextFormField(
                    hintName: "Last name",
                    inputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            GetTextFormField(
              hintName: "Email",
              inputType: TextInputType.emailAddress,
            ),
            GetTextFormField(
              hintName: "Phone",
              inputType: TextInputType.phone,
            ),
            GetTextFormField(
              hintName: 'Password',
              inputType: TextInputType.text,
              isObscureText: true,
            ),
            GetTextFormField(
              hintName: 'Confirm Password',
              inputType: TextInputType.text,
              isObscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-up logic here
              },
              style: ElevatedButton.styleFrom(
                primary: accentLight,
              ),
              child: Text('Sign Up', style: TextStyle(color: primaryColor)),
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: (){

              },
              child: Align(
                alignment: Alignment.center,
                child: Text("Skip for Now  ->",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: accent)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
