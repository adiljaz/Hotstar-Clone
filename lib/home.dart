import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:hostar_clone_1/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  List trendingmovies = [];
  final String apikey = '';
  final readaccesstoken = '';

  @override
  Widget build(BuildContext context) {
    final mediaquerry = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorManager.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: 10,
                      itemBuilder: (context, index, pageviewindex) {
                        return Container(
                          height: 100,
                          width: double.infinity,
                          color: Colors.red,
                          child: Text(index.toString()),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 2),
                        onPageChanged: (index, reason) => setState(() {
                          activeIndex = index;
                        }),
                      ),
                    ),
                    Positioned(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 150,
                        width: 150,
                      ),
                      right: 250,
                      bottom: 100,
                    ),
                    Positioned(
                      child: Icon(Icons.cast),
                      left: 320,
                      top: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaquerry.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.gray,
                      ),
                      height: mediaquerry.height * 0.06,
                      width: mediaquerry.width * 0.5,
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
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: mediaquerry.width * 0.05,
                    ),
                    Container(
                      height: mediaquerry.height * 0.06,
                      width: mediaquerry.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.gray,
                      ),
                      child: Icon(Icons.add),
                    )
                  ],
                ),
                SizedBox(
                  height: mediaquerry.height * 0.015,
                ),
                buildindicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    'Latest Releases ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(2),
                        itemCount: 30,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 55,
                              width: 110,
                              color: Colors.green,
                            ),
                          );
                        }),
                  ),
                ),

                
              ],
            ),
          )),
    );
  }

  Widget buildindicator() {
    return Center(
      child: AnimatedSmoothIndicator(
          effect: ScrollingDotsEffect(
              dotWidth: 6,
              dotHeight: 6,
              activeDotColor: Colors.white,
              dotColor: Colors.grey),
          activeIndex: activeIndex,
          count: 8),
    );
  }
}
