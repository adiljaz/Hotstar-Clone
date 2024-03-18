import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/view.dart';

// ignore: must_be_immutable
class HotModel extends StatelessWidget {
  HotModel(
      {super.key, required this.valuenotifier, required this.futurefunction});

  ValueNotifier<List<dynamic>> valuenotifier;
  Future<void> futurefunction;

  @override
  Widget build(BuildContext context) {
    final mediaquerry = MediaQuery.of(context).size;
    return Container(
        child: FutureBuilder(
            future: futurefunction,
            builder: (context, snpashot) {
              if (snpashot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snpashot.hasError) {
                return Text("${snpashot.hasError}");
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: valuenotifier.value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ViewScreen(index: index, valueNotifier: valuenotifier ); 
                }));
              },
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                
                                child: Image.network(
                                  imageUrl +
                                      valuenotifier.value[index]['backdrop_path'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valuenotifier.value[index]['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                    Text(
                                      ' Released Date :${valuenotifier.value[index]['release_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: mediaquerry.height * 0.01,
                                    ),
                                    Text(
                                      valuenotifier.value[index]['overview'],
                                      maxLines: 3,
                                    ),
                                    SizedBox(
                                      height: mediaquerry.height * 0.01,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                );
              }
            }));
  }
}
