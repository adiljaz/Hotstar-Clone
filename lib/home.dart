import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/bannerCarosal/baner.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:hostar_clone_1/flatbaner.dart';
import 'package:hostar_clone_1/model/moviesmodel.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  final String apikey = '9280f0d6b5fe07ce79819ad96f9a2fa0';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MjgwZjBkNmI1ZmUwN2NlNzk4MTlhZDk2ZjlhMmZhMCIsInN1YiI6IjY1ZjJkODk5NDcwZWFkMDE3ZTlmOWU4ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JRGCDCp81lbprD-uaYM1Po5Cn9dWCQckvcfhGsh4X-k';

  @override
  void initState() {
    super.initState();
    trendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieScreen(
                futurefunction: trendingMovies(),
                valuenotifier: trendingmovies,
              ),
              SizedBox(height: mediaquery.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.gray,
                    ),
                    height: mediaquery.height * 0.06,
                    width: mediaquery.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 23,
                        ),
                        Text(
                          'Watch Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: mediaquery.width * 0.05),
                  Container(
                    height: mediaquery.height * 0.06,
                    width: mediaquery.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.gray,
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  'Latest Releases ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: mediaquery.height * 0.01),
              // Container(width: 200,height: 150,color: Colors.orange,
              // // child:MoviesModel(latestmovies: trendingmovies, futurefunction: trendingMovies()) ,
              // )
              MoviesModel(latestmovies: latestmovies, futurefunction: latestMovies()),

              Padding(
                padding:  EdgeInsets.all(10.0),
                child:MovieBanner(topratedmovies: topratedmovies, futurefunction: toprated()),
              )
            ],
          ),
        ),
      ),
    );
  }
}


