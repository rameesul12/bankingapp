import 'package:banking_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  String typeLoan = "Purchase";

  RadioListTile<String> radioButtonFunction({
    required String title,
    required String value,
  }) {
    return RadioListTile(
      title: Text(title,
          style: TextStyle(
              color: typeLoan == value ? selectedColor : Colors.black)),
      value: value,
      activeColor: selectedColor,
      groupValue: typeLoan,
      onChanged: (value) {
        typeLoan = value!;
        notifyListeners();
      },
    );
  }
}
