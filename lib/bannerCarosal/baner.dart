import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MovieScreen extends StatefulWidget {
  Future<void> futurefunction;
  ValueNotifier<List<dynamic>> valuenotifier;

  MovieScreen(
      {super.key, required this.futurefunction, required this.valuenotifier});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return FutureBuilder(
        future: widget.futurefunction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('error:${snapshot.error}');
          } else {
            return Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: widget.valuenotifier.value.length,
                      itemBuilder: (context, index, pageviewindex) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  imageUrl +
                                      widget.valuenotifier.value[index]
                                          ['poster_path'],
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
                SizedBox(height: mediaquery.height * 0.015),
                buildIndicator(),
              ],
            );
          }
        });
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
        count: widget.valuenotifier.value.length,
      ),
    );
  }
}
