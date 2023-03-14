import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildSocialRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      rowItem(FontAwesomeIcons.facebook),
      rowItem(FontAwesomeIcons.linkedinIn),
      rowItem(FontAwesomeIcons.twitter),
      rowItem(FontAwesomeIcons.google),
    ],
  );
}

rowItem(IconData icon){
  return Container(
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: const Offset(7,10),
          color: ColorPalette.mainButtonColor.withOpacity(0.05),
          blurRadius: 3,
          spreadRadius: 2
        )
      ],
        borderRadius: BorderRadius.circular(8.0.sp)
    ),
    child: Icon(icon, color: Colors.black.withOpacity(0.55),),
  );
}