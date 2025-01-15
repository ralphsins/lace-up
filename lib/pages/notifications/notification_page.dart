import 'package:flutter/material.dart';
import 'package:senior_shabeb/widgets/custom_list_tile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Offers and updates",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          const CustomListTile(
            title: "Booking tips and offers",
            subtitle: "Booking tips and offers",
          ),
          CustomListTile(
            title: "Inspiration and offers",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
          CustomListTile(
            title: "Trip planning",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomListTile(
            title: "LaceUp updates",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo. Eros a eget nisl risus ac.",
          ),
          CustomListTile(
            title: "New and programs",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
          CustomListTile(
            title: "Feedback",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
          CustomListTile(
            title: "Booking regulations",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomListTile(
            title: "Unsubscribe from all offers and updates",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo. Eros a eget nisl risus ac.",
          ),
          CustomListTile(
            title: "All offers and updates",
            subtitle: "On: Email and Push",
            hasEditOption: true,
            onEditTap: () {},
          ),
        ],
      ),
    );
  }
}
