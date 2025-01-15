import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:senior_shabeb/colors/colors.dart';
import 'package:senior_shabeb/widgets/AppTextField.dart';

class AddressConfirmation extends StatefulWidget {
  const AddressConfirmation({super.key});

  @override
  State<AddressConfirmation> createState() => _AddressConfirmationState();
}

class _AddressConfirmationState extends State<AddressConfirmation> {
  bool isSwitched = false; // Variable to track the state of the switch

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "Confirm your address",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
        ),
        const SizedBox(
          height: 20,
        ),
        CountryDropdown(
          dataList: [
            SelectedListItem(name: 'Lebanon (+961)', value: 'LB'),
            SelectedListItem(name: 'United States (+1)', value: 'US'),
            SelectedListItem(name: 'Canada (+1)', value: 'CA'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45), // Gray border
            borderRadius: BorderRadius.circular(10), // Border radius
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text("Street address",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'street,bld,complex(if applicable)',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black45), // Border color
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'City/town/village',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black45), // Border color
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: 'Province/state',
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black45), // Border color
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Show your specific location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Make it clear to players where your place is located. We'll only share your address after they've made a reservation.",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                    softWrap: true, // Ensures the text wraps
                  ),
                ],
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: AppColors.primary,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
          ],
        ),
      ],
    );
  }
}
