import 'package:flutter/material.dart';
import 'package:senior_shabeb/pages/venue/venue_page.dart';
import 'package:senior_shabeb/widgets/common_button.dart';
import 'package:senior_shabeb/widgets/custom_list_tile.dart';

class ListVenues extends StatefulWidget {
  const ListVenues({super.key});

  @override
  State<ListVenues> createState() => _ListVenuesState();
}

class _ListVenuesState extends State<ListVenues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(40),
        child: CommonButton(
            onTab: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VenuePage()));
            },
            title: "Get Started"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 30),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "It's easy to get started on LaceUp",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              )),
          const SizedBox(height: 30),
          CustomListTile(
            title: '1.Tell us about your place',
            subtitle:
                "Share some basic info, like where it is and how many players can attend.",
            trailing: Image.asset('images/field.png'),
          ),
          const SizedBox(height: 30),
          CustomListTile(
            title: '2.Make it stand out',
            subtitle:
                "Add 5 or more photos plus a title and description - we'll help you out!",
            trailing: Image.asset('images/camera.png'),
          ),
          const SizedBox(height: 30),
          CustomListTile(
            title: '3.Finish up and publish',
            subtitle:
                "Share some basic info, like where it is and how many players can attend.",
            trailing: Image.asset('images/flags.png'),
          ),
        ],
      ),
    );
  }
}
