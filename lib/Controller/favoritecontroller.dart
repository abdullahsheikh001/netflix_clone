import 'package:get/get.dart';
 
class Favoritecontroller extends GetxController {
  var favoritelist = <dynamic>[].obs; // Observable list

  // Add movie to favorites
  void addToFavorite(dynamic movie) {
    if (!favoritelist.contains(movie)) {
      favoritelist.add(movie);
    }
  }

  // Remove movie from favorites
  void removeFromFavorite(dynamic movie) {
    favoritelist.remove(movie);
  }

  // Check if movie is in favorites
  bool isFavorite(dynamic movie) {
    return favoritelist.contains(movie);
  }
}
