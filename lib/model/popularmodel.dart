class PopularMovie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  PopularMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview
  });

  // Factory method to create a Movie instance from JSON
  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json["overview"],
    );
  }
}
