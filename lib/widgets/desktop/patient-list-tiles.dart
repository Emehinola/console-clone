import 'package:console/database/provider.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/services/console-services.dart';
import 'package:console/state-management/state-management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/patient-schedule.dart';
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
      ),
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
                buildDashRowItem(hasBox: true, text: 'ID'),
                buildDashRowItem(text: 'DATE CREATED'),
                buildDashRowItem(text: 'PATIENT NAME'),
                buildDashRowItem(text: 'GROUP TYPE'),
                buildDashRowItem(text: 'CONTACT'),
                buildDashRowItem(text: 'ACCOUNT TIER'),
                buildDashRowItem(text: 'ADDRESS'),
                buildDashRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return buildRowContent(
                  date: DBProvider.db.getAllPatients()[index].date ??
                      DateTime.now().toIso8601String(),
                  hasBg: index % 2 == 0,
                  name: DBProvider.db.getAllPatients()[index].patientName,
                  id: DBProvider.db.getAllPatients()[index].id ?? "P001",
                  groupType: DBProvider.db.getAllPatients()[index].groupType ??
                      "Group 1",
                  acctTier: DBProvider.db.getAllPatients()[index].acctTier,
                  contact: DBProvider.db.getAllPatients()[index].phone,
                  address: DBProvider.db.getAllPatients()[index].contactDetails,
                  patient: DBProvider.db.getAllPatients()[index],
                );
              },
              itemCount: DBProvider.db.getAllPatients().length,
            ),
          ),
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
      ),
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
                  hasBg: false,
                  date: "23 Jun, 2023",
                  name: DBProvider.db.getAllPatients()[index].patientName,
                  id: DBProvider.db.getAllPatients()[index].id!,
                  facility: "My facility",
                  state: "Lagos state",
                  lga: DBProvider.db.getAllPatients()[index].contactDetails,
                );
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
      ),
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
                  name: DBProvider.db.getAllPatients()[index].patientName,
                  id: DBProvider.db.getAllPatients()[index].id!,
                  groupId: '#675768',
                );
              },
              itemCount: DBProvider.db.getAllPatients().length,
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopPatienntScheduleTable extends StatelessWidget {
  String status;

  DesktopPatienntScheduleTable({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
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
                buildRowItem(text: 'CASE'),
                buildRowItem(text: 'APPOINTMENT DATE'),
                buildRowItem(text: 'ACTION'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return buildScheduleRowContent(
                  hasBg: index % 2 == 0,
                  date: ConsoleService.processReadableDate(DBProvider.db.getAllSchedules()[index].appointmentDate.value),
                  name: DBProvider.db.getAllSchedules()[index].patientName,
                  id: DBProvider.db.getAllSchedules()[index].id ?? 'Nil',
                  caseType: DBProvider.db.getAllSchedules()[index].patientCase,
                  schedule: DBProvider.db.getAllSchedules()[index],
                );
              },
              itemCount: DBProvider.db.getAllSchedules().length,
            ),
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
      ),
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
          Expanded(
            child: Obx((){
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return buildRegRowContent(
                    status: "Completed",
                    name: DBProvider.db.getAllPatients()[index].patientName,
                    id: DBProvider.db.getAllPatients()[index].id!,
                    percent: "100%",
                    patient: DBProvider.db.getAllPatients()[index],
                  );
                },
                itemCount: ConsoleState.state.regViewText.value == 'Registered Users (Incomplete)' ? 0 : DBProvider.db.getAllPatients().length,
              );
            })
          ),
        ],
      ),
    );
  }
}

Widget buildRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String date = "",
  String groupType = "",
  String contact = "",
  String acctTier = "",
  String address = "",
  RegPatient? patient,
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
                Transform.scale(
                  scale: 0.7,
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  id,
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
            width: 0.09.sw,
            child: Text(
              ConsoleService.processReadableDate(date),
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              groupType,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              contact,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              acctTier,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  overflow: TextOverflow.ellipsis,
                  color: ColorPalette.grey),
            ),
          ),
          SizedBox(
            width: 0.09.sw,
            child: Text(
              address,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
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
                    onTap: () => editPatientInfoReal(patient!),
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
                    onTap: () => showScheduleDialog(patient!),
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
                InkWell(
                  onTap: () => viewPatientInfoReal(patient!),
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

Widget buildScheduleRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String date = "",
  String caseType = "",
  PatientSchedule? schedule
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                  side: const BorderSide(
                    color: Colors.grey,
                  ),
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
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
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            caseType,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            date,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Row(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    ConsoleState.state.patientSchedule = schedule;
                    ConsoleState.state.editAction.value = true;
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
                  ConsoleState.state.patientSchedule = schedule;
                  ConsoleState.state.editAction.value = true;
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
          )
        ],
      ),
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
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.7,
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.person_solid,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ],
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
                InkWell(
                  onTap: () => viewPatientInfoReal(patient),
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

Widget buildDemographyRowContent({
  hasBg = true,
  String id = "",
  String name = "",
  String date = "",
  String state = "",
  String lga = "",
  String facility = "",
}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                  side: const BorderSide(
                    color: Colors.grey,
                  ),
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
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
          Text(
            date,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            state,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            lga,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            facility,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Row(
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
    String date = ""}) {
  return Container(
    color: hasBg ? ColorPalette.lightMain2 : Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                  side: const BorderSide(
                    color: Colors.grey,
                  ),
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
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
          Text(
            date,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            groupId,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Text(
            'Individual',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorPalette.grey),
          ),
          Row(
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

Widget buildRowItem({bool hasBox = false, String text = ""}) {
  return SizedBox(
    width: 0.09.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (hasBox)
          Checkbox(
            value: false,
            onChanged: (value) {},
            side: const BorderSide(
              color: Colors.grey,
            ),
            fillColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
          ),
        if (hasBox)
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
Widget buildDashRowItem({bool hasBox = false, String text = ""}) {
  return SizedBox(
    width: 0.09.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (hasBox)
          Checkbox(
            value: false,
            onChanged: (value) {},
            side: const BorderSide(
              color: Colors.grey,
            ),
            fillColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
          ),
        if (hasBox)
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
