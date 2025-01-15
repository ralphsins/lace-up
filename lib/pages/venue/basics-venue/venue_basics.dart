import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';

class VenueBasics extends StatefulWidget {
  const VenueBasics({super.key});

  @override
  State<VenueBasics> createState() => _VenueBasicsState();
}

class _VenueBasicsState extends State<VenueBasics> {
  int courts = 1; // Initial value for courts
  int capacity = 1; // Initial value for capacity

  // Function to update court value
  void _updateCourts(int change) {
    setState(() {
      courts += change;
      if (courts < 0) courts = 0; // Ensure courts do not go below 0
    });
  }

  // Function to update capacity value
  void _updateCapacity(int change) {
    setState(() {
      capacity += change;
      if (capacity < 0) capacity = 0; // Ensure capacity does not go below 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "Share some basics about your venue",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, // Gray color for the bottom border
                width: 1, // Border width
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Courts',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _updateCourts(-1),
                    icon: const Icon(Icons.remove_circle_outline,
                        color: Colors.black45),
                  ),
                  Text(
                    "$courts", // Display the current courts value
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () => _updateCourts(1),
                    icon: const Icon(Icons.add_circle_outline,
                        color: AppColors.primary),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, // Gray color for the bottom border
                width: 1, // Border width
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Capacity',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _updateCapacity(-1),
                    icon: const Icon(Icons.remove_circle_outline,
                        color: Colors.black45),
                  ),
                  Text(
                    "$capacity", // Display the current capacity value
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 22),
                  ),
                  IconButton(
                    onPressed: () => _updateCapacity(1),
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
