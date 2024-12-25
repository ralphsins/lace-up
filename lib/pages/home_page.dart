import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';
import 'package:senior_shabeb/data/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[indexMenu]['destination'] as Widget,
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(menu.length, (index) {
            Map items = menu[index];
            bool isActive = indexMenu == index;
            return Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        indexMenu = index;
                      });
                    },
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Icon(
                            items['icon'],
                            color: isActive ? AppColors.primary : Colors.black,
                            size: 25,
                          ),
                          if (isActive) const SizedBox(height: 7),
                          if (isActive)
                            Container(
                              height: 5,
                              width: 15,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                        ],
                      ),
                    )));
          }),
        ),
      ),
    );
  }
}
