import 'package:flutter/material.dart';

import '../../../helper/constant.dart';
import '../common/text_from_field.dart';

class SignInWidget extends StatelessWidget {
  bool _isPasswordVisible = false;
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
              'Sign In,',
              style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold, color: primarygreen),
            ),
            SizedBox(height: 20),
            // Add your sign-in form widgets here
            // For example, you can use TextFormField, ElevatedButton, etc.
            GetTextFormField(
              //onChangeText: dataProvider.updateTextFieldUsersEmail,
              //controller: emailController,
              hintName: "Email",
            ),
            GetTextFormField(
              hintName: 'Password',
              isPasswordVisible: _isPasswordVisible,
              isObscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                primary: lightgreenshede1, // Set the background color here
              ),
              child: Text('Sign In',style: TextStyle(color: primarygreen)),
            ),
          ],
        ),
      ),
    );
  }
}