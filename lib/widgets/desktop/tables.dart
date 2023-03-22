import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../models/registered-patient.dart';
import '../../services/console-services.dart';
import '../../state-management/state-management.dart';
import '../mob-desk/theme/color-palette.dart';
import '../mobile/table.dart';

class SchedulePatientCardReal extends StatelessWidget {
  String status;
  Function()? onTap;
  RegPatient patient;

  SchedulePatientCardReal({
    required this.status,
    required this.patient,
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
                          "ID: ${patient.id}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text(
                      "${ConsoleService.processReadableDate(DateTime.now().toIso8601String())} -> 14 Aug 23, 06:00",
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
            rowCard("Patient", patient.patientName, fromSchedule: true),
            rowCard("Case", ConsoleState.state.patientSchedule != null ? ConsoleState.state.patientSchedule!.patientCase : "Nil", hasBg: false),
            Obx(()=>rowCard("Appointment Date", ConsoleState.state.patientSchedule != null ? ConsoleService.processReadableDate(ConsoleState.state.patientSchedule!.appointmentDate.value) : "Nil", fromSchedule: true),),
          ],
        ),
      ),
    );
  }
}