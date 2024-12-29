import 'package:flutter/material.dart';
import 'package:senior_shabeb/pages/Explore/explore_appBar.dart';
import 'package:senior_shabeb/pages/Explore/explore_item.dart';
import 'package:senior_shabeb/pages/book/book_venue.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int index = 0;

  List<Map<String, dynamic>> exploreData = [
    {
      "images": ["test.jpg", "test.jpg", "img.jpeg", "img.jpeg"],
      "title": "Go Futsal, Dam w Farez",
      "rating": 4.94,
      "distance": "3 Kilometers away",
      "price": "\$50 USD/hour",
    },
    // Add more data entries here
    {
      "images": ["test.jpg", "test.jpg", "img.jpeg", "img.jpeg"],
      "title": "Soccer Field, Beirut",
      "rating": 4.8,
      "distance": "5 Kilometers away",
      "price": "\$40 USD/hour",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExploreAppbar(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: exploreData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          BookVenue(data: exploreData[index])));
                },
                child: ExploreItem(
                  imagesName: exploreData[index]["images"] ?? '',
                  title: exploreData[index]["title"] ?? '',
                  rating: exploreData[index]["rating"] ?? '',
                  distance: exploreData[index]["distance"] ?? '',
                  price: exploreData[index]["price"] ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
