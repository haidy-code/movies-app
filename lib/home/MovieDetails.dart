import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/ApiManager.dart';
import 'package:movies_app/data/FirebaseUtils.dart';
import 'package:movies_app/data/movie__details.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/data/similar_movies.dart';
import 'package:movies_app/home/MoviesDetailsItem.dart';

import '../MyThemeData.dart';
import 'NewReleasesItem.dart';

class MovieDetails extends StatelessWidget {
  static const String routename = 'moviesdetails';

  @override
  Widget build(BuildContext context) {
    var movies = ModalRoute.of(context)!.settings.arguments as Results;
    bool? isdone = false;
    // print('$isdone');

    return Scaffold(
      backgroundColor: MyThemeData.primarycolor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500//${movies.posterPath}',
                fit: BoxFit.fill,
                height: 200,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${movies.title}',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${movies.releaseDate}',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500//${movies.posterPath}',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  FutureBuilder<Movie_Details>(
                      future: ApiManager.loadMovieDetails(movies.id ?? 508),
                      builder: (context, snapchot) {
                        if (snapchot.hasError) {
                          print(snapchot.data?.title);
                          print(snapchot.error);
                          return Center(child: Text('${snapchot.error}'));
                        } else if (snapchot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Expanded(
                          child: SizedBox(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemBuilder: (buildcontext, index) {
                                        return MoviesDetailsItem(
                                            snapchot.data!.genres![index]);
                                      },
                                      itemCount:
                                          snapchot.data?.genres?.length ?? 0,
                                      scrollDirection: Axis.horizontal),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 5),
                                  child: Text(
                                    '${snapchot?.data?.overview}',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.start,
                                    maxLines: 7,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/star-2.png',
                                      width: 36,
                                    ),
                                    Container(
                                      child: Text(
                                        '${snapchot?.data?.voteAverage}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
            FutureBuilder<SimilarMovies>(
                future: ApiManager.loadSimilarMovies(movies.id ?? 0),
                builder: (buildcontext, snapshot2) {
                  if (snapshot2.hasError) {
                    //Todo:in case error retry

                    return Container(
                        //margin: EdgeInsets.only(top: 110) ,
                        child: Center(child: Text(snapshot2.error.toString())));
                  }
                  else if (snapshot2.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                        padding: EdgeInsets.all(35),
                        child: Center(child: CircularProgressIndicator()));
                  }
                  return Container(
                    margin: EdgeInsets.only(top: 12, left: 6, right: 6),
                    color: MyThemeData.secondcolor,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'More Like This',
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (buildcontext, index) {
                              return NewReleasesItem(
                                  snapshot2.data!.results![index]);
                            },
                            itemCount: snapshot2.data?.results?.length ?? 0,
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
