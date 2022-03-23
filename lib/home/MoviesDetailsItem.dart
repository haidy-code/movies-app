import 'package:flutter/material.dart';
import 'package:movies_app/data/movie__details.dart';

class MoviesDetailsItem extends StatelessWidget {
  Genres genres;


  MoviesDetailsItem(this.genres);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 45,
      width: 85,
      padding: EdgeInsets.all(5),
      margin:EdgeInsets.only(left: 5, right: 5) ,


      decoration: BoxDecoration(

        border: Border.all(color: Color.fromRGBO(
            81, 79, 79, 1.0), width: 2),
      ),

      child: Text('${genres.name}',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
    );
  }
}
