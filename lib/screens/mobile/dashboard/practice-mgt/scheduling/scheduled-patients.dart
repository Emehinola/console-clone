import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/screens/mobile/dashboard/practice-mgt/scheduling/all-patients.dart';
import 'package:console/services/navigate.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:console/widgets/mobile/sheets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../../widgets/mobile/table.dart';

enum TimeType { today, tomorrow, week }

class PatientsSchedulerList extends StatefulWidget {
  const PatientsSchedulerList({Key? key}) : super(key: key);

  @override
  State<PatientsSchedulerList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsSchedulerList> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {

    getSchedules();
    super.initState();
  }

  List<PatientSchedule> schedules = [];
  TimeType timeSelected = TimeType.today;

  void getSchedules() {
    if (timeSelected == TimeType.today) {
      schedules = DBProvider.db.getTodaySchedules();
    } else if (timeSelected == TimeType.tomorrow) {
      schedules = DBProvider.db.getTomorrowSchedules();
    } else {
      schedules = DBProvider.db.getWeekSchedules();
    }

    setState(() {
      // reload
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Patient Scheduling'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  width: 250,
                  child: FlatButton(
                      buttonText: 'Schedule Patient',
                      iconData: CupertinoIcons.calendar,
                      onTap: () => navigate(const AllPatients(),
                              routeName: '/patient-list-mobile')
                          .then((value) =>
                              setState(() {})) // showScheduleSheet(context),
                      ))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      timeSelected = TimeType.today;
                      getSchedules();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.mainButtonColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 130,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('./assets/images/wave.png'),
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    './assets/images/new-graph.png',
                                    height: 50,
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
                          onTap: () {
                            timeSelected = TimeType.tomorrow;
                            getSchedules();
                          },
                          child: scheduleDatesCard('Tomorrow\'s', 'Appointment',
                              '${DBProvider.db.getTomorrowSchedules().length}')),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          timeSelected = TimeType.week;
                          getSchedules();
                        },
                        child: scheduleDatesCard('Weekly', 'Appointment',
                            '${DBProvider.db.getWeekSchedules().length}',
                            color: ColorPalette.lightRed),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: ColorPalette.grey.withOpacity(0.01),
                      boxShadow: const [
                        // BoxShadow(
                        //   color: ColorPalette.shadowColor,
                        //   offset: Offset(0, -5),
                        //   blurRadius: 5,
                        //   spreadRadius: 0.2,
                        //   blurStyle: BlurStyle.outer,
                        // )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0.sp),
                        topRight: Radius.circular(25.0.sp),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: FlatTextField(
                                      hintText: 'Search by parameter',
                                      suffixIcon: CupertinoIcons.search,
                                      fillColor: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: ConsoleIconButton(
                                        icon: IconlyLight.filter,
                                        text: 'Filter',
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const Divider(),
                          Visibility(
                            replacement: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 0.1.sh,
                                  ),
                                  Image.asset(
                                    './assets/images/reg.png',
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                    'No content available',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            visible: DBProvider.db.getAllSchedules().isNotEmpty,
                            child: Column(
                              children: schedules
                                  .map(
                                    (schedule) => SchedulePatientCard(
                                      status: "Scheduled",
                                      schedule: schedule,
                                      onTap: () {
                                        // ConsoleState.state.patientSchedule = schedule;
                                        showScheduleSheet(context,
                                            isUpdate: true);
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget scheduleDatesCard(
  String title,
  String subtitle,
  String value, {
  Color color = ColorPalette.lightGreen,
}) {
  return Container(
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
    height: 50,
    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorPalette.mainButtonColor,
              borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.all(5),
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: ColorPalette.grey, fontSize: 10),
            ),
          ],
        ),
      ],
    ),
  );
}
