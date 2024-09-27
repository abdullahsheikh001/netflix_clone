import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.transparent,
        title: const Center(
          child:  
             Text(
                  "What’s Flickin’ Today",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              
          ),
        ),
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Form(
              key: GlobalKey(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.chrome,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: const Text("Search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
