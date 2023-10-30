import 'package:flutter/material.dart';

import '../../../helper/constant.dart';

class SignUpWidget extends StatelessWidget {
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,  color: Colors.black),
            ),
            SizedBox(height: 20),
            // Add your sign-up form widgets here
            // For example, you can use TextFormField, ElevatedButton, etc.
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: greenshede0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenshede0), // Underline color when the field is focused
                ),// Cursor color
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password',
                labelStyle: TextStyle(color: greenshede0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenshede0), // Underline color when the field is focused
                ),),
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Confirm Password',
                labelStyle: TextStyle(color: greenshede0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenshede0), // Underline color when the field is focused
                ),),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                primary: lightgreenshede1, // Set the background color here
              ),
              child: Text('Sign Up',style: TextStyle(color: primarygreen)),
            ),
          ],
        ),
      ),
    );
  }
}