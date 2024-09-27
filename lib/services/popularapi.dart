import 'dart:convert';

import 'package:get/get.dart';
import 'package:netflix_clone/model/popularmodel.dart';
import 'package:http/http.dart' as https;

class Popularmoviecontroller extends GetxController{
 var popularmovies = <PopularMovie>[].obs;
  

   @override
  void onInit() {
    fetchpopular();
    super.onInit();
    
  }

  Future<void> fetchpopular() async {
  try {
    final response = await https.get(
      Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=fc33e58a6725938a92c3d7682f88df98"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> popularmovielist = jsonDecode(response.body)["results"];
      popularmovies.value = popularmovielist.map((json) => PopularMovie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load popular API data");
    }
  } catch (e) {
    print(e.toString());
  }
}

}