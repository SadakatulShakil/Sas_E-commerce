import 'package:byte_trek_task/Screens/auth/widget/signin_widget.dart';
import 'package:byte_trek_task/Screens/auth/widget/signup_widget.dart';
import 'package:byte_trek_task/helper/constant.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold( // Remove the AppBar
        body:
        Column(
          children: [
            SizedBox(height:50,),
            Image.asset(
              'assets/images/logo.png', // replace with your logo image asset
              height: 80,
            ),
            SizedBox(height:35,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TabBar(
                indicator: MyTabIndicator(), // Custom indicator
                  labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Sign In'),
                  Tab(text: 'Sign Up'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SignInWidget(),
                  SignUpWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyBoxPainter(this, onChanged);
  }
}

class _MyBoxPainter extends BoxPainter {
  final MyTabIndicator decoration;

  _MyBoxPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = greenshede0; // Set the color of the selected tab indicator
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1.0;

    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(20.0)); // Set the radius
    canvas.drawRRect(rRect, paint);
  }
}
