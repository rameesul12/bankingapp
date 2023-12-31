import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/display_city_place/screen_display_city_place.dart';
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
    final provider = Provider.of<BankInfoProvider>(context, listen: false);
  //  int index = 0;
    return Scaffold(
      body: SafeArea(
        child: Consumer<BankInfoProvider>(builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                sizedH5,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.bankInfoList!.schema.fields[4].schema.label,
                      style: TextStyle(
                          color: textBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
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
                    child: Text(
                      data.bankInfoList!.schema.fields[4].schema.fields![0]
                          .schema.name,
                      style: TextStyle(
                          color: textBlack, fontWeight: FontWeight.bold),
                    )),
                sizedH2,
                DropDownWidget(
                    dropDownName: "",
                    dropDownList: data.bankInfoList!.schema.fields[4].schema
                        .fields![0].schema.options!
                        .map((e) => e.value)
                        .toList(),
                    // dropDownList:data.picker.schema.options[index++],
                    hintText: data.bankInfoList!.schema.fields[4].schema
                        .fields![0].schema.label),
                sizedH5,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      data.bankInfoList!.schema.fields[4].schema.fields![1]
                          .schema.name,
                      style: TextStyle(
                          color: textBlack, fontWeight: FontWeight.bold),
                    )),
                sizedH2,
                DropDownWidget(
                    dropDownName: "",
                    drop: true,
                    dropDownList: data.bankInfoList!.schema.fields[4].schema
                        .fields![1].schema.options!
                        .map((e) => e.value)
                        .toList(),
                    hintText: data.bankInfoList!.schema.fields[4].schema
                        .fields![1].schema.label),
                sizedH30,
                sizedH5,
                sizedH2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black54,
                            size: 17,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Adaptive.h(10)),
                            child: FloatingActionButton(
                              //  shape:  BeveledRectangleBorder(
                              //     borderRadius: BorderRadius.zero
                              //    ),

                              backgroundColor: floatingActionButtonColor,

                              onPressed: () async {
                                await provider.loadJsonAssets();
                                provider.bankOptionList();
                                provider.locatedPlace();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FulldataDisplaying(),
                                    ));
                              },

                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: textWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
