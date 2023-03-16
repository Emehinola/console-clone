import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:console/widgets/sheets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';

class PatientsSchedulerList extends StatefulWidget {
  const PatientsSchedulerList({Key? key}) : super(key: key);

  @override
  State<PatientsSchedulerList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsSchedulerList> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
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
                    iconData: CupertinoIcons.add,
                    onTap: () => showScheduleSheet(context),
                  ))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
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
                                  children: const [
                                    Icon(
                                      IconlyBold.user_3,
                                      color: ColorPalette.secondColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '81',
                                      style: TextStyle(
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
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.lightGreen,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 50,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorPalette.mainButtonColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                '64',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Tomorrow\'s',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Appointments',
                                  style: TextStyle(
                                      color: ColorPalette.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorPalette.lightRed,
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 50,
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ColorPalette.mainButtonColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                '17',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Weekly',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Appointments',
                                  style: TextStyle(
                                      color: ColorPalette.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      color: ColorPalette.cardGrey,
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
                            child: Column(
                              children: [
                                FlatTextField(
                                  hintText: 'Search by parameter',
                                  suffixIcon: CupertinoIcons.search,
                                  fillColor: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        child: ConsoleIconButton(
                                      icon: IconlyLight.filter,
                                      text: 'Filter',
                                    )),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: ConsoleIconButton(
                                        icon: Icons.filter_list,
                                        text: 'Sort',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          SchedulePatientCard(
                            status: "Schedule",
                            onTap: () {
                              showScheduleSheet(context);
                            },
                          ),
                          SchedulePatientCard(
                            status: "Scheduled",
                            onTap: () {},
                          ),
                          SchedulePatientCard(
                            status: "Schedule",
                            onTap: () {
                              showScheduleSheet(context);
                            },
                          ),
                          SchedulePatientCard(
                            status: "Scheduled",
                            onTap: () {},
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
