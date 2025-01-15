import 'package:flutter/material.dart';
import 'package:senior_shabeb/widgets/custom_list_tile.dart';

class PrivacySettings extends StatefulWidget {
  const PrivacySettings({super.key});

  @override
  State<PrivacySettings> createState() => _PrivacySettingsState();
}

class _PrivacySettingsState extends State<PrivacySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy and sharing"),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justoEros a eget nisl risus ac. Consequat pellentesque amet aenean pellentesque egestas massa.",
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ),
          SizedBox(height: 10),
          CustomListTile(
            title: "Request your personal data",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo.",
            trailing: Icon(Icons.chevron_right),
          ),
          CustomListTile(
            title: "Delete your account",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo.",
            trailing: Icon(Icons.chevron_right),
          ),
          CustomListTile(
            title: "Sharing",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo.",
            trailing: Icon(Icons.chevron_right),
          ),
          CustomListTile(
            title: "Service",
            subtitle:
                "Lorem ipsum dolor sit amet consectetur. Elit velit in siteu amet justo.",
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
