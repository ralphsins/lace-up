import 'package:flutter/material.dart';
import 'package:senior_shabeb/pages/Explore/explore_appBar.dart';
import 'package:senior_shabeb/pages/lobies/lobby_card.dart';

class Lobies extends StatefulWidget {
  const Lobies({super.key});

  @override
  State<Lobies> createState() => _LobiesState();
}

class _LobiesState extends State<Lobies> {
  final List<Map<String, String>> lobbies = [
    {
      'title': 'Lorem ipsum',
      'description': 'Game description 1',
      'host': 'Host 1',
      'players': '9/12',
      'image': 'images/test.jpg',
    },
    {
      'title': 'Dolor sit amet',
      'description': 'Game description 2',
      'host': 'Host 2',
      'players': '7/12',
      'image': 'images/test.jpg',
    },
    {
      'title': 'Consectetur adipiscing',
      'description': 'Game description 3',
      'host': 'Host 3',
      'players': '10/12',
      'image': 'images/test.jpg',
    },
    {
      'title': 'Elit sed do eiusmod',
      'description': 'Game description 4',
      'host': 'Host 4',
      'players': '12/12',
      'image': 'images/test.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ExploreAppbar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: lobbies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: LobbyCard(
                    title: lobbies[index]['title']!,
                    description: lobbies[index]['description']!,
                    host: lobbies[index]['host']!,
                    players: lobbies[index]['players']!,
                    image: lobbies[index]['image']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
