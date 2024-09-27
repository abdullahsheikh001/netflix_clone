import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/Controller/favoritecontroller.dart';

class Favoritescreen extends StatefulWidget {
  const Favoritescreen({super.key});

  @override
  State<Favoritescreen> createState() => _FavoritescreenState();
}

class _FavoritescreenState extends State<Favoritescreen> {
  final Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child:  Text(
            "Favorites",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (favoritecontroller.favoritelist.isEmpty) {
          return const Center(
            child: Text(
              "No Favorites Added",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: favoritecontroller.favoritelist.length,
          itemBuilder: (context, index) {
            final favorite = favoritecontroller.favoritelist[index];

            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${favorite.posterPath}',
                  height: 100,
                  width: 70,
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                favorite.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  favoritecontroller.removeFromFavorite(favorite);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
