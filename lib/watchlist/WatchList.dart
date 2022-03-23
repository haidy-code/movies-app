import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/FirebaseUtils.dart';
import 'package:movies_app/data/popular_movies.dart';
import 'package:movies_app/search/SearchItem.dart';
import 'package:movies_app/watchlist/WatchListItem.dart';

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot<Results>>(
        stream:getmoviesCollectionWithConverter()
        .snapshots() ,
    builder:(context, AsyncSnapshot<QuerySnapshot<Results>> snapshot){
    if (snapshot.hasError) {
    print('${snapshot.error}');
    return Text('Error loading movies');
    } else if (snapshot.connectionState ==
    ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator());
    }
    List<Results> movies = snapshot.data!.docs
        .map((documents) => documents.data())//function btlf 3la kol documents w tgeb data ally gwahom fkda hatgeb almovie
        .toList();
    return ListView.builder(itemBuilder: (context,index){
    return WatchListItem(movies[index]);
    },itemCount: movies.length,);
    } ,
    ));
  }
}
