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
    final url =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      trendingmovies.value = items['results'];
      stdout.write(trendingmovies);
    }
  } catch (error) {
    stdout.write('Error: $error');
  }
}

Future<void> latestMovies() async {
  try {
    final url =
        'https://api.themoviedb.org/3/tv/popular?api_key=$apikey&language=en-US';
    final uri = Uri.parse(url);
    final respose = await http.get(uri);
    if (respose.statusCode == 200) {
      final body = respose.body;
      final items = jsonDecode(body);
      latestmovies.value = items['results'];

      print(items['results']);
    }
  } catch (error) {
    stdout.write(error);
  }
}

Future<void> toprated() async {
  try {
    final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      topratedmovies.value = items['results'];
      print(items['results']);
    }
  } catch (error) {
    stdout.write(error);
  }
}

Future<void> comingSoon() async {
  try {
    final url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&release_date.gte=2024-03-18';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      cominsoongmovies.value = items['results'];
      print(items['results']);
    }
  } catch (error) {
    stdout.write(error);
  }
}

Future<void> searchMovies(String query) async {
  try {
    isLoading.value=true; 
    searchMovie.value.clear();
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=$query';
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final body = res.body;
      final items = jsonDecode(body);

      searchMovie.value = items['results'];
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      searchMovie.notifyListeners();
      isLoading.value=false; 
      isLoading.notifyListeners(); 
      
    }
  } catch (error) {
    stdout.write(error);
  }
}


Future<void> tvshowsget() async {
  try {
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=horror';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      cominsoongmovies.value = items['results'];
      print(items['results']);
    }
  } catch (error) {
    stdout.write(error);
  }
}


// https://api.themoviedb.org/3/search/movie?api_key=YOUR_API_KEY&query=horror



