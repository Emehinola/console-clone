import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/desktop/patient-list-tiles.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../state-management/state-management.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../dashboard.dart';

class DesktopPatientSchedule extends StatefulWidget {
  const DesktopPatientSchedule({Key? key}) : super(key: key);

  @override
  State<DesktopPatientSchedule> createState() => _PatientsListState();
}

class _PatientsListState extends State<DesktopPatientSchedule> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    ConsoleState.state.patientSchedule = null; // reset
    ConsoleState.state.editAction.value = false; // reset
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderMetrics(),
          const Divider(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DesktopPatienntScheduleTable(
                    status: "Complete",
                  ),
                ),
                const Expanded(flex: 2,child: BuildScheduleCalendar()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildScheduleCalendar extends StatelessWidget {
  const BuildScheduleCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Obx((){
          return Visibility(
            visible: ConsoleState.state.editAction.value,
            replacement: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    './assets/images/schedule.png',
                    height: 0.2.sh,
                  ),
                  SizedBox(
                    height: 0.06.sh,
                  ),
                  FlatButton(
                      buttonText: 'Add Schedule',
                      verticalPadding: 0.015.sh,
                      onTap: () {
                        selectedItem.value = CurrentSelectedNavItem.dashboard;
                      }),
                ],
              ),
            ),
            child: Container(
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
                      color: Colors.white,
                    ),
                    child: Text(
                      'Patient Re-Scheduler',
                      style: TextStyle(
                        color: ColorPalette.grey,
                        fontSize: 18.sp,
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
                          CalendarDatePicker2(
                            config: CalendarDatePicker2Config(
                              calendarType: CalendarDatePicker2Type.single,
                              currentDate: DateTime.parse("${ConsoleState.state.patientSchedule?.appointmentDate ?? DateTime.now().toIso8601String()}")
                            ),
                            onValueChanged: (dates) {},
                            initialValue: [],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedBtn(
                                buttonText: 'Cancel',
                                verticalPadding: 0.02.sh,
                                horPadding: 0.02.sw,
                                borderColor: Colors.red,
                                textColor: Colors.red,
                              ),
                              FlatButton(
                                buttonText: 'Commit',
                                verticalPadding: 0.02.sh,
                                horPaddding: 0.02.sw,
                                onTap: () {
                                  showSuccessSheet('Success!',
                                      'Appointment schedule submitted successfully');
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
