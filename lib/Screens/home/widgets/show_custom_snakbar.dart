import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void showCustomSnackBar(String? message, BuildContext context, {bool isError = true, bool isToaster = false}) {
  if(isToaster){
    Get.snackbar(
      'Its a Toaster!',
      message??'',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.pinkAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
    );
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Text(message!),
    ));
  }

}
