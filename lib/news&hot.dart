import 'package:flutter/material.dart';
import 'package:hostar_clone_1/api/api_service.dart';
import 'package:hostar_clone_1/colors/colors.dart';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:hostar_clone_1/hotmodel.dart';

class Newsandhot extends StatelessWidget {
  const Newsandhot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManager.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50 ),
          child: AppBar(

            
          
          
            bottom: TabBar( 
              indicatorColor: Colors.white,
              
              
              tabs: [
              Tab(
               child: Text('Coming soon',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
              
              ),
              Tab(
               child: Text('Free-Newly Added',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
              
              )
            ]),
          ),
        ),

        body: TabBarView(children:[

          HotModel(valuenotifier: cominsoongmovies, futurefunction: comingSoon()),
          HotModel(valuenotifier: trendingmovies, futurefunction: latestMovies())

        ] ),
      ),
    );
  }
}
