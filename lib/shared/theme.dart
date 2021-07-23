import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Color whiteColor = Color(0xffffffff);
Color blackColor = Color(0xff333333);
Color greyColor = Color(0xff828282);
Color blueColor = Color(0xff0A97B0);
Color tealColor = Color(0xff46B5A7);

Color yellowColor = Color(0xffF2C94C);
Color secondBlueColor = Color(0xff2F80ED);
Color blueSkyColor = Color(0xff56CCF2);
Color secondBlueSkyColor = Color(0xff2D9CDB);
Color purpleColor = Color(0xff9B51E0);
Color secondPurpleColor = Color(0xffBB6BD9);
Color orangeColor = Color(0xffF2994A);
Color redColor = Color(0xffEB5757);
Color greenColor = Color(0xff27AE60);

TextStyle bigTitle =
    GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w700);
TextStyle paragraphBold =
    GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w700);
TextStyle paragraphSemiBold =
    GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w600);
TextStyle paragraphMedium =
    GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w400);
TextStyle captionMedium =
    GoogleFonts.sourceSansPro(fontSize: 12, fontWeight: FontWeight.w400);
TextStyle captionBold =
    GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w700);

DateTime now = new DateTime.now();
DateFormat dailyFormat = DateFormat('dd MMMM yyyy');
DateFormat monthlyFormat = DateFormat('MMMM yyyy');
