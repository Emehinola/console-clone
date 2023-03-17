import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                child: IdentificationTable(
                  status: "Complete",
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedBtn(buttonText: 'Schedule Patient', verticalPadding: 0.015.sh, borderColor: ColorPalette.mainButtonColor, textColor: ColorPalette.mainButtonColor,),
                        SizedBox(height: 0.02.sh,),
                        FlatButton(buttonText: 'Engage Patient', verticalPadding: 0.015.sh,),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}