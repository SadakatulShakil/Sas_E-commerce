import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int imageCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          maxScale: 2000.0,
          minScale: 0.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // First image with custom size
              _buildImage('infi1.png', .9, 800.0, 400.0),
              // Remaining images with decreasing scale
              Positioned(
                  bottom: 5,
                  top: 40,
                  child: _buildImage('infi2.png', .156, 700.0, 10.0)),
              Positioned(
                  bottom: 5,
                  top: 45,
                  child: _buildImage('infi3.png', .035, 700.0, 300.0)),

              Positioned(
                  bottom: 5,
                  top: 45.4,
                  child: _buildImage('infi4.png', .0105, 800.0, 300.0)),

              Positioned(
                  bottom: 5,
                  top: 45.5,
                  left: 2,
                  right: 1,
                  child: _buildImage('infi5.png', .0060, 800.0, 300.0)),

              Positioned(
                  bottom: 5,
                  top: 45.65,
                  left: 2.3,
                  right: 1,
                  child: _buildImage('infi6.png', .0039, 800.0, 300.0)),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageName, double scale, double width, double height) {
    return Transform.scale(
      scale: scale, // Decreasing scale for images after the first one
      child: Image.asset(
        'assets/images/$imageName',
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
