import 'package:flutter/material.dart';
import 'package:movies_app/data/FirebaseUtils.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/home/MovieDetails.dart';

class NewReleasesItem extends StatefulWidget {
  Results movies;



  NewReleasesItem(this.movies);

  @override
  State<NewReleasesItem> createState() => _NewReleasesItemState();
}

class _NewReleasesItemState extends State<NewReleasesItem> {
  @override
  Widget build(BuildContext context) {
    //print('${movies.isdone}');


    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,MovieDetails.routename ,arguments: widget.movies);
      },
      child: Stack(
        children: [

          Container(
            padding: EdgeInsets.all(4),
            child: Image.network('https://image.tmdb.org/t/p/w500//${widget.movies.posterPath}',height: 100,fit: BoxFit.cover,),
          ),
          getitemdesign(widget.movies,widget.movies.isdone??false ,context),
        ],
      ),
    );
  }

  Widget getitemdesign(Results movies,bool isdone, BuildContext context) {
    if (isdone) {
      return Container(
        child: Image.asset(
          'assets/images/added-movie.png',
          fit: BoxFit.cover,
          height: 20,
          width: 20,
        ),
      );
    }
    return InkWell(
      onTap: () {
        widget.movies.isdone=true;


        //  movies.isdone=true;
        addMoviesToFirestore(
            widget.movies.id ?? 0,
            widget.movies.title ?? '',
            widget.movies.posterPath ?? '',
            widget.movies.releaseDate ?? '',true)
          .then((value) {
            print(
                'sucesss');
            print('juki${widget.movies.isdone}');
                this.getitemdesign(movies,widget.movies.isdone??true, context);
                setState(() {

                });//success to write in database
          }).onError((error, stackTrace) {
            print(error.toString());
          })
          .timeout(Duration(seconds: 50),
              onTimeout: () {
                print('fail to reach to server');
              });

      },
      child: Container(
        child: Image.asset(
          'assets/images/add_movie.png',
          fit: BoxFit.cover,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
