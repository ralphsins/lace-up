import 'package:flutter/material.dart';

class SportsPage extends StatefulWidget {
  final List<int> selectedIndices;
  final Function(int) onSelectSport; 

  const SportsPage({
    super.key,
    required this.selectedIndices,
    required this.onSelectSport,
  });

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  final List<Map<String, dynamic>> sports = [
    {'name': 'Football', 'icon': Icons.sports_football},
    {'name': 'Basketball', 'icon': Icons.sports_basketball},
    {'name': 'Tennis', 'icon': Icons.sports_tennis},
    {'name': 'Cricket', 'icon': Icons.sports_cricket},
    {'name': 'Baseball', 'icon': Icons.sports_baseball},
    {'name': 'Badminton', 'icon': Icons.sports},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Which of these sports will your venue host?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16), // Spacing between title and grid
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: sports.length,
            shrinkWrap:
                true, // To make sure GridView doesn't take too much space
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              bool isSelected = widget.selectedIndices.contains(index);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      widget
                          .onSelectSport(index); // Remove from selectedIndices
                    } else {
                      widget.onSelectSport(index); // Add to selectedIndices
                    }
                  });
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: isSelected
                          ? Colors.green
                          : Colors
                              .grey, // Green border when selected, grey otherwise
                      width: 2,
                    ),
                  ),
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(sports[index]['icon'],
                          size: 50,
                          color: isSelected ? Colors.black : Colors.grey),
                      const SizedBox(height: 8),
                      Text(
                        sports[index]['name'],
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
