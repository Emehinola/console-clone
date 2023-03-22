import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api-calls/schedule-patient.dart';
import '../../models/user.dart';
import '../../state-management/state-management.dart';
import '../desktop/dialogs.dart';
import '../mob-desk/forms/console-text-field.dart';
import '../mob-desk/forms/dropdowns.dart';
import '../mob-desk/theme/color-palette.dart';
import 'drawer.dart';
import 'table.dart';

void showScheduleSheet(BuildContext context, {bool isUpdate = false}) {
  DateTime dt = DateTime.now();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(
        maxHeight: Get.height * 0.9, minHeight: Get.height * 0.6),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: ColorPalette.mainButtonColor,
              ),
              child: const Text(
                'Patient Scheduler',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SchedulePatientCard(
                      status: 'Schedule',
                    ),
                    Obx((){
                      return CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.single,
                            currentDate: DateTime.parse(ConsoleState
                                .state
                                .patientSchedule
                                ?.appointmentDate
                                .value ??
                                DateTime.now().toIso8601String())
                        ),
                        onValueChanged: (date) {
                          try {
                            ConsoleState
                                .state
                                .patientSchedule!
                                .appointmentDate
                                .value = date.first!.toIso8601String();
                          } catch (e) {
                            //
                          }
                        },
                        initialValue: [],
                      );
                    }),
                    Obx(((){
                      return FlatButton(
                        buttonText: 'Commit',
                        verticalPadding: 20,
                        loading: ConsoleState.state.loading.value,
                        onTap: () async {
                          if ( isUpdate ? await editSchedule(ConsoleState.state.patientSchedule!) : await schedulePatient()) {

                            Get.to(
                              DisplaySuccess(
                                title: isUpdate ? 'Schedule updated' : 'Schedule submitted',
                                description: 'Your schedule has been submitted!',
                                nextText: 'Continue',
                                onNext: () => Navigator.popUntil(context,
                                    ModalRoute.withName('/schedule-list-mobile')),
                              ),
                            );
                          }
                        },
                      );
                    }))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void displayUserInfoSheet(BuildContext context, User user) {
  DateTime dt = DateTime.now();

  String firstName = "";
  String lastName = "";

  try {
    firstName = user.fullName.split(' ')[0];
    lastName = user.fullName.split(' ')[1];
  } catch (e) {
    //
  }

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(maxHeight: 0.6.sh, minHeight: 0.6.sh),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: ColorPalette.mainButtonColor,
              ),
              child: const Text(
                'User Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('First Name', firstName, 'Last Name', lastName),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Email Address', user.username, 'Biodata',
                        user.bioData),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Official Details', user.officialDetails, '', ''),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Other Details', user.otherDetails, '', ''),
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
          ],
        ),
      );
    },
  );
}

void displayPatientInfoSheet(BuildContext context, RegPatient patient) {
  DateTime dt = DateTime.now();

  String firstName = "";
  String lastName = "";

  try {
    firstName = patient.patientName.split(' ')[0];
    lastName = patient.patientName.split(' ')[1];
  } catch (e) {
    //
  }

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(maxHeight: 0.6.sh, minHeight: 0.6.sh),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: ColorPalette.mainButtonColor,
              ),
              child: const Text(
                'Patient Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('First Name', firstName, 'Last Name', lastName),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Principal Details', patient.principalDesignation,
                        'Principal Work Details', patient.principalWorkDetails),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Health Record', patient.medRecord, 'Group Type',
                        '${patient.groupType}'),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Account Tier', patient.acctTier, 'Biodata',
                        patient.biodata),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Contact Details', patient.acctTier, '', '',
                        isFull: true),
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
          ],
        ),
      );
    },
  );
}

void engagementSheet(BuildContext context) {
  DateTime dt = DateTime.now();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    constraints: BoxConstraints(
        maxHeight: Get.height * 0.9, minHeight: Get.height * 0.6),
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            title('Personal Info', textColor: ColorPalette.offBlack),
            FlatTextField(
              hintText: 'Full Name',
            ),
            FlatTextBoxField(hintText: 'Bio data'),
            title('Medical Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Health Record'),
            title('Account Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Account Tier'),
            ConsoleDropdown(
              label: 'Group Type',
              options: const [
                'Group 1',
                'Group 2',
                'Group 3',
              ],
              value: 'Group 1',
              onChanged: (value) {
                //
              },
            ),
            title('Contact Info', textColor: ColorPalette.offBlack),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ConsoleDropdown(
                    options: const [
                      '+234',
                    ],
                    value: '+234',
                    onChanged: (value) {
                      //
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: FlatTextField(
                    hintText: 'Phone Number',
                    maxInput: 10,
                  ),
                ),
              ],
            ),
            FlatTextBoxField(hintText: 'Contact Details'),
            title('Principal Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Principal Designation'),
            FlatTextBoxField(hintText: 'Principal Work Details'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    },
  );
}
