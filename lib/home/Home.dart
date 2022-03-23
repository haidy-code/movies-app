import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/MyThemeData.dart';
import 'package:movies_app/data/ApiManager.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/data/top_rated_movies.dart';
import 'package:movies_app/home/NewReleasesItem.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        FutureBuilder<PopularMovies>(
          future: ApiManager.loadPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //Todo:in case error retry
              print(snapshot.data?.results?.elementAt(0).title);
              print(snapshot.error);

              return Container(
                  //margin: EdgeInsets.only(top: 110) ,
                  child: Center(child: Text(snapshot.error.toString())));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  padding: EdgeInsets.all(35),
                  child: Center(child: CircularProgressIndicator()));
            }

            return Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500//${snapshot.data?.results?.elementAt(3).posterPath}',
                            fit: BoxFit.fill,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 90.0),
                            padding: EdgeInsets.only(left: 15.0, bottom: 5),
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                      'https://image.tmdb.org/t/p/w500//${snapshot.data?.results?.elementAt(3).posterPath}',
                                      fit: BoxFit.fill,
                                      height: 200),
                                  Container(
                                      margin: EdgeInsets.only(top: 100),
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${snapshot.data?.results?.elementAt(3).title}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              '${snapshot.data?.results?.elementAt(3).releaseDate}',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin:EdgeInsets.only(top: 12,left: 6,right: 6) ,
                      color: MyThemeData.secondcolor,
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New releases',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (buildcontext, index) {
                                print(snapshot.data!.results!
                                    .elementAt(0)
                                    .posterPath);

                                return NewReleasesItem(
                                    snapshot.data!.results![index]);
                              },
                              itemCount: snapshot.data?.results?.length ?? 0,
                            ),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder<TopRatedMovies>(future: ApiManager.loadRecommendedMovies(),
                        builder:(buildcontext,snapshot2){

                          if (snapshot2.hasError) {
                            //Todo:in case error retry


                            return Container(
                              //margin: EdgeInsets.only(top: 110) ,
                                child: Center(child: Text(snapshot2.error.toString())));
                          } else if (snapshot2.connectionState == ConnectionState.waiting) {
                            return Container(
                                padding: EdgeInsets.all(35),
                                child: Center(child: CircularProgressIndicator()));
                          }
                          return  Container(
                            margin:EdgeInsets.only(top: 12,left: 6,right: 6) ,

                            color: MyThemeData.secondcolor,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Recommended',
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
                                    itemCount: snapshot2.data?.results?.length??0,
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
          },
        ),
      ],
    ));
  }
}
