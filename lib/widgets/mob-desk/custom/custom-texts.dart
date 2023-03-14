import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';

Widget brandText(){
  return Text.rich(
    TextSpan(
      text: 'C',
      style: const TextStyle(
        color: ColorPalette.mainButtonColor,
        fontWeight: FontWeight.w900,
        fontSize: 20
      ),
      children: [
        buildDot(),
        buildLetter('O'),
        buildDot(),
        buildLetter('n', size: 27),
        buildDot(),
        buildLetter('S'),
        buildDot(),
        buildLetter('O'),
        buildDot(),
        buildLetter('L'),
        buildDot(),
        buildLetter('E'),
      ]
    ),
  );
}

TextSpan buildDot(){
  return const TextSpan(
    text: '.',
    style: TextStyle(
      color: ColorPalette.secondColor,
      fontWeight: FontWeight.w900,
    ),
  );
}

TextSpan buildLetter(String letter, {double size = 20}){
  return TextSpan(
    text: letter,
    style: TextStyle(
      color: ColorPalette.mainButtonColor,
      fontWeight: FontWeight.w900,
      fontSize: size,
    ),
  );
}