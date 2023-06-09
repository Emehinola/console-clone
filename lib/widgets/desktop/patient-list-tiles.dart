import 'package:console/database/provider.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/models/user.dart';
import 'package:console/services/console-services.dart';
import 'package:console/state-management/state-management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../models/patient-schedule.dart';
import '../../screens/desktop/dashboard/dashbaord-items/practice-management/patient-schedule.dart';
import '../../services/edit-patient-info.dart';
import '../mob-desk/theme/color-palette.dart';
import 'dialogs.dart';

class DesktopPatienntCard extends StatelessWidget {
  String status;

  DesktopPatienntCard({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'), opacity: 0.08)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildDashRowItem(hasBox: true, text: 'ID'),
                buildDashRowItem(text: 'DATE CREATED'),
                buildDashRowItem(text: 'FULL NAME'),
                buildDashRowItem(text: 'EMAIL ADDRESS'),
                buildDashRowItem(text: 'PRIM. ASS'),
                buildDashRowItem(text: 'NATIONALITY'),
                buildDashRowItem(text: 'STATUS'),
                buildDashRowItem(text: 'ACTION'),
                // buildDashRowItem(text: 'ACCOUNT TIER'),
                // buildDashRowItem(text: 'ADDRESS'),
                // buildDashRowItem(text: 'REG. STATUS'),
                // buildDashRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => viewUserInfoReal(
                      DBProvider.db.getAllUsers()[index], false),
                  child: buildUserRowContent(
                      user: DBProvider.db.getAllUsers()[index],
                      fromReg: false,
                      sn: '${index + 1}'),
                );
              },
              itemCount: ConsoleState.state.isUserRegistered.value
                  ? DBProvider.db.getAllUsers().length
                  : 0,
            );
          })),
        ],
      ),
    );
  }
}

class DemographicsTable extends StatelessWidget {
  String status;

  DemographicsTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'), opacity: 0.08)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'DATE CREATED'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'STATE'),
                buildRowItem(text: 'LGA AREA'),
                buildRowItem(text: 'FACILITY'),
                buildRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return buildDemographyRowContent(
                    hasBg: index % 2 == 0,
                    date: "23 Jun, 2023",
                    name: DBProvider.db.getAllPatients()[index].firstName,
                    id: DBProvider.db.getAllPatients()[index].id!,
                    facility: "My facility",
                    state: "Lagos state",
                    lga: DBProvider.db.getAllPatients()[index].address,
                    sn: '${index + 1}');
              },
              itemCount: DBProvider.db.getAllPatients().length,
            ),
          ),
        ],
      ),
    );
  }
}

class IdentificationTable extends StatelessWidget {
  String status;

  IdentificationTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'), opacity: 0.08)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'DATE CREATED'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'GROUP ID'),
                buildRowItem(text: 'MEDICAL CLASS'),
                buildRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return buildIdentificationRowContent(
                    date: "23 Jun, 2023",
                    name: DBProvider.db.getAllPatients()[index].firstName,
                    id: DBProvider.db.getAllPatients()[index].id!,
                    groupId: '#675768',
                    hasBg: index % 2 == 0,
                    sn: '${index + 1}');
              },
              itemCount: DBProvider.db.getAllPatients().length,
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopPatienntScheduleTable extends StatefulWidget {
  String status;
  bool fromEngagement;

  DesktopPatienntScheduleTable({
    required this.status,
    this.fromEngagement = false,
  });

  @override
  State<DesktopPatienntScheduleTable> createState() =>
      _DesktopPatienntScheduleTableState();
}

class _DesktopPatienntScheduleTableState
    extends State<DesktopPatienntScheduleTable> {
  List<PatientSchedule> schedules = [];
  DesktopTimeType timeSelected = DesktopTimeType.today;

  void getSchedules() {
    if (timeSelected == DesktopTimeType.today) {
      schedules = DBProvider.db.getTodaySchedules();
    } else if (timeSelected == DesktopTimeType.tomorrow) {
      schedules = DBProvider.db.getTomorrowSchedules();
    } else {
      schedules = DBProvider.db.getWeekSchedules();
    }

    setState(() {
      // reload
    });
  }

  @override
  void initState() {
    getSchedules();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'),
              opacity: 0.08,
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: false, text: 'ID'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'CASE'),
                buildRowItem(text: 'APPT. DATE'),
                buildRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            return Visibility(
              visible: selectedScheduleType.value == DesktopTimeType.today ||
                  selectedScheduleType.value == DesktopTimeType.tomorrow ||
                  selectedScheduleType.value == DesktopTimeType.week,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  List<PatientSchedule> newSch = selectedScheduleType.value ==
                          DesktopTimeType.today
                      ? DBProvider.db.getTodaySchedules()
                      : selectedScheduleType.value == DesktopTimeType.tomorrow
                          ? DBProvider.db.getTomorrowSchedules()
                          : DBProvider.db.getWeekSchedules();
                  return buildScheduleRowContent(
                    hasBg: index % 2 == 0,
                    date: ConsoleService.processReadableDate(
                        newSch[index].appointmentDate.value),
                    name: newSch[index].patientName,
                    id: newSch[index].id ?? 'Nil',
                    caseType: newSch[index].patientCase,
                    schedule: newSch[index],
                    sn: '${index + 1}',
                    fromEngagement: widget.fromEngagement,
                  );
                },
                itemCount: selectedScheduleType.value == DesktopTimeType.today
                    ? DBProvider.db.getTodaySchedules().length
                    : selectedScheduleType.value == DesktopTimeType.tomorrow
                        ? DBProvider.db.getTomorrowSchedules().length
                        : DBProvider.db.getWeekSchedules().length,
              ),
            );
          })),
        ],
      ),
    );
  }
}

class EngagementTable extends StatefulWidget {
  @override
  State<EngagementTable> createState() => _EngagementTableState();
}

class _EngagementTableState extends State<EngagementTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'),
              opacity: 0.08,
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: false, text: 'ID', engagement: true, hasLeftMargin: true),
                buildRowItem(text: 'NAME', engagement: true),
                buildRowItem(text: 'TEMPERATURE', engagement: true),
                buildRowItem(text: 'PULSE', engagement: true),
                buildRowItem(text: 'UPP. BLOOD PRES', engagement: true),
                buildRowItem(text: 'LOW. BLOOD PRES.', engagement: true),
                buildRowItem(text: 'OXY. SAT', engagement: true),
                buildRowItem(text: 'RESP. RATE', engagement: true),
                buildRowItem(text: 'HEIGHT(cm)', engagement: true),
                buildRowItem(text: 'WEIGHT(kg)', engagement: true),
                buildRowItem(text: 'FILE', engagement: true),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return buildEngagementRowContent(
                    hasBg: index % 2 == 0,
                    hasLeftMargin: true,
                    engagement: DBProvider.db.getAllEngagements()[index],
                    sn: '${index + 1}',
                  );
                },
                itemCount: DBProvider.db.getAllEngagements().length),
          ),
        ],
      ),
    );
  }
}

class RegisteredPatient extends StatelessWidget {
  String status;

  RegisteredPatient({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('./assets/images/smiling.jpg'),
              opacity: 0.08,
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            height: 0.05.sh,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            color: ColorPalette.fairGrey,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowItem(hasBox: true, text: 'ID'),
                buildRowItem(text: 'PATIENT NAME'),
                buildRowItem(text: 'STATUS'),
                buildRowItem(text: 'STATUS BY %'),
                buildRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => viewPatientInfoReal(
                      DBProvider.db.getAllPatients()[index], true),
                  child: buildRegRowContent(
                      status: "Completed",
                      name: DBProvider.db.getAllPatients()[index].firstName,
                      id: DBProvider.db.getAllPatients()[index].id!,
                      percent: "100%",
                      patient: DBProvider.db.getAllPatients()[index],
                      fromReg: true,
                      hasBg: index % 2 == 0,
                      sn: '${index + 1}'),
                );
              },
              itemCount: ConsoleState.state.regViewText.value ==
                      'Registered Patients (Incomplete)'
                  ? 0
                  : DBProvider.db.getAllPatients().length,
            );
          })),
        ],
      ),
    );
  }
}

Widget buildUserRowContent({
  hasBg = true,
  User? user,
  required bool fromReg,
  required sn,
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 0.098.sw,
            child: Row(
              children: [
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  '$sn.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorPalette.offBlack),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  'US23',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      overflow: TextOverflow.ellipsis,
                      color: ColorPalette.offBlack),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              ConsoleService.processReadableDate(
                  DateTime.now().toIso8601String()),
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              '${user?.firstName} ${user?.lastName}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              '${user?.username}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              '${user?.primaryAssignment}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              '${user?.nationality}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Text(
              '100%',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.098.sw,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => editUserInfoReal(user!),
                    child: const Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => viewUserInfoReal(user!, false),
                    child: const Icon(
                      FontAwesomeIcons.eye,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildScheduleRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String date = "",
  String caseType = "",
  bool fromEngagement = false,
  required String sn,
  PatientSchedule? schedule,
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.09.sw,
            child: Text(
              id,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.offBlack),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              caseType,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              date,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Visibility(
              visible: !fromEngagement,
              replacement: InkWell(
                  onTap: () {
                    ConsoleState.state.scheduleToEngage = schedule;
                    ConsoleState.state.showEngagementForm.value = true;
                  },
                  child: const Text(
                    "Engage Patient",
                    style: TextStyle(color: ColorPalette.mainButtonColor),
                  )),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        try {
                          ConsoleState.state.patientSchedule = schedule;
                          ConsoleState.state.editAction.value = true;
                          ConsoleState.state.isScheduleViewOnly.value = false;
                          ConsoleState.state.patientSchedule?.appointmentDate
                              .value = schedule!.appointmentDate.value;
                        } catch (e) {
                          //
                        }
                      },
                      child: const Icon(
                        FontAwesomeIcons.penToSquare,
                        size: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      try {
                        ConsoleState.state.patientSchedule = schedule;
                        ConsoleState.state.editAction.value = true;
                        ConsoleState.state.isScheduleViewOnly.value = true;
                        ConsoleState.state.patientSchedule?.appointmentDate
                            .value = schedule!.appointmentDate.value;
                      } catch (e) {
                        //
                      }
                    },
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: ColorPalette.grey),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildEngagementRowContent({
  required String sn,
  PatientEngagement? engagement,
  bool hasBg = false,
  bool hasLeftMargin = false,
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$sn.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.offBlack),
            ),
          ),
          text(
            engagement!.schedule!.patient!.firstName,
          ),
          text(
            engagement.temperature,
          ),
          text(
            engagement.pulse,
          ),
          text(
            engagement.upperBloodPressure,
          ),
          text(
            engagement.lowerBloodPressure,
          ),
          text(
            engagement.oxySaturation,
          ),
          text(
            engagement.respiratoryRate,
          ),
          text(
            engagement.height,
          ),
          text(
            engagement.weight,
          ),
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showDoc(engagement.attachment!);
                  },
                  child: const Icon(
                    IconlyBold.download,
                    color: ColorPalette.mainButtonColor,
                    size: 13,
                  ),
                ),
               const  SizedBox(width: 5.0,),
                InkWell(
                  onTap: () {
                    individualPrint('${engagement.schedule!.patient!.firstName}.pdf', engagement);
                  },
                  child: const Icon(
                    Icons.print,
                    color: ColorPalette.mainButtonColor,
                    size: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget text(String text) {
  return Expanded(
    child: Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: ColorPalette.grey),
    ),
  );
}

Widget buildRegRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String status = "",
  String percent = "",
  required RegPatient patient,
  required bool fromReg,
  required String sn,
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.09.sw,
            child: Text(
              id,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.offBlack),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              name,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              status,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              percent,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => editPatientInfoReal(patient, fromReg: true),
                    child: const Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => showScheduleDialog(patient),
                    child: const Icon(
                      CupertinoIcons.calendar,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => viewPatientInfoReal(patient, true),
                    child: const Icon(
                      FontAwesomeIcons.eye,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildDemographyRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String date = "",
  String state = "",
  String lga = "",
  String facility = "",
  required String sn,
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.09.sw,
            child: Row(
              children: [
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  '$sn.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorPalette.offBlack),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  id,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorPalette.offBlack),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              date,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              name,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              state,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              lga,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              facility,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Row(
              children: const [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: editPatientInfo,
                    child: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: viewPatientInfo,
                    child: Icon(
                      FontAwesomeIcons.eye,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildIdentificationRowContent(
    {hasBg = true,
    String id = "",
    String name = "",
    String groupId = "",
    String date = "",
    required String sn}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.1.sw,
            child: Row(
              children: [
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  '$sn.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorPalette.offBlack),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  id,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorPalette.offBlack),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.1.sw,
            child: Text(
              date,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.1.sw,
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.1.sw,
            child: Text(
              groupId,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.1.sw,
            child: Text(
              'Individual',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.1.sw,
            child: Row(
              children: [
                const Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: editPatientInfo,
                    child: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  onTap: viewPatientInfo,
                  child: Text(
                    'View',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: ColorPalette.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget createdArrowUpDown() {
  return SizedBox(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          FontAwesomeIcons.caretDown,
          size: 10,
          color: ColorPalette.offBlack,
        ),
        Icon(FontAwesomeIcons.caretUp, size: 10, color: Colors.grey),
      ],
    ),
  );
}

Widget buildRowItem({
  bool hasBox = false,
  String text = "",
  bool engagement = false,
  bool hasLeftMargin = false,
}) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       if(hasLeftMargin) const SizedBox(width: 5.0,),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.grey,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    ),
  );
}

Widget buildDashRowItem({bool hasBox = false, String text = ""}) {
  return SizedBox(
    width: 0.098.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 7.0,
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.grey),
        ),
        const SizedBox(
          width: 7.0,
        ),
        createdArrowUpDown(),
      ],
    ),
  );
}
