import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/view.dart';


// ignore: must_be_immutable
class MoviesModel extends StatelessWidget {
  MoviesModel({
    Key? key,
    required this.latestmovies,
    required this.futurefunction,
  }) : super(key: key);

  ValueNotifier<List<dynamic>> latestmovies;
  Future<void> futurefunction;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurefunction,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 7),
            child:  Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:latestmovies.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child:GestureDetector(
                        onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ViewScreen(index: index, valueNotifier: latestmovies);
                }));
              },
                        child: Container(
                          width: 120,
                        
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageUrl +
                                      latestmovies.value[index]['poster_path'],),fit: BoxFit.fill)),
                        ),
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
