import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/database/provider.dart';
import 'package:console/screens/desktop/dashboard/navigation.dart';
import 'package:console/screens/mobile/dashboard/dashboard.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/desktop/patient-list-tiles.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../../api-calls/schedule-patient.dart';
import '../../../../../models/patient-schedule.dart';
import '../../../../../state-management/state-management.dart';
import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../../widgets/mobile/table.dart';
import '../../dashboard.dart';

enum DesktopTimeType { today, tomorrow, week }
Rx<DesktopTimeType> selectedScheduleType = DesktopTimeType.today.obs;

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
          DesktopScheduleHeader(),
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
                Expanded(flex: 2, child: BuildScheduleCalendar()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildScheduleCalendar extends StatelessWidget {
  BuildScheduleCalendar({Key? key}) : super(key: key);

  Rx<bool> loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 0.01.sw),
        child: Obx(() {
          return !ConsoleState.state.editAction.value ? Padding(
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
                        selectedItem.value = CurrentSelectedNavItem.patientReg;
                      }),
                ],
              ),
            ) : Container(
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
                            schedule: ConsoleState
                                .state
                                .patientSchedule!,
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
                                      DateTime.now().toIso8601String())),
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
                          Obx(() => Visibility(
                                visible: !ConsoleState
                                    .state.isScheduleViewOnly.value,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    OutlinedBtn(
                                      buttonText: 'Cancel',
                                      verticalPadding: 0.02.sh,
                                      horPadding: 0.02.sw,
                                      borderColor: Colors.red,
                                      textColor: Colors.red,
                                    ),
                                    Obx(
                                      () => FlatButton(
                                        buttonText: 'Commit',
                                        verticalPadding: 0.02.sh,
                                        horPaddding: 0.02.sw,
                                        loading: loading.value,
                                        onTap: () async {
                                          loading.value = true;
                                          if (await editSchedule(ConsoleState
                                              .state.patientSchedule!)) {
                                            Get.to(DesktopNavigation());
                                            showSuccessSheet('Success!',
                                                'Appointment schedule edited successfully');
                                          }
                                          loading.value = false;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          );
        }));
  }
}


class DesktopScheduleHeader extends StatelessWidget {
  bool isUser;

  DesktopScheduleHeader({Key? key, this.isUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.01.sh, left: 0.017.sw, right: 0.01.sw),
      height: 0.17.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                    selectedScheduleType.value = DesktopTimeType.today,
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.mainButtonColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 0.15.sh,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    AssetImage('./assets/images/wave.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    './assets/images/new-graph.png',
                                    height: 0.04.sh,
                                  ),
                                  const Text(
                                    'Today\'s Appointments',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        IconlyBold.calendar,
                                        color: ColorPalette.secondColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                       '${DBProvider.db.getTodaySchedules().length}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => selectedScheduleType.value = DesktopTimeType.tomorrow,
                        child: buildFigureCard("Tomorrow's", "Appointments",
                            figure:'${DBProvider.db.getTomorrowSchedules().length}'
                            ,
                            isRegistered: true,
                            isUser: false),
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      GestureDetector(
                        onTap: () => selectedScheduleType.value = DesktopTimeType.week,
                        child: buildFigureCard("Weekly", "Appointments",
                            figure: '${DBProvider.db.getWeekSchedules().length}',
                            color: ColorPalette.lightRed,
                            isRegistered: false,
                            isUser: false),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 0.03.sw,
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: FlatTextField(
                          hintText: 'Search by parameter',
                          suffixIcon: CupertinoIcons.search,
                          fillColor: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 0.01.sw,
                              ),
                              GestureDetector(
                                onTap: () => showFilterDialog(),
                                child: DesktopConsoleIconButton(
                                  icon: IconlyLight.filter,
                                  text: 'Filter/Sort',
                                ),
                              ),
                              // SizedBox(
                              //   width: 0.01.sw,
                              // ),
                              // DesktopConsoleIconButton(
                              //   icon: Icons.filter_list,
                              //   text: 'Sort',
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 0.017.sh,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}