import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sas_ecommerce/Models/address_model.dart';
import 'package:sas_ecommerce/Screens/address/address_list_screen.dart';
import 'package:sas_ecommerce/Screens/address/widget/address_label_button.dart';

import '../../helper/custom_app_bar.dart';
import '../../helper/custom_button.dart';
import '../../helper/local_database/database_helper.dart';
import '../../helper/text_from_field.dart';
import '../../utill/dimensions.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedIndex = 0;
  final TextEditingController _contactPersonNameController =
      TextEditingController();
  final TextEditingController _contactPersonNumberController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _addressNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _numberNode = FocusNode();
  final FocusNode _cityNode = FocusNode();
  final FocusNode _zipNode = FocusNode();
  final FocusNode _countryNode = FocusNode();
  String selectedLabelValue = 'Shipping Address';

 _addUserAddress(
      int selectedIndex,
      String selectedLabelValue,
      String address,
      String city,
      String zip,
      String country,
      String contactPerson,
      String contactNumber
      ) async {

    String? label;
          selectedIndex == 0?
          label = 'Home':selectedIndex == 1?
          label = 'Work':label = 'Other';

          //print('kkkkkdebug: '+label+'--'+selectedLabelValue+'--'+address+'--'+city+'--'+zip+'--'+country+'--'+contactPerson+'--'+contactNumber);
    final addressData = AddressDataModel(
        id: null,
        username: 'guest',
        label: label,
        type: selectedLabelValue,
        delivery_address: address,
        city: city,
        zip_code: zip,
        country: country,
        contact_person: contactPerson,
        contact_no: contactNumber,
    );
    //print('datadebug: '+addressData.toString());

    await DatabaseHelper.instance.insertUserData('guest', addressData);
    Get.snackbar(
      "Success!",
      "Address stored successfully!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.pinkAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Add new Address', isBackButtonExist: true),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelButton(
                    text: "Home",
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  CustomLabelButton(
                    text: "Office",
                    isSelected: selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  CustomLabelButton(
                    text: "Others",
                    isSelected: selectedIndex == 2,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Shipping Address',
                      groupValue: selectedLabelValue,
                      onChanged: (value) {
                        setState(() {
                          selectedLabelValue = value??'null';
                          print(selectedLabelValue);
                        });
                      },
                    ),
                    Text('Shipping Address'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Billing Address',
                      groupValue: selectedLabelValue,
                      onChanged: (value) {
                        setState(() {
                          selectedLabelValue = value??'null';
                          print(selectedLabelValue);
                        });
                      },
                    ),
                    Text('Billing Address'),
                  ],
                ),
              ],
            ),
            GetTextFormField(
              controller: _addressController,
              node: _addressNode,
              hintName: "Delivery Address",
              inputType: TextInputType.text,
            ),
            GetTextFormField(
              controller: _cityController,
              node: _cityNode,
              hintName: "City",
              inputType: TextInputType.text,
            ),
            GetTextFormField(
              controller: _zipCodeController,
              node: _zipNode,
              hintName: "Zip",
              inputType: TextInputType.text,
            ),
            GetTextFormField(
              controller: _countryController,
              node: _countryNode,
              hintName: "Country",
              inputType: TextInputType.text,
            ),
            GetTextFormField(
              controller: _contactPersonNameController,
              node: _nameNode,
              hintName: "Contact person",
              inputType: TextInputType.text,
            ),
            GetTextFormField(
              controller: _contactPersonNumberController,
              node: _numberNode,
              hintName: "Contact number",
              inputType: TextInputType.number,
            ),
            Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeLarge,
                    vertical: Dimensions.marginSizeSmall),
                child: CustomButton(
                    onTap: (){
                      _addUserAddress(
                          selectedIndex,
                          selectedLabelValue,
                          _addressController.text,
                          _cityController.text,
                          _zipCodeController.text,
                          _countryController.text,
                          _contactPersonNameController.text,
                          _contactPersonNumberController.text
                      );
                      selectedIndex = 0;
                      selectedLabelValue = 'Shipping Address';
                      _addressController.text = '';
                      _cityController.text = '';
                      _zipCodeController.text = '';
                      _countryController.text = '';
                      _contactPersonNameController.text = '';
                      _contactPersonNumberController.text ='';
                    },
                    buttonText: 'Add Address')),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(String label, String value,
      {required ValueChanged<String?> onChanged}) {
    return Row(
      children: [
        Radio<String>(
          value: '',
          groupValue: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    );
  }
}
