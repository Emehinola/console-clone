import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tezt extends StatelessWidget {
  const Tezt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: ColorPalette.mainButtonColor,
            height: Get.height,
            width: Get.height,
          ),
          Image.asset('./assets/images/console.jpeg')
        ],
      ),
    );
  }
}
