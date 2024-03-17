import 'package:flutter/material.dart';
import 'package:hostar_clone_1/colors/colors.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Column(
        children: [
          Text('Downloads'),
          Text('No Downloads Available'),
          Text(
              'Explore and Download your favourite movies and shows to watch on the go '),
          ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              onPressed: () {},
              child: Text('Go to Home')),
        ],
      ),
    );
  }
}
