// ignore_for_file: use_build_context_synchronously

import 'package:banking_app/controller/type_of_loan_provider.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/balance_transfer/transferPage.dart';
import 'package:banking_app/view/type_of_loan/widgets/slider_container.dart';
import 'package:banking_app/view/purchase/screen_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/bank_info_provider.dart';

class LoanTypeScreen extends StatelessWidget {
  const LoanTypeScreen({super.key});

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
                      SliderContainer(
                        color: incompleateSliderColor,
                      ),
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
                    "Type of loan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  //   sizedH5,
                  SizedBox(
                    height: Adaptive.h(1),
                  ),
                  Container(
                    width: Adaptive.w(90),
                    height: Adaptive.h(6.3),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5,
                          color: data.typeLoan != "Purchase"
                              ? const Color.fromARGB(255, 189, 189, 189)
                              : selectedColor),
                      color: backGroundcolor,
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    child: data.radioButtonFunction(
                        title: 'New purchase', value: 'Purchase'),
                  ),
                  sizedH3,
                  Container(
                    width: Adaptive.w(90),
                    height: Adaptive.h(6.3),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5,
                          color: data.typeLoan != "Transfer"
                              ? const Color.fromARGB(255, 189, 189, 189)
                              : selectedColor),
                      color: backGroundcolor,
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    child: data.radioButtonFunction(
                        title: 'Balance transfer & Top-Up', value: 'Transfer'),
                  ),
                  sizedH30,
                  SizedBox(
                    height: Adaptive.h(18),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
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
                                  if (Provider.of<HomePageProvider>(context,
                                              listen: false)
                                          .typeLoan ==
                                      "Transfer") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransferScreen(),
                                        ));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PurchaseScreen(),
                                        ));
                                  }
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
