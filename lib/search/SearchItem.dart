import 'package:flutter/material.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/home/MovieDetails.dart';
//ha3ml boo asaive feha is done wla l2
class SearchItem extends StatelessWidget {
  Results movie;


  SearchItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context,MovieDetails.routename ,arguments: movie);
        },
        child: Row(


          children: [
            Container(
             // width: double.infinity,
               padding: EdgeInsets.only(top: 4,bottom: 4),
              child: Expanded(child: Image.network('https://image.tmdb.org/t/p/w500//${movie.posterPath}',height: 100,fit: BoxFit.cover,)),
            ),
            Expanded(
              child: Container(
                 padding: EdgeInsets.only(left: 2),
                // margin: EdgeInsets.all(2) ,
                child: Column(

                  children: [
                    Text('${movie.title} '
                        ,style: TextStyle(color: Colors.white,)),
                    Text('${movie.releaseDate}',style: TextStyle(color: Colors.white),)
                  ],

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
