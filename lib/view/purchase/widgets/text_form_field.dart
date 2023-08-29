

// ignore_for_file: must_be_immutable


import 'package:banking_app/utils/sizedbox.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/bank_info_provider.dart';
import '../../../utils/colors.dart';


class DropDownWidget extends StatelessWidget {
   DropDownWidget({
    super.key,
    required this.dropDownName,
   required this.dropDownList, required this.hintText, this.selectedType
  });
  final String? dropDownName;
   String? selectedType;
  List<String> dropDownList;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
       
      children: [ 
        sizedH30,
        Align(
          alignment: Alignment.centerLeft,
          child:   Text("$dropDownName",style: TextStyle(color: textBlack,fontSize: 16,fontWeight: FontWeight.bold),)),
       sizedH4,
      Consumer<BankInfoProvider>(
        builder: (context,data,child) {
          return DropdownSearch<String>(
               // mode: Mode.MENU,
               // showSelectedItems: true,
               items:dropDownList,
               popupProps: const PopupProps.menu(
                 showSelectedItems: true,
                 constraints: BoxConstraints(
                   maxHeight: (4 * 60) < 300 ? (4 * 60) : 300,
                 ),
               ),
               dropdownDecoratorProps: DropDownDecoratorProps(
                 dropdownSearchDecoration: InputDecoration(
                  
                   hintText:hintText,
                   hintStyle:const TextStyle(color: textBlack),
                   filled: true,
                  //  fillColor:Colors.black38 ,
                  //  focusColor:Colors.black26 ,
                   isCollapsed: true,
                 //  isDense: true,
                   contentPadding: EdgeInsets.symmetric(
                     horizontal: 12.sp,
                     vertical: 12.sp,
                   ),
                   constraints: BoxConstraints(
                     maxHeight: 30.h,
                     maxWidth: 100.w,
                     minWidth: 90.w,
                   ),
                   errorStyle: TextStyle(
                     fontSize: 8.sp,
                     color:Colors.black12,
                     // fontFamily: GoogleFonts.inter(
                     //   fontWeight: FontWeight.w500,
                     // ).fontFamily,
                   ),
                   enabledBorder: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     borderSide: BorderSide(
                      color: Colors.red,
                     ),
                   ),
                   focusedErrorBorder: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     borderSide: BorderSide(
                   //    color: HexColor('#de5151'),
                     ),
                   ),
                   focusedBorder: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     borderSide: BorderSide(
                 //      color: HexColor('#5374ff'),
                     ),
                   ),
                   errorBorder: const OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     borderSide: BorderSide(
                 //      color: HexColor('#de5151'),
                     ),
                   ),
                 ),
               ),
               
               onChanged:(value) {
                
                selectedType=value;

               },
               selectedItem: selectedType,
             );
        }
      ),
       
      ],
       
      ),
    );
  }
}