// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/bank_model_details.dart';

class BankInfoProvider extends ChangeNotifier {

  BankLoanDetails? bankInfoList;
  List<Option> options = [];
  List<String> optionStringList = [];
  String? jobType;
  List<PurpleField> fields = [];
 List<dynamic>datas=[];
  List<dynamic> sectionDropList=[];
 dynamic picker;
 dynamic picker2;

  //======================
  //full json response taking in to BankInfoList
//========================
  Future loadJsonAssets() async {
    try {
      var jsonString =
          await rootBundle.loadString("assets/jsondata/bank_data.json");
      final data = jsonDecode(jsonString);
      bankInfoList = BankLoanDetails.fromJson(data);

      fields = bankInfoList!.schema.fields;
      // for(var i=0;i<fields.length;i++){
      //   log(fields[i].schema.options.toString());
      //  options=fields[i].schema.options;

      // }

      log("oke");
      log(options.toString());
      notifyListeners();

      log(fields.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  //====================
  //work profail of User 
//====================

  bankOptionList() {
    options.clear();
    for (var field in fields) {
      // log("ok");
      // log(field.schema.options.toString());
      List<Option>? fieldOption = field.schema.options;
      for (var field in fieldOption!) {
        if (field.key == "salaried") {
          options.add(field);
        }
      }
      notifyListeners();
    }
    optionStringList.clear();
    optionStringList = options.map((e) => e.value).toList();

    notifyListeners();
  }


 //====================
 //...
//====================
 
 sectionDropDown(){
  datas.clear();
 for (var i = 0; i < fields.length; i++) {
    
    if (i==2) {
      
      datas.add(fields[2].schema.options);
      
      log(datas.toString());
      
     
      log("yeah fine");
      
      notifyListeners();
    
    }
   
 }
 }


 listDataGetting(){
 
 for (var element in datas) {
  sectionDropList=element.schema["name"];
  log(sectionDropList.toString());
 }
  notifyListeners();
 }


 //banktransfer page city and state findings

 locatedPlace(){
  int index;
final picker=bankInfoList!.schema.fields[4].schema.fields![0];
final picker2=bankInfoList!.schema.fields[4].schema.fields![1];
  

log(picker.toString());

    
   // log(placePicker.toString());
    notifyListeners();
  }

  
 

 }



 

