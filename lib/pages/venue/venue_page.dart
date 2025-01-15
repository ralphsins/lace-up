import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';
import 'package:senior_shabeb/pages/venue/map/map_page.dart';
import 'package:senior_shabeb/pages/venue/sports/sports_page.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  int indexMenu = 0; // Track current page index
  final int totalSteps = 7; // Total number of steps in the form
  final List<int> selectedIndices = []; // List to store selected sports

  // List to hold the form pages (replace with your actual pages)
  final List<Map<String, dynamic>> menu = [
    {'destination': const Placeholder(), 'title': 'Step 1'},
    {'destination': const MapPage(), 'title': 'Step 2'},
    {'destination': Container(), 'title': 'Step 3'},
    {'destination': Container(), 'title': 'Step 4'},
    {'destination': Container(), 'title': 'Step 5'},
    {'destination': Container(), 'title': 'Step 6'},
    {'destination': Container(), 'title': 'Step 7'},
  ];

  void nextPage() {
    if (indexMenu < totalSteps - 1) {
      setState(() {
        indexMenu++;
      });
    }
  }

  void previousPage() {
    if (indexMenu > 0) {
      setState(() {
        indexMenu--;
      });
    }
  }

  // Function to update selected sport indices
  void updateSelectedIndices(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index); // Remove index if already selected
      } else {
        selectedIndices.add(index); // Add index to selected list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamically update the destination of Step 1 (SportsPage)
    menu[0]['destination'] = SportsPage(
      selectedIndices: selectedIndices,
      onSelectSport: updateSelectedIndices,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(menu[indexMenu]['title']),
      ),
      body:
          menu[indexMenu]['destination'] as Widget, // Show current page content

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: (indexMenu + 1) / totalSteps,
            color: AppColors.primary,
            backgroundColor: Colors.grey[300],
            minHeight: 10,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button using MaterialButton
                MaterialButton(
                  onPressed: previousPage,
                  color: Colors.grey[300],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('Previous'),
                ),
                // Next Button using MaterialButton
                MaterialButton(
                  onPressed: selectedIndices.isNotEmpty
                      ? nextPage
                      : null, // Disable if no sport is selected
                  color: selectedIndices.isNotEmpty
                      ? AppColors.primary
                      : Colors.grey, // Change color when disabled
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: selectedIndices.isNotEmpty
                          ? Colors.white
                          : Colors.black38, // Change text color when disabled
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
