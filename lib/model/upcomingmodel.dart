class UpcomingMoviesmodel {
  List<Upcomingmodel> results;

  UpcomingMoviesmodel({
    required this.results,
  });

  factory UpcomingMoviesmodel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesmodel(
      results: List<Upcomingmodel>.from(json['results'].map((movie) => Upcomingmodel.fromJson(movie))),
    );
  }
}

class Upcomingmodel {
  String posterPath;
  String title;
  String overview;

  Upcomingmodel({
    required this.posterPath,
    required this.title,
    required this.overview,
  });

  factory Upcomingmodel.fromJson(Map<String, dynamic> json) {
    return Upcomingmodel(
      posterPath: json['poster_path'] ?? '',
      title: json['title'],
      overview: json['overview'],
    );
  }
}
