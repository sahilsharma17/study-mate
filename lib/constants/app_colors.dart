import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors{
  static const Color blackColor = Color(0xff303030);
  static const Color greenColor = Color(0xff2DBB54);
  static const Color greyColor = Color(0xffD6D6D6);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightColor = Color(0xffC3CDD6);
}


//app colors
Color bgColor = const Color.fromRGBO(189, 196, 167, 1);
Color mainColor = const Color(0xFF000633);
Color accentColor = const Color.fromARGB(255, 236, 233, 92);

//colors for cards
//font styling
TextStyle mainTitle = GoogleFonts.roboto(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
TextStyle mainContent = GoogleFonts.nunito(
  fontSize: 18,
  fontWeight: FontWeight.normal,
);
TextStyle dateTitle = GoogleFonts.roboto(
  fontSize: 11,
  fontWeight: FontWeight.w300,
);