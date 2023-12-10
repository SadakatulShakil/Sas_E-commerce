import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Screens/checkout/checkout_success_screen.dart';
import 'package:sas_ecommerce/Screens/checkout/widget/custom_check_box.dart';
import 'package:sas_ecommerce/Screens/checkout/widget/order_list_widget.dart';
import 'package:sas_ecommerce/helper/constant.dart';

import '../../helper/amount_widget.dart';
import '../../helper/custom_app_bar.dart';
import '../../helper/custom_textfield.dart';
import '../../utill/dimensions.dart';
import '../../utill/stored_images.dart';

class CheckoutScreen extends StatefulWidget {
  //final List<CartModel> cartList;
  final bool fromProductDetails;
  final double totalOrderAmount;
  final double shippingFee;
  final double discount;
  final double tax;
  final int? sellerId;
  final bool onlyDigital;

  const CheckoutScreen(
      {Key? key,
      this.fromProductDetails = false,
      required this.discount,
      required this.tax,
      required this.totalOrderAmount,
      required this.shippingFee,
      this.sellerId,
      this.onlyDigital = false})
      : super(key: key);

  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _orderNoteController = TextEditingController();
  final FocusNode _orderNoteNode = FocusNode();
  double _order = 0;
  bool _digitalPayment = true;
  bool _cod = true;
  bool _billingAddress = true;
  double? _couponDiscount;
  int selectedPaymentMethodIndex = 0;

  TextEditingController paymentByController = TextEditingController();
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController paymentNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<ProfileProvider>(context, listen: false).initAddressList();
    // Provider.of<ProfileProvider>(context, listen: false).initAddressTypeList(context);
    // Provider.of<CouponProvider>(context, listen: false).removePrevCouponData();
    // Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    // Provider.of<CartProvider>(context, listen: false).getChosenShippingMethod(context);
    // _digitalPayment = Provider.of<SplashProvider>(context, listen: false).configModel!.digitalPayment;
    // _cod = Provider.of<SplashProvider>(context, listen: false).configModel!.cod;
    // _billingAddress = Provider.of<SplashProvider>(context, listen: false).configModel!.billingAddress == 1;
  }

  @override
  Widget build(BuildContext context) {
    _order = widget.totalOrderAmount + widget.discount;

    List<PaymentMethod> paymentMethods = [
      PaymentMethod('cash_on_delivery', Images.cod),
      PaymentMethod('SSL Commerz', Images.sslCommerz),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      bottomNavigationBar: InkWell(
        onTap: () async {
          /// do check out proceed
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckOutSuccessScreen()));
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeDefault),
          decoration: BoxDecoration(
            color: accentShade,
          ),
          child: Center(
              child: Text('Proceed',
                  style: TextStyle(
                    fontSize: Dimensions.fontSizeExtraLarge,
                    color: Colors.white,
                  ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Checkout'),
            Card(
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeDefault),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text('Shipping Address',
                                style: TextStyle(fontWeight: FontWeight.w600))),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (BuildContext context) => const SavedAddressListScreen())),
                          },
                          child: Image.asset(Images.address, scale: 3),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address type',
                          style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        const Divider(),
                        Text(
                          'Add your Address',
                          style: TextStyle(fontSize: Dimensions.fontSizeSmall),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: !widget.onlyDigital ? Dimensions.paddingSizeSmall : 0),
            //billing address
            Card(
              child: Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeDefault),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text('Billing Address',
                                style: TextStyle(fontWeight: FontWeight.w600))),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (BuildContext context) => const SavedAddressListScreen())),
                          },
                          child: Image.asset(Images.address, scale: 3),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address type',
                          style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                        const Divider(),
                        Text(
                          'Add your Address',
                          style: TextStyle(fontSize: Dimensions.fontSizeSmall),
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            // Order Details
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order Details',
                    style: TextStyle(
                        fontSize: Dimensions.fontSizeLarge,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            //cart list
            Container(
              height: 200,
              child: OrderListView(
                backExits: true,
              ),
            ),
            // Coupon
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.paddingSizeDefault,
                  right: Dimensions.paddingSizeDefault,
                  bottom: Dimensions.paddingSizeDefault),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: accentShade.withOpacity(.2),
                    borderRadius:
                        BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    border: Border.all(
                        width: .5,
                        color: Theme.of(context).primaryColor.withOpacity(.9))),
                child: Row(children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.paddingSizeSmall, bottom: 5),
                        child: Center(
                          child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Have a coupon?',
                                hintStyle: TextStyle(
                                    fontSize: Dimensions.fontSizeDefault),
                                filled: false,
                                fillColor: Colors.red,
                                border: InputBorder.none,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  InkWell(
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
                        //Provider.of<CouponProvider>(context, listen: false).initCoupon(context,_controller.text, _order);
                      }
                    },
                    child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(
                                    Dimensions.paddingSizeExtraSmall),
                                topRight: Radius.circular(
                                    Dimensions.paddingSizeExtraSmall))),
                        child: Center(
                            child: Text(
                          'Apply',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: Dimensions.fontSizeLarge),
                        ))),
                  ),
                ]),
              ),
            ),
            //order summary
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.055),
              ),
              child: Center(
                  child: Text(
                'Order Summery',
                style: TextStyle(
                    fontSize: Dimensions.fontSizeLarge,
                    fontWeight: FontWeight.w600),
              )),
            ),
            // Total bill
            Container(
              margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              color: Theme.of(context).cardColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AmountWidget(title: 'Sub Total', amount: '৳ 2400'),
                    AmountWidget(title: 'Shipping Fee', amount: '৳ 50'),
                    AmountWidget(title: 'Discount', amount: '৳ 0'),
                    AmountWidget(title: 'Coupon & Voucher', amount: '৳ 0'),
                    AmountWidget(title: 'Tax', amount: '৳ 0'),
                    Divider(height: 5, color: Theme.of(context).hintColor),
                    AmountWidget(title: 'Total Payable', amount: '৳ 1250'),
                  ]),
            ),
            // Payment Method
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              color: Theme.of(context).cardColor,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(fontSize: Dimensions.fontSizeLarge),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    Expanded(
                      child: ListView.builder(
                        itemCount: paymentMethods.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCheckBox(
                            index: index,
                            isSelected: selectedPaymentMethodIndex == index,
                            onSelected: (index) {
                              setState(() {
                                selectedPaymentMethodIndex = index;
                              });
                            },
                            icon: paymentMethods[index].image,
                          );
                        },
                      ),
                    ),
                  ]),
            ),
            //note Section
            Container(
                margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                color: Theme.of(context).cardColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Note',
                            style:
                                TextStyle(fontSize: Dimensions.fontSizeLarge),
                          ),
                          Text(
                            '(Extra Instruction / AdditionalInformation)',
                            style: TextStyle(color: Colors.blueGrey.shade200),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.paddingSizeSmall),
                      CustomTextField(
                        hintText: 'enter note here',
                        textInputType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        maxLine: 3,
                        focusNode: _orderNoteNode,
                        controller: _orderNoteController,
                        fillColor: Colors.white,
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  String name;
  String image;

  PaymentMethod(this.name, this.image);
}
