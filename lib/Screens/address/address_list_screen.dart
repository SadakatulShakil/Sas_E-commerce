import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Models/address_model.dart';
import 'package:sas_ecommerce/Screens/address/address_screen.dart';
import 'package:sas_ecommerce/helper/local_database/database_helper.dart';

import '../../helper/custom_app_bar.dart';
import '../../helper/show_custom_modal_dialog.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class AddressListScreen extends StatefulWidget {

  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<AddressDataModel> _addressDataList = [];

  @override
  void initState() {
    super.initState();
    _loadLocalUserData();
  }

  Future<void> _loadLocalUserData() async {
    final addresses = await DatabaseHelper.instance.getAllUserDataByUsername('guest');
    setState(() {
      _addressDataList = addresses.reversed.where((element) => element.username == 'guest').toList();
      print("data_from_local: " + _addressDataList[2].label.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          CustomAppBar(title: 'Address List', isBackButtonExist: true),
          _addressDataList.length>0?
          Expanded(
            child: ListView.builder(
              itemCount: _addressDataList.length,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:() {

                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                    color: Theme.of(context).cardColor,
                    child: ListTile(
                      leading: ClipOval(child: FadeInImage.assetNetwork(
                        placeholder: _addressDataList[index].label == 'Home'?Images.home:_addressDataList[index].label == 'Work'?Images.office:Images.other, height: 50, width: 50, fit: BoxFit.cover,
                        image: _addressDataList[index].label == 'Home'?Images.home:_addressDataList[index].label == 'Work'?Images.office:Images.other,
                        imageErrorBuilder: (c, o, s) => Image.asset(_addressDataList[index].label == 'Home'?Images.home:_addressDataList[index].label == 'Work'?Images.office:Images.other, height: 50, width: 50, fit: BoxFit.cover),
                      )),
                      title: Text('Address: '+_addressDataList[index].delivery_address, style: TextStyle(
                        fontSize: Dimensions.fontSizeLarge,
                      )),
                      subtitle: Text(('City: '+_addressDataList[index].city+'  '+'Zip Code: '+ _addressDataList[index].zip_code),
                        style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: Colors.blueGrey.shade200),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text((_addressDataList[index].type),
                              style: TextStyle(fontSize: Dimensions.fontSizeExtraSmall, color: Colors.green),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              showCustomModalDialog(
                                context,
                                title: 'Remove Address',
                                content: _addressDataList[index].delivery_address,
                                cancelButtonText: 'Cancel',
                                submitButtonText: 'Remove',
                                submitOnPressed: () async{
                                  _addressDataList.remove(_addressDataList[index]);
                                  await DatabaseHelper.instance.deleteData(_addressDataList[index].id??0);
                                  Navigator.of(context).pop();
                                  setState(() {

                                  });
                                },
                                cancelOnPressed: () => Navigator.of(context).pop(),
                              );
                            },
                              child: Icon(Icons.delete, color: Colors.red,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ): Column(
            children: [
          Image.asset(Images.noData, height: 100, width: 100,),
          Text('No data Found'),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
