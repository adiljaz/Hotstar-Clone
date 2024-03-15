import 'package:flutter/material.dart';

import 'package:hostar_clone_1/splash.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Hotstar',
      home:SplashSCreen() ,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}