import 'package:flutter/material.dart';

class Catagorywidget extends StatefulWidget {
  const Catagorywidget({super.key});

  @override
  State<Catagorywidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Catagorywidget> {
  final List<String> catagorylist = [
    "Netflix Originals",
    "Trending Now",
    "Popular Movies",
    "Top Picks for You",
    "My List",
    "Recently Watched",
    "Action Movies",
    "Comedy Series",
    "Documentaries",
    "Horror Films",
    "Romantic Favorites",
    "Kids' Shows",
    "New Releases",
    "Coming Soon",
    "Watch Again",
    "Sci-Fi & Fantasy",
    "Drama Series",
    "Classic Movies",
    "Binge Worthy",
    "Award Winners",
  ];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: catagorylist.asMap().entries.map((entry) {
        int catalog = entry.key;
        String selected = entry.value;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedindex = catalog;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: catalog == selectedindex ? Colors.transparent : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              selected,
              style: TextStyle(
                color: catalog == selectedindex ? Colors.red : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
