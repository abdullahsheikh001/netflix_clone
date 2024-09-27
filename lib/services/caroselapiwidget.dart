import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/model/caroselmodel.dart';

class Moviecontoller extends GetxController {
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
    
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=fc33e58a6725938a92c3d7682f88df98"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> movielist = jsonDecode(response.body)["results"];
        movies.value = movielist.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load now playing movies");
      }
    } catch (e) {
      // Handle errors
      print("Error fetching movies: $e");
    }
  }
}
