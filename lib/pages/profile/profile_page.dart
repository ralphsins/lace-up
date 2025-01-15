import 'package:flutter/material.dart';
import 'package:senior_shabeb/pages/list-venues/list_venues.dart';
import 'package:senior_shabeb/pages/notifications/notification_page.dart';
import 'package:senior_shabeb/pages/personal-info/personal_information.dart';
import 'package:senior_shabeb/pages/privacy-settings/privacy_settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "images/slei.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sleiman El Ahmad',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Show profile',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Container(
            clipBehavior: Clip.hardEdge,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LaceUp is your place',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "It's simple to get set up and start earning.",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'images/field.png',
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Settings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              SettingsTile(
                leadingIcon: Icons.person_outline,
                title: "Personal Information",
                destination: PersonalInformation(),
              ),
              SizedBox(height: 20),
              SettingsTile(
                leadingIcon: Icons.shield_outlined,
                title: "Privacy Settings",
                destination: PrivacySettings(),
              ),
              SizedBox(height: 20),
              SettingsTile(
                leadingIcon: Icons.notifications_outlined,
                title: "Notifications",
                destination: NotificationPage(),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Hosting",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const SettingsTile(
            leadingIcon: Icons.add_home_outlined,
            title: "List your venues",
            destination: ListVenues(),
            withArrow: false,
          )
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget destination;
  final bool withArrow;

  const SettingsTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.destination,
      this.withArrow = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                leadingIcon,
                size: 34,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          withArrow
              ? const Icon(Icons.arrow_forward_ios)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
