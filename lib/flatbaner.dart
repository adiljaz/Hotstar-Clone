import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:hostar_clone_1/api/api_service.dart';

// ignore: must_be_immutable
class MovieBanner extends StatelessWidget {
  MovieBanner(
      {super.key, required this.topratedmovies, required this.futurefunction});

    ValueNotifier<List<dynamic>> topratedmovies;
  Future<void> futurefunction;

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return FutureBuilder(
        future: futurefunction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('error:${snapshot.error}');
          } else {
            return Column(
              children: [
                CarouselSlider.builder(
                
                  itemCount: topratedmovies.value.length,
                  itemBuilder: (context, index, pageviewindex) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 ),

                        image: DecorationImage(
                          
                            image: NetworkImage(
                              imageUrl +
                                  topratedmovies.value[index]['backdrop_path'],
                            ),
                            fit: BoxFit.fill),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    
                    viewportFraction: 1,
                    aspectRatio: 55 / 17,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                   
                    
   
                  ),
                ),
                SizedBox(height: mediaquery.height * 0.015),
              ],
            );
          }
        });
  }
}
