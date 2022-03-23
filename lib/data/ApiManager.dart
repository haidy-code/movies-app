import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/categories.dart';
import 'package:movies_app/data/category_movies.dart';
import 'package:movies_app/data/movie__details.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/search_movies.dart';
import 'package:movies_app/data/similar_movies.dart';
import 'package:movies_app/data/top_rated_movies.dart';
import 'package:movies_app/home/MovieDetails.dart';

 class ApiManager {
  static const String apiKey = 'f1086a6fc6140fabf6ebca57b3a343f8';
  static const String baseUrl = 'api.themoviedb.org';

 static Future<PopularMovies> loadPopularMovies() async {
   var params={'api_key':apiKey};
    var uri=Uri.https(baseUrl,'/3/movie/popular' ,params);
    var response=await http.get(uri);
    var popularmovies = PopularMovies.fromJson(jsonDecode(response.body));
//sucess
    if (response.statusCode == 200) {
      return popularmovies;
    }
// wsl lserver bs feh moshkla fe respnse nafso
    if (popularmovies.message != null)
      throw Exception(popularmovies.message);
// mawslsh lserver aslan
    throw Exception("error reaching server");
  }
  static Future<TopRatedMovies> loadRecommendedMovies() async {
   var params={'api_key':apiKey};
   var uri=Uri.https(baseUrl,'/3/movie/top_rated' ,params);
   var response=await http.get(uri);
   var topratedmovies = TopRatedMovies.fromJson(jsonDecode(response.body));
//sucess
   if (response.statusCode == 200) {
    return topratedmovies;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (topratedmovies.message != null)
    throw Exception(topratedmovies.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }
  static Future<Movie_Details> loadMovieDetails(int movie_id) async {
   var params={'api_key':apiKey};
   var uri=Uri.https(baseUrl,'/3/movie/${movie_id}' ,params);
   var response=await http.get(uri);
   var moviedetails = Movie_Details.fromJson(jsonDecode(response.body));
//sucess
   if (response.statusCode == 200) {
    return moviedetails;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (moviedetails.message != null)
    throw Exception(moviedetails.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }
  static Future<SimilarMovies> loadSimilarMovies(int movie_id) async {
   var params={'api_key':apiKey};
   var uri=Uri.https(baseUrl,'/3/movie/${movie_id}/similar' ,params);
   print('movie id $movie_id');
   var response=await http.get(uri);
   print('2');
   var similarmovies = SimilarMovies.fromJson(jsonDecode(response.body));
   print('3' +response.body);
//sucess
   if (response.statusCode == 200) {
    return similarmovies;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (similarmovies.message != null)
    throw Exception(similarmovies.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }
  static Future<SearchMovies> loadSearchMovies(String? query) async {
   var params={'api_key':apiKey,'query':query};
   var uri=Uri.https(baseUrl,'/3/search/movie' ,params);
   var response=await http.get(uri);
   var searchmovies = SearchMovies.fromJson(jsonDecode(response.body));
//sucess
   if (response.statusCode == 200) {
    return searchmovies;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (searchmovies.message != null)
    throw Exception(searchmovies.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }
  static Future<Categories> loadCategoryMovies() async {
   var params={'api_key':apiKey};
   var uri=Uri.https(baseUrl,'/3/genre/movie/list' ,params);
   var response=await http.get(uri);
   var categories = Categories.fromJson(jsonDecode(response.body));
//sucess
   if (response.statusCode == 200) {
    return categories;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (categories.message != null)
    throw Exception(categories.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }
  static Future<CategoryMovies> loadMoviesOfEachCategory(String? genid) async {
   var params={'api_key':apiKey,'with_genres':genid};
   var uri=Uri.https(baseUrl,'/3/discover/movie' ,params);
   var response=await http.get(uri);
   var movies = CategoryMovies.fromJson(jsonDecode(response.body));
//sucess
   if (response.statusCode == 200) {
    return movies;
   }
// wsl lserver bs feh moshkla fe respnse nafso
   if (movies.message != null)
    throw Exception(movies.message);
// mawslsh lserver aslan
   throw Exception("error reaching server");
  }


  }


