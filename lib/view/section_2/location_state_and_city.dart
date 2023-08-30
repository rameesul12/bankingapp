import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/purchase/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/bank_info_provider.dart';
import '../../utils/colors.dart';
import '../type_of_loan/widgets/slider_container.dart';

class LocationStateAndCity extends StatelessWidget {
  const LocationStateAndCity({super.key});

  @override
  Widget build(BuildContext context) {
    int index=0;
    return Scaffold(
      body: SafeArea(
        child: Consumer<BankInfoProvider>(
          builder: (context,data,child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  sizedH5,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(data.bankInfoList!.schema.fields[4].schema.label,style: TextStyle(color: textBlack,fontSize: 15,fontWeight: FontWeight.bold),)),
                 sizedH4,
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       SliderContainer(color: compleateSliderColor),
                       SliderContainer(color: compleateSliderColor),
                       SliderContainer(
                         color: compleateSliderColor,
                       ),
                       SliderContainer(
                         color: incompleateSliderColor,
                       )
                     ],
                   ),
                   sizedH4,
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Text(data.bankInfoList!.schema.fields[4].schema.fields![0].schema.name,style: TextStyle(color: textBlack,fontWeight: FontWeight.bold),)),
                  sizedH2,
                   DropDownWidget(dropDownName:"",
                    dropDownList:data.picker.schema.options[index++],
                     hintText: data.bankInfoList!.schema.fields[4].schema.fields![0].schema.label),
                     sizedH5,
                     Align(
                    alignment: Alignment.centerLeft,
                    child: Text(data.bankInfoList!.schema.fields[4].schema.fields![1].schema.name,style: TextStyle(color: textBlack,fontWeight: FontWeight.bold),)),
                sizedH2,
                   DropDownWidget(dropDownName:"",
                    dropDownList: [],
                     hintText:data.bankInfoList!.schema.fields[4].schema.fields![1].schema.label),
                     sizedH5,
                ],
            
              ),
            );
          }
        ),
      ),
    )  ;   
  }
}