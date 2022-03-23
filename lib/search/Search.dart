import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/MyThemeData.dart';
import 'package:movies_app/data/ApiManager.dart';
import 'package:movies_app/data/search_movies.dart';
import 'package:movies_app/home/NewReleasesItem.dart';

import 'SearchItem.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin:EdgeInsets.only(top: 30,left: 30,right: 30,) ,
          height: 40,

decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(24),
  color: MyThemeData.secondcolor,
  border: Border.all(color: Colors.white,width: 0.2)


),
child: Row(
  children: [IconButton(onPressed: (){
      showSearch(context: context, delegate: MoviesSearch() );
     }, icon: Icon(Icons.search,color: Colors.white,)),
        Text('search',style: TextStyle(color: Colors.grey),),
  ],
),
// child: Form(key: formkey,
//     child: TextFormField(
//   decoration: InputDecoration(
//     hintText: 'search',
//     hintStyle: TextStyle(color: Colors.grey),
//     prefixIcon: IconButton(onPressed: (){
//       showSearch(context: context, delegate: MoviesSearch() );
//     }, icon: Icon(Icons.search,color: Colors.white,)),
//     border: InputBorder.none,
//
//   ),
//       onChanged: (text){
// title=text;
//       },
// )),
        ),
      ],
    );
  }
}

class MoviesSearch extends SearchDelegate {
  late Future<SearchMovies>searchmovies;

  MoviesSearch(){
    searchmovies=ApiManager.loadSearchMovies(query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[IconButton(onPressed: (){
      searchmovies=ApiManager.loadSearchMovies(query);
      showResults(context);
    }, icon: Icon(Icons.search)),] ;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   return Container(
     color: MyThemeData.primarycolor,
     child: FutureBuilder<SearchMovies>(
       future: searchmovies ,
       builder:(buildcontext,snapchot){
         if(snapchot.hasError)
           return Center(child: Text(snapchot.error.toString()));
         else if (snapchot.connectionState==ConnectionState.waiting){
           return Center(child: CircularProgressIndicator());
         }
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
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
        ) ;
       } ,
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Text(''));
  }
}
