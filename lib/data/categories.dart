import 'movie__details.dart';

/// genres : [{"id":28,"name":"Action"}]

class Categories {
  Categories({
      this.genres,});

  Categories.fromJson(dynamic json) {
    message = json["message"];
    code = json["code"];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 28
/// name : "Action"

