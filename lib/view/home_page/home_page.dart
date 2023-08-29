// ignore_for_file: use_build_context_synchronously

import 'package:banking_app/controller/home_page_provider.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/sizedbox.dart';
import 'package:banking_app/view/balance_transfer/transferPage.dart';
import 'package:banking_app/view/home_page/widgets/slider_container.dart';
import 'package:banking_app/view/purchase/purchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/bank_info_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<BankInfoProvider>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<HomePageProvider>(
          builder: (context,data,child) {
            return Column(
               
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  SafeArea(child: 
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("About Loan",style: TextStyle(color:textBlack ,fontWeight: FontWeight.w500,fontSize: 30),))
              
              ),
            // sizedH10,
             sizedH4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SliderContainer(color:colorSlider),
                   SliderContainer(color: Colors.black38,),
                    SliderContainer(color: Colors.black38,),
                     SliderContainer(color: Colors.black38,)
                ],
              ),
              sizedH5,
               const   Text("Type of loan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black87),),
            //   sizedH5,
            SizedBox(height: Adaptive.h(2),),
             Container(
              width: Adaptive.w(90),
              height: Adaptive.h(7),
             
              decoration:BoxDecoration( 
                 border: Border.all(color:data.typeLoan!="Purchase"? Colors.black54:Colors.amber),
                color:backGroundcolor ,
                borderRadius: BorderRadius.circular(10),
              
              ) ,
              child: Row(
              
                children: [
            Expanded(child: data.radioButtonFunction(title: 'New purchase', value: 'Purchase')),
                ],
              ),
             ),
             sizedH4,
             
             Container(
               width: Adaptive.w(90),
               height: Adaptive.h(7),
               decoration:BoxDecoration( 
                border: Border.all(color:data.typeLoan!="Transfer"?Colors.black54:Colors.amber),
                color:backGroundcolor ,
                borderRadius: BorderRadius.circular(10),
              
              ),
               child: Row(
              
                children: [
                        Expanded(child: data.radioButtonFunction(
                        title: 'Balance transfer &Top-Up', 
                        value: 'Transfer')),
                ],
              ),
             ),
sizedH30,
SizedBox(height: Adaptive.h(13),),

           const  Row(
              children: [
                Icon(Icons.arrow_back_ios,color:Colors.black54,size: 14,),
             Text("Back",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w400),)
              ],
             )
            ],
              );
          }
        ),
      ),

floatingActionButton: SizedBox(
height: Adaptive.h(12),
  child:   Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(Adaptive.h(10)),
        child: FloatingActionButton(
      //  shape:  BeveledRectangleBorder(
      //     borderRadius: BorderRadius.zero
      //    ),
          
        backgroundColor: Colors.amber,
             
          onPressed: () async{
          await provider.loadJsonAssets();
         provider.bankOptionList();
         if (Provider.of<HomePageProvider>(context,listen: false).typeLoan=="Transfer") {
           
         Navigator.push(context, MaterialPageRoute(builder: (context) =>const TransferPage() ,));
         }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Purchase() ,));
         }
        
        },
       
        child:const Icon(Icons.arrow_forward_ios,color: textWhite,),
           
         
         ),
      ),
      
    ],
  ),

),

    );
  }

 
}


