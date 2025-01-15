import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Where's your place located?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            )),
        const SizedBox(height: 20),
        Container(
          height: 580,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       blurRadius: 5,
          //       offset: const Offset(0, 2),
          //     ),
          //   ],
          // ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/map.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text(
                          "Map image not available",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.location_on, color: AppColors.primary),
                    hintText: "Enter your location",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
