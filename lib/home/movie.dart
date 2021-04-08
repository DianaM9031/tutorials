import 'dart:convert';

class Movie {
  String? title;
  String? posterPath;

  Movie({this.title, this.posterPath});

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200/$posterPath';

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path']
    );
  }

  Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

  String movieToJson(Movie data) => json.encode(data.toJson());
}