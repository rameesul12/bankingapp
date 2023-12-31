// ignore_for_file: non_constant_identifier_names

import 'package:banking_app/controller/bank_info_provider.dart';
import 'package:banking_app/controller/type_of_loan_provider.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/view/type_of_loan/screen_type_of_loan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (Context, Orientation, ScreenType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => BankInfoProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Banking App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: backGroundcolor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoanTypeScreen(),
        ),
      );
    });
  }
}
