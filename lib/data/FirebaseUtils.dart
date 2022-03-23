import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/data/popular_movies.dart';

CollectionReference<Results> getmoviesCollectionWithConverter() {
  return FirebaseFirestore.instance
      .collection(Results.collectionname)
      .withConverter(
      fromFirestore: (snapshot, _) => Results.fromJson(snapshot.data()!),
      toFirestore: (results, _) => results.toJson());
}

Future<void> addMoviesToFirestore(int id,String title, String posterpath,String releasedate,bool isdone) { //3amlt almethod futue 3shan 3o2bal maidaf fe fire base
  CollectionReference<Results> collectionReference =
  getmoviesCollectionWithConverter();
  DocumentReference<Results> documentReference =
  collectionReference.doc(); //bi3ml object w ygenerate al id 3shan asta5dmo
  Results movie= Results(
    id: id,
      fireid: documentReference.id,posterPath: posterpath ,title: title,releaseDate:releasedate ,isdone: isdone);

  return documentReference.set(movie);//3shan yktb alobject fe database

}
Future<void> deleteMovie(Results movie){
  CollectionReference<Results> collectionReference =getmoviesCollectionWithConverter();
  DocumentReference<Results> documentReference =  collectionReference.doc(movie.fireid);//.d0c()bs bt3ml object gded anma ana badelha alid 3shan a2olha men alobject
  return documentReference.delete();

}
editisdoneoftask(Results movie,bool isdone){
  CollectionReference<Results> collectionReference =getmoviesCollectionWithConverter();
  collectionReference.doc(movie.fireid).update({'isDone':isdone});
}