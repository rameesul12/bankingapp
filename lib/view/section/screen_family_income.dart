
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/message_showing.dart';
import 'package:banking_app/view/displaying/screen_purchase_displaying.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/bank_info_provider.dart';
import '../../utils/sizedbox.dart';
import '../type_of_loan/widgets/slider_container.dart';

class FamilyIncome extends StatelessWidget {
  const FamilyIncome({super.key,});
// final String selectedWork;

  @override
  Widget build(BuildContext context) {
   final formKeys = GlobalKey<FormState>();
    TextEditingController incomeController=TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:formKeys ,
          child: Column(
            children: [
              sizedH10,
        
              const SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SliderContainer(color:compleateSliderColor),
                       SliderContainer(color: compleateSliderColor,),
                        SliderContainer(color: compleateSliderColor,),
                         SliderContainer(color: incompleateSliderColor,)
                    ],
                  ),
                   ),
                   sizedH5,
               const  Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Total Family Income",style: TextStyle(color: textBlack,fontSize:16,fontWeight: FontWeight.bold),)),
                Expanded(
                  child: Consumer<BankInfoProvider>(
                    builder: (context,data,child) {
                      return ListView.builder(
                         
                         itemCount: 1,
                        itemBuilder:(context, index) {
                          return  TextFormField(
                            keyboardType: TextInputType.number,
                            controller:incomeController ,
                             decoration: InputDecoration(
                             // label: Text(data.bankInfoList!.schema.fields[2].schema.name,style:const TextStyle(color: textBlack),),
                                           hintText: data.bankInfoList!.schema.fields[2].schema.label,
                                            fillColor: Colors.white60,
                                            focusColor: Colors.grey,
                                             filled: true,
                                      
                                         contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                                      // icon: Icon(textIcon,color: Colors.white,),
                                        prefixIcon:const Icon(Icons.currency_rupee,color: Colors.black,),
                                       
                                        border:
                                        OutlineInputBorder( 
                                    
                                          borderRadius:
                                          BorderRadius.circular(5)
                                        )
                                      
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                          return messageShowing("Please Enter income ", context);
                                            }
                                             
                                          }
                                          
                          );
                        }, );
                    }
                  ),
                ),
              
           const   Expanded(child: Text("(note:Only blood relatives)",style: TextStyle(color: Colors.black38),)),
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
                                   
                                   if (formKeys.currentState!.validate()) {
                                     
                                   }else{
                                    messageShowing("please enter family income", context);
                                   }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                 FullDataDisplaying(income:incomeController.text ,  ),
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
                    ),
                    sizedH2
            ],
          ),
        ),
      ),
    );
  }
}
