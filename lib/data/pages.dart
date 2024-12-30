import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:senior_shabeb/pages/notifications/notifications_page.dart';
import 'package:senior_shabeb/pages/Explore/explore.dart';
import 'package:senior_shabeb/pages/lobies/lobies.dart';
import 'package:senior_shabeb/pages/profile/profile_page.dart';

final menu = [
  {
    'icon': Iconsax.home5,
    'destination': const Explore(),
  },
  {
    'icon': Iconsax.heart,
    'destination': const Center(child: Text('Favorite')),
  },
  {
    'icon': Iconsax.book_square,
    'destination': const Lobies(),
  },
  {
    'icon': Iconsax.notification,
    'destination': const NotificationsPage(),
  },
  {
    'icon': Iconsax.profile_2user5,
    'destination': const ProfilePage(),
  },
];
