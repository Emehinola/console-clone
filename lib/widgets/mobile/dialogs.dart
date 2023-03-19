import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/registered-patient.dart';
import '../../services/mobile/operations.dart';
import '../desktop/dialogs.dart';
import '../mob-desk/buttons/console-text-button.dart';

void showMobileInfoDialogue(RegPatient patient) {
  showDialog(
    context: Get.context!,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          content: Container(
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            width: 0.8.sw,
            height: 0.5.sh,
            child: Center(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Patient Full Information',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: mobilePatientEdit,
                          child: Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: 0.01.sh),
                  detailRow('First Name', 'Samuel', 'Last Name', 'Emehinola'),
                  SizedBox(height: 0.01.sh),
                  const Divider(),
                  SizedBox(height: 0.01.sh),
                  detailRow('Group Type', 'Group 1', 'Account Tier', 'Tier 1'),
                  SizedBox(height: 0.01.sh),
                  const Divider(),
                  SizedBox(height: 0.01.sh),
                  detailRow('Phone', '+2348131615393', '', ''),
                  SizedBox(height: 0.01.sh),
                  const Divider(),
                  SizedBox(height: 0.01.sh),
                  detailRow('Address', '8, Lagos-Ibadan Expressway', '', ''),
                  SizedBox(height: 0.06.sh),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                        buttonText: 'Close',
                        verticalPadding: 0.02.sh,
                        onTap: () {
                          Get.back();
                        }),
                  ),
                ],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))));
    },
  );
}
