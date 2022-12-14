import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kprimeColor = Color(0xff1A5A5A);
const Color kBlackColor = Color(0xff2E3239);
const Color kGreyColor = Color(0xffC3C3C3);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kOrangeColor = Color(0xffFFD400);
Color? backgroundColor = const Color(0xffD3D3D3);

TextStyle blackStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle greyStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle whiteStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle orangStyle = GoogleFonts.poppins(
  color: kOrangeColor,
);
TextStyle greenStyle = GoogleFonts.poppins(
  color: kprimeColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
FontWeight black = FontWeight.w900;

double defaultMargin = 24.0;
double defaultpadding = 30.0;
double defaultRadius = 12.0;
