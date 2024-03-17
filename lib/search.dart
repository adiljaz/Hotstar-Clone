import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:hostar_clone_1/moviesSearch.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquerry = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaquerry.size.height * 0.1,
            ),
            TextFormField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Movies, shows and more  ",
                  hintStyle: TextStyle(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 7, 7, 7),
                      fontWeight: FontWeight.w400),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.symmetric(vertical: 8)),
            ),
            SizedBox(
              height: mediaquerry.size.height * 0.03,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'People Search For',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
            SizedBox(
              height: mediaquerry.size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                color: Colors.red,
                height: 50,
              ),
            ),
            //stagged Gridview
            SearchMovies(latestmovies: latestmovies, futurefunction: latestMovies())
          ],
        ),
      
    );
  }
}
