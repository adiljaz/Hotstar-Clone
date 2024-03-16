import 'dart:convert';
import 'dart:io';
import 'package:hostar_clone_1/controller/controler.dart';
import 'package:http/http.dart' as http;


  final String apikey = '9280f0d6b5fe07ce79819ad96f9a2fa0';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MjgwZjBkNmI1ZmUwN2NlNzk4MTlhZDk2ZjlhMmZhMCIsInN1YiI6IjY1ZjJkODk5NDcwZWFkMDE3ZTlmOWU4ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JRGCDCp81lbprD-uaYM1Po5Cn9dWCQckvcfhGsh4X-k';
  String imageUrl = 'https://image.tmdb.org/t/p/w500';
 
  Future<void> trendingMovies() async {
    try {
 
      final url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final items = jsonDecode(body);
        trendingmovies.value  = items['results'];
        stdout.write( trendingmovies );
      }
    } catch (error) {
      stdout.write('Error: $error');
    }
  }

