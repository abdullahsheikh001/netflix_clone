import 'dart:convert';
import 'package:get/get.dart';
import 'package:netflix_clone/model/Tvseriesmodel.dart';
import 'package:http/http.dart' as http;

class Tvcontroller extends GetxController {
  var tvseries = <Tvseriesmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchseries();
  }

  Future<void> fetchseries() async {
    try {
      final response = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=fc33e58a6725938a92c3d7682f88df98"));

      if (response.statusCode == 200) {
        final List<dynamic> tvserieslist = jsonDecode(response.body)["results"];
        // Map the JSON data to your model and assign it directly to the observable list
        tvseries.value = tvserieslist.map((json) => Tvseriesmodel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load TV series API");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
