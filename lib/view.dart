import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:hostar_clone_1/model/moviesmodel.dart';

// ignore: must_be_immutable
class ViewScreen extends StatelessWidget {
  int index;
  ValueNotifier<List<dynamic>> valueNotifier;

  ViewScreen({
    super.key,
    required this.index,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,

      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240, 
              child: Stack(
                children: [
                  Image.network(
                    imageUrl +
                        (valueNotifier.value[index]['backdrop_path'] ??
                            valueNotifier.value[index]['poster_path']),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 40,
                    right: 14,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              valueNotifier.value[index]['title'] ??
                  valueNotifier.value[index]['name'],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(
                    'Released Date :   ${valueNotifier.value[index]['release_date'] ?? 'Released Soon'}',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'LanguageS :  ${valueNotifier.value[index]['original_language'] ?? 'Released Soon'}  | HINDI | TAMIL | MALAYALAM',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Subcribe to Watch',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              '| ACTION | DRAMA | THRILLER | FRIENDSHIP |',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                valueNotifier.value[index]['overview'] ??
                    'Details will not be provided',
                style: const TextStyle(color: Colors.white54),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.add, size: 30, color: Colors.white),
                    Text(
                      'Watchlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, size: 30, color: Colors.white),
                    Text('Share', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.download_sharp, size: 30, color: Colors.white),
                    Text('Download', style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'More Like This',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                    color: Colors.white),
              ),
            ),
            MoviesModel(latestmovies: latestmovies, futurefunction: latestMovies()),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
