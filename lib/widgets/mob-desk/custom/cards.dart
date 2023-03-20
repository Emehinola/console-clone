import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../../models/registered-patient.dart';
import '../../mobile/dialogs.dart';

class PatientCard extends StatelessWidget {
  String status;

  PatientCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMobileInfoDialogue(RegPatient(
          id: 'ID',
          phone: '+2348131615393',
          acctTier: 'Tier 1',
          biodata: 'Grate',
          contactDetails: 'emehinolasam@gmail.com',
          medRecord: 'Greate',
          patientName: 'Big Sam',
          principalDesignation: 'principalDesignation',
          principalWorkDetails: 'principalWorkDetails')),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Complete"
                              ? ColorPalette.lightGreen
                              : ColorPalette.lightRed),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Complete"
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel"),
            rowCard("Group Type", "Individual", hasBg: false),
            rowCard("Contact", "+2348131615393"),
            rowCard("Account Tier", "Tier 3", hasBg: false),
            rowCard("Address", "8, olawole close, etegbin, Lagos"),
          ],
        ),
      ),
    );
  }
}

class SchedulePatientCard extends StatelessWidget {
  String status;
  Function()? onTap;

  SchedulePatientCard({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          // BoxShadow(
          //     color: ColorPalette.grey.withOpacity(0.05),
          //     offset: const Offset(2, 3),
          //     spreadRadius: 0.1,
          //     blurRadius: 2)
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                          size: 18.sp,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "ID: QH29",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Scheduled"
                              ? ColorPalette.lightMain
                              : ColorPalette.lighterSecond),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: status == "Scheduled"
                                ? ColorPalette.mainButtonColor
                                : ColorPalette.secondColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: true),
            rowCard("Case", "Individual", hasBg: false),
            rowCard("Appointment Date", "23rd, Mar, 23", fromSchedule: true),
          ],
        ),
      ),
    );
  }
}

class PatientDemography extends StatelessWidget {
  String status;
  Function()? onTap;

  PatientDemography({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "ID: QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Completed"
                              ? ColorPalette.lightGreen
                              : ColorPalette.lightRed),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Completed"
                                ? ColorPalette.checkGreen
                                : ColorPalette.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: false),
            rowCard("State", "Lagos State", hasBg: false),
            rowCard("LGA", "Kosofe LGA", fromSchedule: false),
            rowCard("Facility", "Hospital", hasBg: false),
          ],
        ),
      ),
    );
  }
}

class PatientIdentification extends StatelessWidget {
  String status;
  Function()? onTap;

  PatientIdentification({
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              // BoxShadow(
              //     color: ColorPalette.grey.withOpacity(0.05),
              //     offset: const Offset(2, 3),
              //     spreadRadius: 0.1,
              //     blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          "USER ID: QH29",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Text(
                      "08 Aug 20, 08:00 -> 14 Aug 23, 06:00",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.darkBlue),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status == "Completed"
                              ? ColorPalette.lightGreen
                              : ColorPalette.lightRed),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 12,
                            color: status == "Completed"
                                ? ColorPalette.checkGreen
                                : ColorPalette.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            rowCard("Patient", "Emehinola Samuel", fromSchedule: false),
            rowCard("Group ID", "#324355", hasBg: false),
            rowCard("Medical Class", "Family Group", fromSchedule: false),
          ],
        ),
      ),
    );
  }
}

Widget rowCard(String title, String text,
    {bool hasBg = true, fromSchedule = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    decoration: BoxDecoration(
        color: hasBg
            ? ColorPalette.mainButtonColor.withOpacity(0.04)
            : Colors.white,
        borderRadius: BorderRadius.circular(1.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 14.sp),
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 14.sp),
        ),
      ],
    ),
  );
}
