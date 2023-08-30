// ignore_for_file: use_build_context_synchronously

import 'package:banking_app/controller/type_of_loan_provider.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/balance_transfer/screen_transfer_page.dart';
import 'package:banking_app/view/purchase/widgets/text_form_field.dart';
import 'package:banking_app/view/section_2/location_state_and_city.dart';
import 'package:banking_app/view/type_of_loan/widgets/slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/bank_info_provider.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Existing bank where loan existse",
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
                      //  width: Adaptive.w(6),
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return DropDownWidget(
                            dropDownName: value.bankInfoList!.schema
                                .fields[index + 3].schema.name,
                            dropDownList: value.bankInfoList!.schema
                                .fields[index + 3].schema.options!
                                .map((e) => e.value)
                                .toList(),
                            hintText: "Select the Bank",
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
                                   provider.locatedPlace();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LocationStateAndCity(),
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
