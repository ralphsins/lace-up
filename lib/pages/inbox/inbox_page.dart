import 'package:flutter/material.dart';
import 'package:senior_shabeb/pages/inbox/inbox_tab.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final List<Map<String, String>> notifications = [
    {
      "name": "Ahmad El Sayed",
      "username": "@ahmd.mp3",
      "time": "5 min ago",
      "message":
          "Lorem ipsum dolor sit amet consectetur non arcu non mauris quis diam lectus commodo.",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Sarah Khan",
      "username": "@sarahk",
      "time": "10 min ago",
      "message":
          "Quick update: your reservation has been confirmed! Let us know if you need help.",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "John Doe",
      "username": "@johndoe",
      "time": "30 min ago",
      "message":
          "Hello! I just wanted to check in and see if you have any updates on the booking.",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Emily Brown",
      "username": "@emilyb",
      "time": "1 hour ago",
      "message":
          "Your payment has been received successfully. Thank you for your reservation!",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Michael Smith",
      "username": "@msmith",
      "time": "2 hours ago",
      "message":
          "Can you provide more details about the amenities available at the property?",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Olivia Johnson",
      "username": "@oliviaj",
      "time": "5 hours ago",
      "message":
          "The host has responded to your inquiry. Please check your messages for details.",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "Chris Evans",
      "username": "@chrisev",
      "time": "Yesterday",
      "message":
          "Hope you're doing well! Let us know if you need any help with the check-in process.",
      "image":
          "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=880&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        elevation: 1,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "When you contact a host or send a reservation request, you'll see your messages here.",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return InboxTab(data: notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
