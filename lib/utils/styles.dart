import 'package:flutter/material.dart';

import 'dimensions.dart';

/*
  contains all text styles, app colors and other global properties
   */

class Styles {
  //colors
  static Color primaryColor = const Color(0xfffead29);
  static Color blueColor = const Color(0xff1D252D);
  static Color iconTextColor = const Color(0xff000000);
  static LinearGradient primaryLinearGradient = const LinearGradient(
      colors: [Color(0xffe65c00), Color(0xfffead29)],
      begin: Alignment.topLeft,
      end: Alignment.centerRight);

  //text-styles
  static TextStyle yellowTextStyle = TextStyle(
    color: const Color(0xfffead29),
    fontWeight: FontWeight.w600,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font16,
  );

  static TextStyle whiteTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font16,
  );
  static TextStyle redErrorTextStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w400,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.getHeight(14),
  );

  static TextStyle greyTextStyle = TextStyle(
    color: const Color(0xff4A4A4A),
    fontWeight: FontWeight.w400,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.getHeight(24),
  );

  static TextStyle greyTextStyle2 = TextStyle(
    color: const Color(0xff4A4A4A),
    fontWeight: FontWeight.w600,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font20,
  );

  static TextStyle greyTextStyleThin = TextStyle(
    color: const Color(0xff4A4A4A),
    fontWeight: FontWeight.w400,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font16,
  );
  static TextStyle blueTextStyle = TextStyle(
    color: blueColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font16,
  );
  static TextStyle iconTextStyle = TextStyle(
    color: Styles.iconTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: "Sans-serif",
    fontSize: Dimensions.font14,
  );

  static TextStyle textStyle = TextStyle(
    fontSize: Dimensions.font18,
    color: textColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'Sans-serif',
  );
  static TextStyle headLineStyle = TextStyle(
      fontSize: Dimensions.font26,
      color: textColor,
      fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 = TextStyle(
      fontSize: Dimensions.font20,
      color: textColor,
      fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: Dimensions.font16,
      color: textColor,
      fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: Dimensions.font14,
      color: Colors.grey.shade500,
      fontWeight: FontWeight.w500);
  static TextStyle buttonText = TextStyle(
      fontSize: Dimensions.font20,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  static Color textColor = const Color(0xff3b3b3b);
  static Color bgColor = const Color(0xffeeedf2);
  static Color orangeColor = const Color(0XFFF37B67);
  static Color kakiColor = const Color(0xFFD2BDB6);

  //box decorations
  // static InputDecoration inputDecoration = InputDecoration(
  // //prefix: prefixImage,
  // prefixIcon: Container(
  // height: Dimensions.getHeight(25),
  // width: Dimensions.getWidth(25),
  // padding: EdgeInsets.symmetric(
  // horizontal: Dimensions.width10),
  // child: widget.prefixImage == ""
  // ? const Icon(Icons.grid_view_rounded)
  //     : Image.asset(widget.prefixImage)),
  // suffixIcon: const Icon(Icons.search),
  // hintText: "${services.value} Services,Stylists",
  // border: OutlineInputBorder(
  // borderRadius: BorderRadius.circular(4)));
}
