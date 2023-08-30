import 'package:flutter/material.dart';

messageShowing(String error,BuildContext ctx){
 return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(backgroundColor: Colors.black,content: Text(error,style: TextStyle(color: Colors.white),)));
} 