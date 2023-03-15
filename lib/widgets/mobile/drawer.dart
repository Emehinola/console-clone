import 'package:console/screens/mobile/dashboard/practice-mgt/pt-mgt-template.dart';
import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patients.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../screens/mobile/dashboard/practice-mgt/registration/patient-registration.dart';
import '../../screens/mobile/dashboard/practice-mgt/scheduling/patients-list.dart';

class SideDrawer extends StatefulWidget {
  PageController pageController;

  SideDrawer({required this.pageController});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width * 0.5,
        color: Colors.black.withOpacity(0.9),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dashboard",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: ColorPalette.secondColor),
                ),
                IconButton(
                  onPressed: () {
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn);
                  },
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            title("Practice Management"),
            const SizedBox(
              height: 30,
            ),
            drawerRow('Patient Registration', FontAwesomeIcons.users, const PatientsList()),
            drawerRow('Patient Scheduling', FontAwesomeIcons.calendar, const PatientsSchedulerList()),
            const SizedBox(
              height: 30,
            ),
            title('Practice Identification Engine'),
            const SizedBox(
              height: 30,
            ),
            drawerRow('Patient Engagement Reg', FontAwesomeIcons.book, const PatientsList()),
            drawerRow('Demographics', FontAwesomeIcons.chartPie, const PatientsList()),
            drawerRow('Identification', FontAwesomeIcons.passport, const PatientsList()),
            drawerRow('Identity Matching', CupertinoIcons.arrow_swap, const PatientsList()),
          ],
        ),
      ),
    );
  }
}

Widget drawerRow(String title, IconData iconData, Widget screen) {
  return GestureDetector(
    onTap: (){
      navigate(screen);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: ColorPalette.secondColor,
            size: 18,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

Widget title(String title) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Row(
      children: [
        Container(
          width: 5,
          height: 20,
          decoration: const BoxDecoration(
            color: ColorPalette.secondColor,
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          )),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w900, color: ColorPalette.mainButtonColor),
        ),
      ],
    ),
  );
}
