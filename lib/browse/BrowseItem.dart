import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movies_app/browse/BrowseDetails.dart';
import 'package:movies_app/data/movie__details.dart';

class BrowseItem extends StatelessWidget {
  Genres genres;


  BrowseItem(this.genres);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,BrowseDetails.routename ,arguments: genres);
      },
      child: Stack(
        children: [
          getimage(genres.name??'', context),
          Container(
            width:200,
            height: 140,
            padding: EdgeInsets.only(top: 65),
            child: Text('${genres.name}',style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
  Widget getimage(String name, BuildContext context) {
   if(name=='Action'){
     return Image.asset('assets/images/act.png',fit: BoxFit.cover,height: 140,width: 200,);}
   else if(name=='Adventure'){
     return Image.asset('assets/images/adventure.png',fit: BoxFit.cover,height: 140,width: 200,);}
   else if(name=='Animation'){
     return Image.asset('assets/images/animation.png',fit: BoxFit.cover,height: 140,width: 200,);}
   else if(name=='Comedy'){
     return Image.asset('assets/images/comedy.png',fit: BoxFit.cover,height: 140,width: 200,);}
   else if(name=='Crime'){
     return Image.asset('assets/images/crime.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Documentary'){
     return Image.asset('assets/images/documentary.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Drama'){
     return Image.asset('assets/images/Drama.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Family'){
     return Image.asset('assets/images/familly.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Fantasy'){
     return Image.asset('assets/images/fantasy.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='History'){
     return Image.asset('assets/images/history.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Horror'){
     return Image.asset('assets/images/Horror.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Music'){
     return Image.asset('assets/images/music.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Mystery'){
     return Image.asset('assets/images/mystery.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Romance'){
     return Image.asset('assets/images/Romance.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Science Fiction'){
     return Image.asset('assets/images/Science.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='TV Movie'){
     return Image.asset('assets/images/tv.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Thriller'){
     return Image.asset('assets/images/thriller.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='War'){
     return Image.asset('assets/images/war.png',fit: BoxFit.cover,height: 140,width: 200);}
   else if(name=='Western'){
     return Image.asset('assets/images/western.png',fit: BoxFit.cover,height: 140,width: 200);}




   print(name);
   return  Image.asset('assets/images/star-2.png',width: 50,height: 50,fit: BoxFit.fill,);
  }

}
