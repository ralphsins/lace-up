import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:senior_shabeb/pages/Explore/explore.dart';
import 'package:senior_shabeb/pages/lobies/lobies.dart';

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
    'destination': const Center(child: Text('Notification')),
  },
  {
    'icon': Iconsax.profile_2user5,
    'destination': const Center(child: Text('Profile')),
  },
];
