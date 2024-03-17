import 'package:flutter/material.dart';
import 'package:hostar_clone_1/bottom.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    nextTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/newsplash.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void nextTo() {
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BottomNaavigation()));
    });
  }
}
