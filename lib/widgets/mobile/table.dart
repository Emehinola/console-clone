import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../models/patient-schedule.dart';
import '../../models/registered-patient.dart';
import '../../models/user.dart';
import '../../services/console-services.dart';
import '../../state-management/state-management.dart';
import '../mob-desk/theme/color-palette.dart';
import 'sheets.dart';

class UserPatientCard extends StatelessWidget {
  String status;
  RegPatient patient;
  bool isSchedule;

  UserPatientCard({
    required this.status,
    required this.patient,
    this.isSchedule = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(isSchedule) {
          ConsoleState.state.patientSchedule = PatientSchedule(
            id: patient.id,
            patientCase: 'Emergency',
            patientName: patient.firstName,
            appointmentDate: DateTime.now().toIso8601String().obs,
          ); //
          showScheduleSheet(context);
          return;
        }
        displayPatientInfoSheet(context, patient);
      },
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
                      children: [
                        const Icon(
                          IconlyBold.user_2,
                          color: ColorPalette.greyIcon,
                        ),
                        Text(
                          '${patient.id}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Text(
                      ConsoleService.processReadableDate(
                          patient.date.toString()),
                      style: const TextStyle(
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
            rowCard("Patient", patient.firstName),
            rowCard("Group Type", '${patient.groupType}', hasBg: false),
            rowCard("Contact", patient.address),
            rowCard("Account Tier", patient.acctTier, hasBg: false),
            rowCard("Medical Record", 'patient.medRecord'),
          ],
        ),
      ),
    );
  }
}

class UserDisplayTable extends StatelessWidget {
  String status;
  User user;

  UserDisplayTable({
    required this.status,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => displayUserInfoSheet(context, user),
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
                      "22 Mar, 2023",
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
            rowCard("Full Name", 'user.fullName'),
            rowCard("Email Address", user.username, hasBg: false),
            rowCard("Biodata", 'user.bioData'),
            rowCard("Official Details", 'user.officialDetails', hasBg: false),
            rowCard("Other Details", 'user.officialDetails',),
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

class SchedulePatientCard extends StatelessWidget {
  String status;
  Function()? onTap;
  PatientSchedule schedule;

  SchedulePatientCard({
    required this.status,
    this.onTap,
    required this.schedule,
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
                          ConsoleState.state.patientSchedule != null
                              ? ConsoleState.state.patientSchedule?.id ?? "Nil"
                              : "ID: QH29",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text(
                      "${ConsoleService.processReadableDate(DateTime.now().toIso8601String())} -> ${ConsoleService.processReadableDate(ConsoleState.state.patientSchedule != null ? ConsoleState.state.patientSchedule?.appointmentDate.toString() : "Nil")}",
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
            rowCard("Patient", schedule.patientName,
                fromSchedule: true),
            rowCard("Case", schedule.patientCase,
                hasBg: false),
            Obx((()=>rowCard(
                "Appointment Date",
                ConsoleService.processReadableDate(schedule.appointmentDate.value
                    .toString()),
                fromSchedule: true))),
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
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 14.sp),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp),
          ),
        ),
      ],
    ),
  );
}
