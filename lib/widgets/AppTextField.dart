import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CountryDropdown extends StatefulWidget {
  final List<SelectedListItem> dataList;

  const CountryDropdown({required this.dataList, super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String selectedCountry = "Lebanon (+961)"; // Default country value

  void onTextFieldTap() {
    DropDownState(
      dropDown: DropDown(
        isDismissible: true,
        bottomSheetTitle: const Text(
          "Country/Region",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: widget.dataList,
        onSelected: (List<dynamic> selectedList) {
          if (selectedList.isNotEmpty) {
            final selectedItem = selectedList.first as SelectedListItem;
            setState(() {
              selectedCountry =
                  selectedItem.name; // Update the selected country
            });
          }
        },
        enableMultipleSelection: false,
        maxSelectedItems: 1,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTextFieldTap, // Trigger dropdown when tapped
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Country/Region",
              style: TextStyle(fontSize: 14),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCountry, // Display the selected country
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Icon(
                  Icons.chevron_left,
                  size: 26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
