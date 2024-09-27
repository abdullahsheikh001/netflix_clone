
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/Controller/favoritecontroller.dart';
import 'package:netflix_clone/model/Tvseriesmodel.dart';
  
class Tvseriesdetail extends StatefulWidget{
  const Tvseriesdetail({super.key, required this.tvseriesmodel});
  final Tvseriesmodel tvseriesmodel;

  @override
  State<Tvseriesdetail> createState() => _PopmovnetflixState();
}

class _PopmovnetflixState extends State<Tvseriesdetail> {
  final Favoritecontroller favoritecontroller = Get.put(Favoritecontroller());
  @override
  Widget build(BuildContext context) {
   
   return  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image with Hero Animation
          Hero(
            tag: widget.tvseriesmodel.title, // Unique tag for Hero animation
            child: Container(
              width: double.infinity,
              height: 600, // Image height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${widget.tvseriesmodel.posterPath}",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),

          // Scrollable content below the image
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 500),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title
                  Text(
                    widget.tvseriesmodel.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Movie genre and runtime (you can pass them from API)
                  Text(
                    'Genre: Action, Adventure', // Replace with actual data
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Runtime: 120 mins', // Replace with actual data
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Overview/Description
                  Text(
                    widget.tvseriesmodel.overview,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),

                  // "Watch Now" and "Add to Favorites" Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Watch Now',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                       ElevatedButton.icon(
                        onPressed: () {
                          favoritecontroller.addToFavorite(widget.tvseriesmodel);

                          Get.snackbar("Sucess", "Add to favorite screen",
                              backgroundColor: Colors.grey,
                              colorText: Colors.white,
                              icon: const Icon(Icons.add_alert, color: Colors.white,));
                        },
                        icon: Obx((){
                         return Icon(favoritecontroller.isFavorite(widget.tvseriesmodel)
                            ? Icons.favorite
                            : Icons.favorite_border);
                        }),
                        label: const Text(
                          'Add to Favorites',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Ensure the back button is on top
          Positioned(
            top: 40,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Get.back(); // Back navigation
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}