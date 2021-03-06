import 'dart:convert';

Popular PopularFromJson(String str) {
  final jsonData = json.decode(str);
  return new Popular.fromJson(jsonData);
}

class Popular {
  int page;
  List<Results> results;
  int total_results;
  int total_pages;

  Popular({this.page, this.results, this.total_pages, this.total_results});

  factory Popular.fromJson(Map<String, dynamic> json) {
//    List<Results> temp = [];
//    for (int i = 0; i < json['results'].length; i++) {
//      Results result = Results.fromJson(json['results'][i]);
//      temp.add(result);
//    }
//    List<Results> results = temp;

    var list = json["results"] as List;
    List<Results> results = list.map((i) => Results.fromJson(i)).toList() ;

    return new Popular(
      page: json["page"],
      results: results,
      total_results: json["total_results"],
      total_pages: json["total_pages"],
    );
  }
}

class Results {
  String poster_path;
  bool adult;
  String overview;
  String release_date;
  List<int> genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String backdrop_path;
  double popularity;
  int vote_count;
  bool video;
  double vote_average;

  Results(
      {this.poster_path,
      this.adult,
      this.overview,
      this.release_date,
      this.genre_ids,
      this.id,
      this.original_title,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.video,
      this.vote_average});

  factory Results.fromJson(Map<String, dynamic> json) {
    List<int> _genre_ids = [];

    for (int i = 0; i < json['genre_ids'].length; i++) {
      _genre_ids.add(json['genre_ids'][i]);
    }

    return new Results(
        poster_path: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        release_date: json["release_date"],
        genre_ids: _genre_ids,
        id: json["id"],
        original_title: json["original_title"],
        original_language: json["original_language"],
        title: json["title"],
        backdrop_path: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        vote_count: json["vote_count"],
        video: json["video"],
        vote_average: json["vote_average"].toDouble());
  }
}
