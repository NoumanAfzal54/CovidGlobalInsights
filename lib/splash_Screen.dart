import 'dart:async';
import 'package:escobar/world_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:shimmer/shimmer.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with TickerProviderStateMixin //(it helps in building animations)
{
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WorldstateScreen()));
    });
  }

  @override
  void dispose() {
    controller
        .dispose(); // Dispose of the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              child: Container(
                height: 300,
                width: 300,
                child: Image(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaWHeTuVD5icxlTu_-LxP5L8zEtGxFedWsP-TFQQC7MOjJpak1xvvPq7sHKuq-4Gz25xk&usqp=CAU'),

                )
                 
              ),
              animation: controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: controller.value * 2.0 * math.pi,
                );
              }),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Covid-19\nTracking app",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
