import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/message_showing.dart';
import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/type_of_loan/screen_type_of_loan.dart';
import 'package:banking_app/view/type_of_loan/widgets/slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/bank_info_provider.dart';

class FullDataDisplaying extends StatelessWidget {
  const FullDataDisplaying({super.key, required this.income});

 
  final String income;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
       value:
          SystemUiOverlayStyle.light.copyWith(statusBarColor: backGroundcolor),
          child: SafeArea(child: 
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text(
                      "Filled Datas",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    sizedH5,
                   const  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SliderContainer(color:compleateSliderColor),
                         SliderContainer(color: compleateSliderColor,),
                          SliderContainer(color: compleateSliderColor,),
                           SliderContainer(color: compleateSliderColor,)
                      ],
                    ),
                    sizedH2,
                   const Text(
                      "Your Work Profail",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    sizedH2,
                    Consumer<BankInfoProvider>(
                      builder: (context,data,child) {
                        return Container(
                       padding: EdgeInsets.all(10),

                          height: Adaptive.h(7),
                          width: Adaptive.w(95),
                         
                          decoration: BoxDecoration(
                            
                            color: textWhite,
                            border: Border.all(color: textBlack),
                            borderRadius: BorderRadius.circular(10)
                           
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(data.jobType!,style:const TextStyle(color: textBlack),)),
                        );
                      }
                    ),
                    sizedH2,
                    const Text(
                      "Family Income",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    sizedH2,
                    Container(
                      padding: EdgeInsets.all(10),
                      height: Adaptive.h(7),
                      width: Adaptive.w(95),
                      decoration: BoxDecoration(
                        color: textWhite,
                        border: Border.all(color: textBlack),
                        borderRadius: BorderRadius.circular(10)
                       
                      ),
                      child:  Align(
                            alignment: Alignment.centerLeft,
                            child: Text(income,style:const TextStyle(color: textBlack),)),
                    ),
sizedH5,
                    Center(
                      child: ElevatedButton(onPressed: (){
                        messageShowing("data Submitted", context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>const LoanTypeScreen(),));
                      },
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ) ,
                       child:const Text("Submit",style:TextStyle(color: textWhite),)),
                    )
            
                ],
              ),
            ),
          )

          ),
    );
  }
}