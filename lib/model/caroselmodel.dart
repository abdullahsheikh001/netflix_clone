class Movie {
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final double votecount;

  Movie({
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.votecount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'Unknown Title', // Provide default value
      posterPath: json['poster_path'] ?? 'path/to/default/image.jpg', // Provide default image path
      overview: json['overview'] ?? 'No overview available', // Provide default overview
      releaseDate: json['release_date'] ?? 'Unknown Release Date', // Provide default release date
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0, // Default popularity to 0.0 if null
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      votecount: (json['vote_count'] as num?)?.toDouble() ?? 0.0, // Default vote average to 0.0 if null
    );
  }
}
