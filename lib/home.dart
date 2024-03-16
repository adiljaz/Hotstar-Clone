
import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/bannerCarosal/baner.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  List topratedmovies = [];
  List tv = [];
  List upcomingmovies = [];

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
                  valuenotifier: trendingmovies),

                  
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
              Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(2),
                    itemCount: upcomingmovies.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (upcomingmovies.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            color: Colors.green,
                            height: 55,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      imageUrl +
                                          upcomingmovies[index]['poster_path'],
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
