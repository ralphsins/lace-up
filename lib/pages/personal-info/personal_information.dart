import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  String email = "example@email.com";
  String phoneNumber = "123-456-7890";
  String address = "123 Main St.";
  String emergencyContact = "987-654-3210";
  File? personalIdImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        personalIdImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Info"),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                const _CustomListTile(
                  title: "Legal Name",
                  subtitle: "Sleiman El Ahmad",
                ),
                const _CustomListTile(
                  title: "Gender",
                  subtitle: "Female",
                ),
                _CustomListTile(
                  title: "Email",
                  subtitle: email,
                  hasEditOption: true,
                  onEditTap: () => _showEditDialog(
                    context,
                    "Email",
                    email,
                    (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                _CustomListTile(
                  title: "Phone Number",
                  subtitle: phoneNumber,
                  hasEditOption: true,
                  onEditTap: () => _showEditDialog(
                    context,
                    "Phone Number",
                    phoneNumber,
                    (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                  ),
                ),
                _CustomListTile(
                  title: "Address",
                  subtitle: address,
                  hasEditOption: true,
                  onEditTap: () => _showEditDialog(
                    context,
                    "Address",
                    address,
                    (value) {
                      setState(() {
                        address = value;
                      });
                    },
                  ),
                ),
                _CustomListTile(
                  title: "Emergency Contact",
                  subtitle: emergencyContact,
                  hasEditOption: true,
                  onEditTap: () => _showEditDialog(
                    context,
                    "Emergency Contact",
                    emergencyContact,
                    (value) {
                      setState(() {
                        emergencyContact = value;
                      });
                    },
                  ),
                ),
                _CustomListTile(
                  title: "Personal ID",
                  subtitle: personalIdImage == null
                      ? "Upload Image"
                      : personalIdImage!.path.split('/').last,
                  hasEditOption: true,
                  onEditTap: _pickImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to show the edit dialog
  void _showEditDialog(BuildContext context, String title, String currentValue,
      Function(String) onSave) {
    final TextEditingController controller =
        TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter your $title"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text); // Save the new value
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool hasEditOption;
  final VoidCallback? onEditTap;

  const _CustomListTile({
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
