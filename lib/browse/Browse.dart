import 'package:flutter/material.dart';
import 'package:movies_app/browse/BrowseItem.dart';
import 'package:movies_app/data/ApiManager.dart';
import 'package:movies_app/data/categories.dart';

class Browse extends StatelessWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.only(top: 30),
             // padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Browse Category',style: Theme.of(context).textTheme.headline4,)),
          FutureBuilder<Categories>(future: ApiManager.loadCategoryMovies()
              ,builder: (buildcontext,snapchot){
            if(snapchot.hasError)
              return Center(child: Text('${snapchot.error}'));
            else if(snapchot.connectionState==ConnectionState.waiting)
              return Center(child: CircularProgressIndicator()) ;
            return Expanded(child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 0),
                itemBuilder: (contextt,index){
          return BrowseItem(snapchot.data!.genres![index]) ;
            },itemCount: snapchot.data?.genres?.length??0,)) ;
              })
        ],
      ),
    );
  }
}
