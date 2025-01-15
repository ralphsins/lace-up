import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool hasEditOption;
  final VoidCallback? onEditTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.hasEditOption = false,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontWeight: FontWeight.w300),
      ),
      trailing: hasEditOption
          ? InkWell(
              onTap: onEditTap,
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          : null,
    );
  }
}
