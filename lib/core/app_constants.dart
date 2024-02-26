

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppConstants{
  static TextStyle hintStyles=GoogleFonts.ptSans(fontSize: 14,fontWeight: FontWeight.w300);

  static TextStyle headerStyle=GoogleFonts.ptSans(fontSize: 20,fontWeight: FontWeight.w700);

  static TextStyle subHeaderStyle=GoogleFonts.ptSans(fontSize: 16,fontWeight: FontWeight.w700);
  static TextStyle mediumTextStyle=GoogleFonts.ptSans(fontSize: 18,);


 static showErrorMessage(String message,BuildContext context){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}