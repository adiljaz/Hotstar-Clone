import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:hostar_clone_1/moviesSearch.dart';
import 'package:hostar_clone_1/search/searchdisplay.dart';
import 'package:hostar_clone_1/searchfor.dart';
import 'package:hostar_clone_1/view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Container(
        height: mediaquery.size.height, // Set a finite height for the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaquery.size.height * 0.1,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600),
              
              controller: searchController,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 255, 254, 254),
                filled: true,
                
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Movies, shows and more",
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 7, 7, 7),
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              onChanged: (value) {
                isLoading.value = true;
                searchMovies(value);
              },
            ),
            SizedBox(
              height: mediaquery.size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'People Search For',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ),
            SizedBox(
              height: mediaquery.size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: double.infinity,
                color: ColorManager.black,
                height: 35,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorManager.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                        ),
                        height: 35,
                        width: mediaquery.size.width * 0.23,
                        child: Row(
                          children: [
                            SizedBox(
                              width: mediaquery.size.width * 0.015,
                            ),
                            Icon(Icons.trending_up),
                            SizedBox(
                              width: mediaquery.size.width * 0.015,
                            ),
                            Text('india'),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: mediaquery.size.width * 0.03,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorManager.black,
                          border: Border.all(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                        ),
                        height: 35,
                        width: mediaquery.size.width * 0.20,
                        child: Center(child: Text('Action')),
                      ),
                      SizedBox(
                        width: mediaquery.size.width * 0.03,
                      ),
                      SearchFor(name: 'comedy'),
                      SizedBox(
                        width: mediaquery.size.width * 0.03,
                      ),
                      SizedBox(
                        width: mediaquery.size.width * 0.03,
                      ),
                      SearchFor(name: 'Action '),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: searchMovies(searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return ValueListenableBuilder(
                      valueListenable: searchMovie,
                      builder: (context, value, child) {
                        if(value.isEmpty){
                           return    SearchMovies(latestmovies: latestmovies, futurefunction: latestMovies());

                        }
                        return  ListView.builder(
                          itemCount: searchMovie.value.length,
                          itemBuilder: (context, index) {
                            
                           if(searchMovie.value.isEmpty){
                            return Center(child: const Text('No data'));
                           }else{
                             return GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewScreen(index: index, valueNotifier:searchMovie) )); 
                              },
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration:BoxDecoration(image: DecorationImage(image: NetworkImage(imageUrl+value[index]['poster_path']))),
                                child: Text(value[index]['title']),
                              ),
                            );
                           }
                          },
                        );
                        
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
