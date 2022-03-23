import 'package:flutter/material.dart';
import 'package:movies_app/data/FirebaseUtils.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/home/MovieDetails.dart';

class WatchListItem extends StatelessWidget {
  Results movie;

  WatchListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routename, arguments: movie);
      },
      child: Expanded(
        child: Row(
          children: [
            Container(
              // width: double.infinity,
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: Stack(
                children: [
                  Expanded(
                      child: Image.network(
                    'https://image.tmdb.org/t/p/w500//${movie.posterPath}',
                    height: 100,
                    fit: BoxFit.cover,
                  )),
                  InkWell(
                    onTap: () {
                      print('${movie.id}');
                      deleteMovie(movie).then((value) {
                        print('delete succesful');
                      }).onError((error, stackTrace) {
                        print('error');
                      }).timeout(Duration(seconds: 30), onTimeout: () {
                        print('time out');
                      });
                    },
                    child: Container(
                      // margin: EdgeInsets.only(right: 70),
                      alignment: Alignment.topLeft,

                      child: Image.asset(
                        'assets/images/delete.png',
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                        color: Colors.red,
                        alignment: Alignment.topLeft,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 2),
              // margin: EdgeInsets.all(2) ,
              child: Column(
                children: [
                  Text('${movie.title}',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text(
                    '${movie.releaseDate}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
