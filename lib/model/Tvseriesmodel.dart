class Tvseriesmodel {
  final String title;
  final String posterPath;
  final String overview;

  Tvseriesmodel({
    required this.title,
    required this.posterPath,
    required this.overview
  });

  factory Tvseriesmodel.fromJson(Map<String, dynamic> json) {
    return Tvseriesmodel(
      title: json['name'], // Title of the TV show
      posterPath: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}' // Full URL for the poster image
          : '',
          overview: json["overview"],
    );
  }
}
