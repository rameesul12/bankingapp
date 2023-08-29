
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier{

   String typeLoan="TypeLoan";

 RadioListTile<String> radioButtonFunction({required String title,required String value,}) {
    return RadioListTile(
                 title:Text(title,style:const TextStyle(color: Colors.black))
                 ,
                 value: value,
                 groupValue:typeLoan,
                 onChanged: (value) {
                 typeLoan=value!;
                 notifyListeners();
                 },
                
              );
  }

}