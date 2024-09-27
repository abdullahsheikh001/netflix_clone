import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/Screens/Favoritescreen.dart';
import 'package:netflix_clone/Screens/Searchscreen.dart';
import 'package:netflix_clone/Screens/caroseldetailscreen.dart';
import 'package:netflix_clone/Screens/popmovnetflix.dart';
import 'package:netflix_clone/Screens/tvseriesdetail.dart';
import 'package:netflix_clone/Screens/upcomingdetail.dart';
import 'package:netflix_clone/Widget/Catagorywidget.dart';
import 'package:netflix_clone/services/caroselapiwidget.dart';
import 'package:netflix_clone/services/popularapi.dart';
import 'package:netflix_clone/services/tveriesapi.dart';
import 'package:netflix_clone/services/upcomingmovieapi.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homedetail(),
    const Searchscreen(),
    const Favoritescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey
            .withOpacity(0.1), // Netflix-like black navbar background
        selectedItemColor: Colors.white, // Highlight the selected item in white
        unselectedItemColor: Colors.grey, // Non-selected items in grey
        currentIndex: _currentIndex, // Set the current active tab
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active tab when clicked
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            activeIcon: FaIcon(FontAwesomeIcons.heart, color: Colors.white),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

class Homedetail extends StatefulWidget {
  const Homedetail({super.key});

  @override
  State<Homedetail> createState() => _HomedetailState();
}

class _HomedetailState extends State<Homedetail> with TickerProviderStateMixin {
  final Moviecontoller moviecontoller = Get.put(Moviecontoller());
  final Popularmoviecontroller popularmoviecontroller =
      Get.put(Popularmoviecontroller());
  final Tvcontroller tvcontroller = Get.put(Tvcontroller());
  final Upcomingmovieapicontroller upcomingmovieapicontroller =
      Get.put(Upcomingmovieapicontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/netflixlogo.png",
            fit: BoxFit.cover,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Catagorywidget(),
          ),
        ),
        toolbarHeight: 80,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: Obx(() {
                if (moviecontoller.movies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CarouselSlider.builder(
                  itemCount: moviecontoller.movies.length,
                  itemBuilder: (context, index, realIndex) {
                    final movie = moviecontoller.movies[index];
                    return InkWell(
                      onTap: () {
                        Get.to(
                          Caroseldetailscreen(movie: movie),
                          transition: Transition.circularReveal,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 10,
                    viewportFraction: 0.8,
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 100),
              child: Text(
                "Popular Movies on Netflix",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (popularmoviecontroller.popularmovies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularmoviecontroller.popularmovies.length,
                  itemBuilder: (context, index) {
                    final popularMovie =
                        popularmoviecontroller.popularmovies[index];
                    return InkWell(
                      onTap: () {
                        Get.to(
                          Popmovnetflix(popularMovie: popularMovie),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${popularMovie.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 180),
              child: Text(
                "Popular Tv Series ",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (tvcontroller.tvseries.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvcontroller.tvseries.length,
                  itemBuilder: (context, index) {
                    final tvseries = tvcontroller.tvseries[index];
                    return InkWell(
                      onTap: () {
                        Get.to(Tvseriesdetail(tvseriesmodel: tvseries),
                            transition: Transition.downToUp,
                            duration: const Duration(seconds: 1));
                      },
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(tvseries.posterPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 180),
              child: Text(
                "Upcoming Movies",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (upcomingmovieapicontroller.upcomingmovies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingmovieapicontroller.upcomingmovies.length,
                  itemBuilder: (context, index) {
                    final upcomingmovies =
                        upcomingmovieapicontroller.upcomingmovies[index];
                    return InkWell(
                      onTap: () {
                        Get.to(Upcomingdetail(upcoming: upcomingmovies),
                            transition: Transition.leftToRight,
                            duration: const Duration(seconds: 1));
                      },
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${upcomingmovies.posterPath}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
