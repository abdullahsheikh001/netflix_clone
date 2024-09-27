import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:netflix_clone/model/upcomingmodel.dart';

class Upcomingmovieapicontroller extends GetxController {
  var upcomingmovies = <Upcomingmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchupcoming();
  }

  Future<void> fetchupcoming() async {
    try {
      final response = await https.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=fc33e58a6725938a92c3d7682f88df98"));

      if (response.statusCode == 200) {
        final List<dynamic> upcominglist = jsonDecode(response.body)["results"];

        upcomingmovies.value =
            upcominglist.map((json) => Upcomingmodel.fromJson(json)).toList();
      } else {
        print('Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching upcoming movies: ${e.toString()}');
    }
  }
}
