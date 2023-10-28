import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle({
  double Size = 14.0,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontSize: Size,
    color: color,
    fontWeight: fontWeight,
  );
}

List selectableTimes=[
  "0",
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300",
];

Color renderColor(String currentState){
  if(currentState=="FOCUS"){
    return Colors.red;
  }else{
    return Colors.blue;
  }
}