import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/bank_info_provider.dart';
import '../../utils/colors.dart';
import '../purchase/widgets/text_form_field.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
     Consumer<BankInfoProvider>(
       builder: (context,value,child) {
         return Expanded(
        
        //  width: Adaptive.w(6),
           child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return DropDownWidget(
             
               dropDownName:value.bankInfoList!.schema.fields[index+3].schema.name, 
             dropDownList:value.bankInfoList!.schema.fields[index+3].schema.options!.map((e) => e.value).toList(), 
             hintText: value.bankInfoList!.schema.fields[index+3].schema.label,);
            },
            
              
           ),
         );
       }
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
          

       //  Navigator.push(context, MaterialPageRoute(builder: (context) =>const FamilyIncome() ,));
        
        },
       
        child:const Icon(Icons.arrow_forward_ios,color: textWhite,),
           
         
         ),
      ),
      
    ],
  ),

) ,
    );
  }
}