import 'package:flutter/material.dart';
import 'package:movies_app/data/ApiManager.dart';
import 'package:movies_app/data/category_movies.dart';
import 'package:movies_app/data/movie__details.dart';
import 'package:movies_app/search/SearchItem.dart';

import '../MyThemeData.dart';

class BrowseDetails extends StatelessWidget{
  static const String routename='browsedetails';
  const BrowseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var genres=ModalRoute.of(context)!.settings.arguments as Genres;
    print(genres.id.toString());
    return Scaffold(
      backgroundColor: MyThemeData.primarycolor,
      body: FutureBuilder<CategoryMovies>(
        future: ApiManager.loadMoviesOfEachCategory(genres.id.toString()) ,
        builder: (buildcontext,snapchot){
          if(snapchot.hasError)
            return Center(child: Text('${snapchot.error}'));
          else if(snapchot.connectionState==ConnectionState.waiting)
            return Center(child: CircularProgressIndicator()) ;
          return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Expanded(
              child: ListView.separated(itemBuilder:(contextt,index){
                return SearchItem(snapchot.data!.results![index]);
              },itemCount: snapchot.data?.results?.length??0, separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: MyThemeData.secondcolor,
                  width: double.infinity,
                  height: 2,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                );
              }, ),
            ),
          ) ;
        },

      ),
    );
  }
}
