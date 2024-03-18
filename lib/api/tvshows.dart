import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';

// ignore: must_be_immutable
class Tvshows extends StatelessWidget {
   Tvshows({super.key, required this.tvshows,required this.futurefunction});

   ValueNotifier<List<dynamic>> tvshows;
  Future<void> futurefunction;



  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: futurefunction,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Container(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:tvshows.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      width: 120,
                    
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageUrl +
                                  tvshows.value[index]['poster_path'],),fit: BoxFit.fill)),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}