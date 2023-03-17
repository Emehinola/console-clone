import 'package:console/screens/desktop/dashboard/dashbaord-items/practice-management/patient-reg.dart';
import 'package:console/screens/desktop/dashboard/dashbaord-items/practice-management/patient-schedule.dart';
import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/screens/desktop/dashboard/patient-id-engine/identification-matching.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../services/constants.dart';
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
    CurrentSelectedNavItem.patientEngagementReg: const DesktopPatientEngagement(),
    CurrentSelectedNavItem.demographics: DesktopDemography(),
    CurrentSelectedNavItem.identification: DesktopIdentification(),
    CurrentSelectedNavItem.identityMatching: DesktopIdentificationMatching(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Row(
          children: [
            Container(
              color: ColorPalette.dark,
              width: Get.width * 0.2,
              child: SideNavBar(),
            ),
            Expanded(
              child: Obx((){
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    selectedItem.value = CurrentSelectedNavItem.dashboard;
                  },
                  child: Obx((){
                    return Row(
                      children: [
                        Container(
                          width: 5,
                          height: 20,
                          decoration: BoxDecoration(
                              color:
                              selectedItem.value == CurrentSelectedNavItem.dashboard
                                  ? ColorPalette.secondColor
                                  : ColorPalette.grey,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )),
                        ),
                        const SizedBox(width: 20,),
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: selectedItem.value == CurrentSelectedNavItem.dashboard
                                ? ColorPalette.secondColor
                                : Colors.white,
                          ),
                        ),
                      ],
                    );
                  })
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: 'Refresh',
                  icon: const Icon(
                    FontAwesomeIcons.arrowsRotate,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            title("Practice Management"),
            const SizedBox(
              height: 30,
            ),
            Obx((){
              return Column(
                children: [
                  desktopNavItem('Patient Registration', FontAwesomeIcons.users, CurrentSelectedNavItem.patientReg, active: selectedItem.value == CurrentSelectedNavItem.patientReg,),
                  desktopNavItem('Patient Scheduling', FontAwesomeIcons.calendar, CurrentSelectedNavItem.patientScheduling, active: selectedItem.value == CurrentSelectedNavItem.patientScheduling),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(color: ColorPalette.grey,),
                  title('Practice Identification Engine'),
                  const SizedBox(
                    height: 30,
                  ),
                  desktopNavItem('Patient Engagement Reg', FontAwesomeIcons.book, CurrentSelectedNavItem.patientEngagementReg, active: selectedItem.value == CurrentSelectedNavItem.patientEngagementReg),
                  desktopNavItem('Demographics', FontAwesomeIcons.chartPie, CurrentSelectedNavItem.demographics, active: selectedItem.value == CurrentSelectedNavItem.demographics),
                  desktopNavItem('Identification', FontAwesomeIcons.passport, CurrentSelectedNavItem.identification, active: selectedItem.value == CurrentSelectedNavItem.identification),
                  desktopNavItem('Identity Matching', CupertinoIcons.arrow_swap, CurrentSelectedNavItem.identityMatching, active: selectedItem.value == CurrentSelectedNavItem.identityMatching),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}

Widget desktopNavItem(String title, IconData iconData, CurrentSelectedNavItem screen, {active = false}) {
  return GestureDetector(
    onTap: (){
      selectedItem.value = screen;
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: active ? ColorPalette.secondColor : ColorPalette.grey,
            size: 18,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: isMobile() ? 13 : 17, fontWeight: FontWeight.w500, color: active ? ColorPalette.secondColor : ColorPalette.grey),
          ),
        ],
      ),
    ),
  );
}
