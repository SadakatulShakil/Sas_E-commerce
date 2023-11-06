import 'package:flutter/material.dart';

import '../../../helper/constant.dart';
import '../../home/dashboard_screen.dart';
import '../../../helper/text_from_field.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {

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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primarygreen),
            ),
            SizedBox(height: 20),
            // Add your sign-in form widgets here
            // For example, you can use TextFormField, ElevatedButton, etc.
            GetTextFormField(
              //onChangeText: dataProvider.updateTextFieldUsersEmail,
              //controller: emailController,
              hintName: "Email or Phone",
              inputType: TextInputType.emailAddress,
            ),
            GetTextFormField(
              hintName: 'Password',
              inputType: TextInputType.text,
              isObscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Forget password",
                    style: TextStyle(fontWeight: FontWeight.bold, color: greenshede0)),
              ),
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
            SizedBox(height: 20,),

            Align(
              alignment: Alignment.center,
                child: Text('Or')),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const DashBoardScreen()),
                        (route) => false);
              },
              child: Align(
                alignment: Alignment.center,
                child: Text("Continue as A Guest",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: greenshede0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
