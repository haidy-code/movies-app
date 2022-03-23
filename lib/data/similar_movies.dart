import 'package:movies_app/data/popular_movies.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":null,"genre_ids":[28],"id":106912,"original_language":"en","original_title":"Darna! Ang Pagbabalik","overview":"Valentina, Darna's snake-haired arch enemy, is trying to take over the Phillipines through subliminal messages on religious TV shows. Darna has her own problems, however, as she has lost her magic pearl and with it the ability to transform into her scantily clad super self. Trapped as her alter-ego, the plucky reporter Narda, she must try to regain the pearl and foil Valentina's plans.","release_date":"1994-05-09","poster_path":null,"popularity":1.012564,"title":"Darna: The Return","video":false,"vote_average":0,"vote_count":0}]
/// total_pages : 9
/// total_results : 168

class SimilarMovies {
  SimilarMovies({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  SimilarMovies.fromJson(dynamic json) {
    page = json['page'];
    code = json['code'];
    message = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['code'] = code;
    map['message'] = message;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : null
/// genre_ids : [28]
/// id : 106912
/// original_language : "en"
/// original_title : "Darna! Ang Pagbabalik"
/// overview : "Valentina, Darna's snake-haired arch enemy, is trying to take over the Phillipines through subliminal messages on religious TV shows. Darna has her own problems, however, as she has lost her magic pearl and with it the ability to transform into her scantily clad super self. Trapped as her alter-ego, the plucky reporter Narda, she must try to regain the pearl and foil Valentina's plans."
/// release_date : "1994-05-09"
/// poster_path : null
/// popularity : 1.012564
/// title : "Darna: The Return"
/// video : false
/// vote_average : 0
/// vote_count : 0

