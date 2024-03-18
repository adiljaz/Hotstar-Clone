import 'package:flutter/material.dart';
import 'package:hostar_clone_1/colors/colors.dart';

// ignore: must_be_immutable
class SearchFor extends StatelessWidget {
  SearchFor({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    final mediaquerry = MediaQuery.of(context);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorManager.black,
            border: Border.all(color: Color.fromARGB(255, 155, 155, 155))),
        height: 35,
        width: mediaquerry.size.width * 0.20,
        child: Center(child: Text(name)));
  }
}
