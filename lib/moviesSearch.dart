import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hostar_clone_1/api/api_service.dart';

// ignore: must_be_immutable
class SearchMovies extends StatelessWidget {
  SearchMovies(
      {super.key, required this.latestmovies, required this.futurefunction});

  ValueNotifier<List<dynamic>> latestmovies;
  Future<void> futurefunction;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurefunction,
        builder: (context, index) {
          return Expanded(
            child: MasonryGridView.builder(
              
                itemCount: 10,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                
                    crossAxisCount: 2),

                    

                itemBuilder: (context, index) {
                  return Padding(
                  
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              imageUrl +
                                  latestmovies.value[index]['poster_path'],
                            ),
                            fit: BoxFit.fill),
                      ),
                      height: 200,
                    ),
                  );
                }),
          );
        });
  }
}
