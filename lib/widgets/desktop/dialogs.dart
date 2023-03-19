import 'package:console/models/registered-patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../mob-desk/buttons/console-text-button.dart';

void showSuccessSheet(String title, String desc) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/files/success.json',
                        width: 250, height: 0.2.sh),
                    SizedBox(height: 0.02.sh),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                    ),
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
      });
}

void showInfoDialogue(RegPatient patient) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Full Information',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
      });
}

Widget detailRow(String title1, String value1, String title2, String value2){
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp),
          ),
           Text(
            value1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      SizedBox(width: 0.08.sw,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title2,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp),
          ),
          Text(
            value2,
            textAlign: TextAlign.center,
          ),
        ],
      )
    ],
  );
}