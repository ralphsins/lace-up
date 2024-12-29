import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';
import 'package:senior_shabeb/pages/Explore/explore_item.dart';

class BookVenue extends StatefulWidget {
  final data;
  const BookVenue({super.key, required this.data});

  @override
  State<BookVenue> createState() => _BookVenueState();
}

class _BookVenueState extends State<BookVenue> {
  final TextEditingController _lobbyNameController = TextEditingController();
  final TextEditingController _hostNameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _playersController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String _selectedTopic = 'Football';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book the venue"),
        elevation: 4.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                ExploreItem(
                  imagesName: widget.data["images"],
                  title: widget.data["title"],
                  rating: widget.data["rating"],
                  distance: widget.data["distance"],
                  price: widget.data["price"],
                ),
                const Text(
                  "Where you'll be",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset('images/image.png'),
                ),
                const Text(
                  "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Show more",
                  style: TextStyle(color: Colors.black45),
                ),
                const Text(
                  "Show more >",
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Create a Lobby"),
                      content: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: _lobbyNameController,
                                decoration: const InputDecoration(
                                  labelText: "Lobby Name",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _hostNameController,
                                decoration: const InputDecoration(
                                  labelText: "Host Name",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                value: _selectedTopic,
                                decoration: const InputDecoration(
                                  labelText: "Topic",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                                items: ['Football', 'Basketball', 'Tennis']
                                    .map((topic) => DropdownMenuItem<String>(
                                          value: topic,
                                          child: Text(topic),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedTopic = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _durationController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: "Duration (minutes)",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _playersController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: "Number of Players",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _noteController,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  labelText: "Lobby Note",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle lobby creation logic
                            Navigator.of(context).pop(); // Close the dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Lobby successfully created!"),
                              ),
                            );
                          },
                          child: const Text("Create"),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: AppColors.primary,
              ),
              child: const Text(
                "Create a lobby",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
