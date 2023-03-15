import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';

class ShadowIconButton extends StatelessWidget {
  Function()? onTap;
  IconData iconData;

  ShadowIconButton({
    this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  color: ColorPalette.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  blurRadius: 3),
            ]),
        child: Icon(
          iconData,
          color: ColorPalette.greyIcon,
          size: 25,
        ),
      ),
    );
  }
}
