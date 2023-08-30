// ignore_for_file: must_be_immutable

import 'package:banking_app/utils/sizedbox.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/bank_info_provider.dart';
import '../../../utils/colors.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget(
      {super.key,
      required this.dropDownName,
      required this.dropDownList,
      required this.hintText,
      this.selectedType,
      this.drop = false,
      this.bank = false,
      });
  final String? dropDownName;
  String? selectedType;
  List<String> dropDownList;
  final String hintText;
  final bool drop;
  final bool bank;

  @override
  Widget build(BuildContext context) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<BankInfoProvider>(builder: (context, data, child) {
          return SizedBox(
            child: DropdownSearch<String>(
              // mode: Mode.MENU,
              // showSelectedItems: true,
              items: dropDownList,
              popupProps: const PopupProps.menu(
                showSelectedItems: true,
                constraints: BoxConstraints(
                  maxHeight: (4 * 60) < 300 ? (4 * 60) : 300,
                ),
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: hintText,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  //  fillColor:Colors.black38 ,
                  //  focusColor:Colors.black26 ,
                  isCollapsed: true,
                  //  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 13.sp,
                    vertical: 13.sp,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 30.h,
                    maxWidth: 100.w,
                    minWidth: 90.w,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black12,
                    // fontFamily: GoogleFonts.inter(
                    //   fontWeight: FontWeight.w500,
                    // ).fontFamily,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.3)),
                    borderSide: BorderSide(color: selectedColor, width: 1.5),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.3)),
                    borderSide: BorderSide(width: 1.5),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.3)),
                    borderSide: BorderSide(width: 1.5),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.3)),
                    borderSide: BorderSide(
                        //      color: HexColor('#de5151'),
                        ),
                  ),
                ),
              ),

              onChanged: (value) {
                if (drop == true) {
                  selectedType = value;
                  data.type = selectedType;
                } else if(bank == true){
                   selectedType = value;
                  data.bankname = selectedType;
                }
                else {
                  selectedType = value;
                  data.jobType = selectedType;
                }
              },
              selectedItem: selectedType,
            ),
          );
        }),
      ],
    );
  }
}
