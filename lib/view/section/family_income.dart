
import 'package:banking_app/view/purchase/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/bank_info_provider.dart';

class FamilyIncome extends StatelessWidget {
  const FamilyIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<BankInfoProvider>(
          builder: (context,data,child) {
            return ListView.builder(
               
               itemCount: 1,
              itemBuilder:(context, index) {
                return DropDownWidget(
                  
                   dropDownName:data.bankInfoList!.schema.fields[2].schema.name ,
                    dropDownList:data.datas[index].schema[index],
                   hintText: data.bankInfoList!.schema.fields[2].schema.label,);
              }, );
          }
        )
      
      ),
    );
  }
}