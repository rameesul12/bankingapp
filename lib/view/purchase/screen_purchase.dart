// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:banking_app/controller/type_of_loan_provider.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/balance_transfer/screen_transfer_page.dart';
import 'package:banking_app/view/purchase/widgets/text_form_field.dart';
import 'package:banking_app/view/type_of_loan/widgets/slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/bank_info_provider.dart';
import '../section/screen_family_income.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? type;
    final provider = Provider.of<BankInfoProvider>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          SystemUiOverlayStyle.light.copyWith(statusBarColor: backGroundcolor),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Adaptive.w(5), vertical: Adaptive.h(3)),
            child: Consumer<HomePageProvider>(builder: (context, data, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeArea(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "About Loan",
                            style: TextStyle(
                                color: textBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 32),
                          ))),
                  // sizedH10,
                  sizedH4,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SliderContainer(color: compleateSliderColor),
                      SliderContainer(color: compleateSliderColor),
                      SliderContainer(
                        color: incompleateSliderColor,
                      ),
                      SliderContainer(
                        color: incompleateSliderColor,
                      )
                    ],
                  ),
                  sizedH5,
                  const Text(
                    "Your work profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  //   sizedH5,
                  SizedBox(
                    height: Adaptive.h(1),
                  ),
                  Consumer<BankInfoProvider>(builder: (context, value, child) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return DropDownWidget(
                            selectedType:type ,
                            dropDownName: value
                                .bankInfoList!.schema.fields[index].schema.name,
                            dropDownList: value.bankInfoList!.schema
                                .fields[index + 1].schema.options!
                                .map((e) => e.value)
                                .toList(),
                            hintText: "Select your work profile",
                          );
                        },
                      ),
                    );
                  }),

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
                              borderRadius:
                                  BorderRadius.circular(Adaptive.h(10)),
                              child: FloatingActionButton(
                                //  shape:  BeveledRectangleBorder(
                                //     borderRadius: BorderRadius.zero
                                //    ),

                                backgroundColor: floatingActionButtonColor,

                                onPressed: () async {
                                
                                    await provider.loadJsonAssets();
                                  provider.bankOptionList();
                                 log(type.toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                               FamilyIncome(),
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
              );
            }),
          ),
        ),
      ),
    );
  }
}
