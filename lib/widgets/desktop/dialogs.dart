import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/screens/desktop/dashboard/navigation.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../api-calls/schedule-patient.dart';
import '../../state-management/controller-variables.dart';
import '../mob-desk/buttons/console-text-button.dart';
import '../mob-desk/custom/cards.dart';

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

void showErrorDialog(String title, String desc) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.3.sh,
              width: 0.2.sw,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.xmark,
                      size: 0.06.sh,
                      color: Colors.red,
                    ),
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
                    detailRow(
                        'Group Type', 'Group 1', 'Account Tier', 'Tier 1'),
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

void showInfoDialogueReal(RegPatient patient, {required bool fromReg}) {
  String firstName = "";
  String lastName = "";

  try {
    firstName = patient.patientName.split(' ')[0];
    lastName = patient.patientName.split(' ')[1];
  } catch (e) {
    //
  }

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){
                                ConsoleState.state.patientToEdit = patient;
                                Navigator.pop(context);
                                if(fromReg){
                                  ConsoleState.state.regViewText.value = "Update user profile";
                                  Get.to(DesktopNavigation());
                                  selectedItem.value = CurrentSelectedNavItem.patientReg;
                                }else{
                                  selectedItem.value = CurrentSelectedNavItem.patientReg;
                                  ConsoleState.state.regViewText.value = "Update user profile";
                                }
                              },
                              child: const Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('First Name', firstName, 'Last Name', lastName),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Group Type', 'Group 1', 'Account Tier',
                          patient.acctTier),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Phone', patient.phone, '', ''),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Address', patient.contactDetails, '', '', isFull: true),
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
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showScheduleDialog(RegPatient patient) {
  ConsoleState.state.patientSchedule = PatientSchedule(
    id: patient.id,
    patientCase: 'Emergency',
    patientName: patient.patientName,
    appointmentDate: DateTime.now().toIso8601String().obs,
  ); // set schedule to state

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Scheduler',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SchedulePatientCardReal(
                        status: 'Schedule',
                        patient: patient,
                      ),
                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        onValueChanged: (date) {
                          try{
                            ConsoleState.state.patientSchedule!.appointmentDate.value = date.first!.toIso8601String();
                          }catch(e){
                            //
                          }
                        },
                        initialValue: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedBtn(
                            buttonText: 'Cancel',
                            verticalPadding: 0.02.sh,
                            horPadding: 0.03.sw,
                            borderColor: Colors.red,
                            textColor: Colors.red,
                            onTap: () => Navigator.pop(context),
                          ),
                          Obx((){
                            return FlatButton(
                              buttonText: 'Commit',
                              verticalPadding: 0.02.sh,
                              horPaddding: 0.03.sw,
                              loading: ConsoleState.state.loading.value,
                              onTap: () async {
                                if(await schedulePatient()){
                                  Navigator.pop(context);
                                  selectedItem.value = CurrentSelectedNavItem.patientScheduling;
                                  showSuccessSheet('Success', 'Patient schedule successful');
                                }
                              },
                            );
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showFilterDialog() {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Container(
              constraints: BoxConstraints(maxHeight: 0.3.sh),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConsoleDropdown(
                        label: 'Filter by:',
                        value: 'Patient Name',
                        options: const [
                          'Patient Name',
                          'ID',
                          'Date Created',
                          'Group Type',
                          'Contact',
                          'Account Tier',
                          'Address',
                        ],
                        onChanged: (value) {
                          // TODO: change value
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            buttonText: 'Apply Filter',
                            verticalPadding: 0.02.sh,
                            applyingMargin: false,
                            onTap: () {
                              Get.back();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

Widget detailRow(String title1, String value1, String title2, String value2, {bool isFull = false}) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 13.sp),
            ),
            Text(
              value1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      if(!isFull) SizedBox(
        width: 0.08.sw,
      ),
      if(!isFull) Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 13.sp),
            ),
            Text(
              value2,
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      )
    ],
  );
}
