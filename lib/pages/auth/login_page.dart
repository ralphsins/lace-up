import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:senior_shabeb/widgets/AppTextField.dart';
import 'package:senior_shabeb/widgets/common_button.dart';
import 'package:senior_shabeb/widgets/continueWith_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Login or signup to LaceUp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )),
          const SizedBox(
            height: 20,
          ),
          CountryDropdown(
            dataList: [
              SelectedListItem(name: 'Lebanon (+961)', value: 'LB'),
              SelectedListItem(name: 'United States (+1)', value: 'US'),
              SelectedListItem(name: 'Canada (+1)', value: 'CA'),
              // Add more countries here
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          const Text(
              "We'll call or text you to confirm your number. Standard message and data rates apply."),
          const SizedBox(
            height: 15,
          ),
          CommonButton(
              onTab: () {
                Navigator.of(context).pushNamed("home");
              },
              title: "Continue"),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const Text(
              "or",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ContinueWithButton(
            onTab: () {},
            title: "Continue with Email",
            icon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(
            height: 15,
          ),
          ContinueWithButton(
            onTab: () {},
            title: "Continue with Facebook",
            icon: const Icon(Icons.facebook),
          ),
          const SizedBox(
            height: 15,
          ),
          ContinueWithButton(
            onTab: () {},
            title: "Continue with Google",
            icon: const Icon(Icons.g_mobiledata),
          ),
          const SizedBox(
            height: 15,
          ),
          ContinueWithButton(
            onTab: () {},
            title: "Continue with Apple",
            icon: const Icon(Icons.apple),
          ),
        ],
      ),
    );
  }
}
