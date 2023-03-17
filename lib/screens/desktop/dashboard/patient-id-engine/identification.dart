import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/desktop/patient-list-tiles.dart';
import '../dashboard.dart';

class DesktopIdentification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderMetrics(),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      // padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          IdentificationTable(
                            status: "Complete",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedBtn(buttonText: 'Schedule Patient for Appointment', verticalPadding: 20, borderColor: ColorPalette.mainButtonColor, textColor: ColorPalette.mainButtonColor,),
                        const SizedBox(height: 30,),
                        FlatButton(buttonText: 'Engage Patient', verticalPadding: 20,),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}