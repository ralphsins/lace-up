import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senior_shabeb/widgets/custom_list_tile.dart';

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
                const CustomListTile(
                  title: "Legal Name",
                  subtitle: "Sleiman El Ahmad",
                ),
                const CustomListTile(
                  title: "Gender",
                  subtitle: "Female",
                ),
                CustomListTile(
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
                CustomListTile(
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
                CustomListTile(
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
                CustomListTile(
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
                CustomListTile(
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
