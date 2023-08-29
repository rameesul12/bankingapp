

import 'dart:developer';

import 'package:banking_app/view/purchase/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/bank_info_provider.dart';
import '../../utils/colors.dart';
import '../section/family_income.dart';


class Purchase extends StatelessWidget {
  const Purchase({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<BankInfoProvider>(context,listen: false);
  final  String? type;

    return  Scaffold(
      
     body: SafeArea(child: 
     Expanded(
        
        //  width: Adaptive.w(6),
       child: Consumer<BankInfoProvider>(
         builder: (context,value,child) {
           return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return DropDownWidget(
             
               dropDownName:value.bankInfoList!.schema.fields[index].schema.name, 
             dropDownList:value.bankInfoList!.schema.fields[index+1].schema.options!.map((e) => e.value).toList(), 
             hintText: value.bankInfoList!.schema.fields[index+1].schema.label,);
            },
            
              
           );
         }
       ),
     )),
     

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
          log("okey");
          provider.sectionDropDown();
          provider.listDataGetting();
         Navigator.push(context, MaterialPageRoute(builder: (context) =>const FamilyIncome() ,));
        
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
