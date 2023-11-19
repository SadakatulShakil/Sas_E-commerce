import 'package:flutter/material.dart';
import 'package:sas_ecommerce/Screens/category/all_category_screen.dart';

import '../../utill/stored_images.dart';
import '../more/more_screen.dart';
import '../notification/notification_screen.dart';
import '../order/order_screen.dart';
import 'home_page.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);


  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens ;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomePage(),
      AllCategoryScreen(backExits: false),
      OrderScreen(backExits: false),
      const NotificationScreen(),
      const MoreScreen(),
    ];

   // NetworkInfo.checkConnectivity(context);

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_pageIndex != 0) {
          _setPage(0);
          return false;
        }else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textTheme.bodyLarge!.color,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: _getBottomWidget(),
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String? label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, color: index == _pageIndex ?
      Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
        height: 25, width: 25,
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  List<BottomNavigationBarItem> _getBottomWidget() {
    List<BottomNavigationBarItem> list = [];

      list.add(_barItem(Images.homeImage,'Home', 0));
      list.add(_barItem(Images.messageImage, 'Category', 1));
      list.add(_barItem(Images.shoppingImage, 'Orders', 2));
      list.add(_barItem(Images.notification, 'Notification', 3));
      list.add(_barItem(Images.moreImage, 'More', 4));

    return list;
  }

}