import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsoleIconButton extends StatelessWidget {
  IconData icon;
  String text;

  ConsoleIconButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: ColorPalette.grey.withOpacity(0.1),
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: ColorPalette.greyIcon,),
            const SizedBox(
              width: 15,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
