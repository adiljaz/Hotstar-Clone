import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcomingmovies = [];

  final String apikey = '9280f0d6b5fe07ce79819ad96f9a2fa0';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MjgwZjBkNmI1ZmUwN2NlNzk4MTlhZDk2ZjlhMmZhMCIsInN1YiI6IjY1ZjJkODk5NDcwZWFkMDE3ZTlmOWU4ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JRGCDCp81lbprD-uaYM1Po5Cn9dWCQckvcfhGsh4X-k';

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbwithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResults = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithCustomLogs.v3.tv.getPopular();
    Map upcomingresult = await tmdbwithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingResults['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcomingmovies = upcomingresult['results'];
    });
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
              if (trendingmovies.isNotEmpty)
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: trendingmovies.length,
                      itemBuilder: (context, index, pageviewindex) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trendingmovies[index]['poster_path'],
                                ),
                                fit: BoxFit.fill),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 15 / 17,
                        autoPlay: true,
                        viewportFraction: 0.8,
                        autoPlayInterval: Duration(seconds: 2),
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 150,
                        width: 150,
                      ),
                      right: 250,
                      bottom: 305,
                    ),
                    Positioned(
                      child: Icon(Icons.cast),
                      left: 320,
                      top: 20,
                    ),
                  ],
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
              SizedBox(height: mediaquery.height * 0.015),
              buildIndicator(),
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
                    itemCount: topratedmovies.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (topratedmovies.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 55,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topratedmovies[index]['poster_path'],
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

  Widget buildIndicator() {
    return Center(
      child: AnimatedSmoothIndicator(
        effect: ScrollingDotsEffect(
          dotWidth: 6,
          dotHeight: 6,
          activeDotColor: Colors.white,
          dotColor: Colors.grey,
        ),
        activeIndex: activeIndex,
        count: 8,
      ),
    );
  }
}
