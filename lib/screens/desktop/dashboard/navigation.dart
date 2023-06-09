import 'package:console/database/provider.dart';
import 'package:console/screens/desktop/dashboard/dashbaord-items/practice-management/registration/patient-reg.dart';
import 'package:console/screens/desktop/dashboard/dashbaord-items/practice-management/patient-schedule.dart';
import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/screens/desktop/onboarding/welcome-screen.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../widgets/mobile/drawer.dart';
import 'patient-id-engine/demographics.dart';
import 'patient-id-engine/identification.dart';
import 'patient-id-engine/patient-engagement.dart';

class DesktopNavigation extends StatelessWidget {
  DesktopNavigation({Key? key}) : super(key: key);

  Map<CurrentSelectedNavItem, Widget> screenMap = {
    CurrentSelectedNavItem.dashboard: DesktopDashboard(),
    CurrentSelectedNavItem.patientReg: const DesktopPatientRegistration(),
    CurrentSelectedNavItem.patientScheduling: const DesktopPatientSchedule(),
    CurrentSelectedNavItem.patientEngagementReg:
        const DesktopPatientEngagement(),
    CurrentSelectedNavItem.demographics: DesktopDemography(),
    CurrentSelectedNavItem.identification: DesktopIdentification(),
    // CurrentSelectedNavItem.identityMatching: DesktopIdentificationMatching(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Row(
          children: [
            Container(
              color: ColorPalette.dark,
              width: 0.2.sw,
              child: SideNavBar(),
            ),
            Expanded(
              child: Obx(() {
                return Container(
                  child: screenMap[selectedItem.value],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        color: ColorPalette.dark,
        padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: () {
                      selectedItem.value = CurrentSelectedNavItem.dashboard;
                    }, child: Obx(() {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              './assets/images/console.jpeg',
                              height: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Dashboard",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              color: selectedItem.value ==
                                      CurrentSelectedNavItem.dashboard
                                  ? ColorPalette.secondColor
                                  : Colors.white,
                            ),
                          ),
                        ],
                      );
                    })),
                    IconButton(
                      onPressed: () {
                        selectedItem.value = CurrentSelectedNavItem.dashboard;
                      },
                      tooltip: 'Dashboard',
                      icon: Icon(
                        FontAwesomeIcons.house,
                        color: Colors.white,
                        size: 0.012.sw,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorPalette.grey,
                ),
                const SizedBox(
                  height: 50,
                ),
                title("Practice Management", textColor: Colors.white),
                SizedBox(
                  height: 0.01.sh,
                ),
                Obx(() {
                  return Column(
                    children: [
                      desktopNavItem(
                        'Patient Registration',
                        FontAwesomeIcons.users,
                        CurrentSelectedNavItem.patientReg,
                        active: selectedItem.value ==
                            CurrentSelectedNavItem.patientReg,
                      ),
                      desktopNavItem(
                          'Patient Scheduling',
                          FontAwesomeIcons.calendar,
                          CurrentSelectedNavItem.patientScheduling,
                          active: selectedItem.value ==
                              CurrentSelectedNavItem.patientScheduling),
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      title('Practice Identification Engine',
                          textColor: Colors.white),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      desktopNavItem(
                          'Patient Engagement Reg',
                          FontAwesomeIcons.book,
                          CurrentSelectedNavItem.patientEngagementReg,
                          active: selectedItem.value ==
                              CurrentSelectedNavItem.patientEngagementReg),
                      Row(
                        children: [
                          SizedBox(
                            width: 0.03.sw,
                          ),
                          subNavItem(
                            'All Engagements',
                            FontAwesomeIcons.book,
                          ),
                        ],
                      ),
                      desktopNavItem('Demographics', FontAwesomeIcons.chartPie,
                          CurrentSelectedNavItem.demographics,
                          active: selectedItem.value ==
                              CurrentSelectedNavItem.demographics),
                      desktopNavItem(
                          'Identification',
                          FontAwesomeIcons.passport,
                          CurrentSelectedNavItem.identification,
                          active: selectedItem.value ==
                              CurrentSelectedNavItem.identification),
                      desktopNavItem(
                          'Identity Matching', CupertinoIcons.arrow_swap, null,
                          active: selectedItem.value ==
                              CurrentSelectedNavItem.identityMatching),
                    ],
                  );
                }),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                buttonText: 'Sign out',
                verticalPadding: 15,
                onTap: () {
                  Get.to(const DesktopWelcome());
                  // Navigator.popUntil(context, ModalRoute.withName('/desktop-auth'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget desktopNavItem(
    String title, IconData iconData, CurrentSelectedNavItem? screen,
    {active = false}) {
  return GestureDetector(
    onTap: () {
      if (screen == null) {
        showIdentityTypes();
        return;
      }
      ConsoleState.state.showAllEngagements.value = false;
      ConsoleState.state.patientToEdit = null;
      selectedItem.value = screen;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: active ? ColorPalette.secondColor : ColorPalette.grey,
            size: 0.01.sw,
          ),
          SizedBox(
            width: 0.01.sw,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: active ? ColorPalette.secondColor : ColorPalette.grey),
          ),
        ],
      ),
    ),
  );
}

Widget subNavItem(
  String title,
  IconData iconData,
) {
  return GestureDetector(
    onTap: () {
      selectedItem.value = CurrentSelectedNavItem.patientEngagementReg;
      ConsoleState.state.showAllEngagements.value = true;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Obx(
            () => Icon(
              iconData,
              color: ConsoleState.state.showAllEngagements.value
                  ? ColorPalette.secondColor
                  : ColorPalette.grey,
              size: 0.01.sw,
            ),
          ),
          SizedBox(
            width: 0.01.sw,
          ),
          Obx(
            () => Text(
              title,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: ConsoleState.state.showAllEngagements.value
                      ? ColorPalette.secondColor
                      : ColorPalette.grey),
            ),
          ),
        ],
      ),
    ),
  );
}
