import 'package:console/screens/mobile/dashboard/identification-engine/demographics.dart';
import 'package:console/screens/mobile/dashboard/identification-engine/engagement/engagement-reg.dart';
import 'package:console/screens/mobile/dashboard/identification-engine/identification-matching.dart';
import 'package:console/screens/mobile/dashboard/identification-engine/identification.dart';
import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patients.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../screens/mobile/dashboard/practice-mgt/scheduling/scheduled-patients.dart';
import '../../services/constants.dart';

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
        color: ColorPalette.dark,
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
                    Navigator.pop(context);
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
            title("Practice Management", textColor: Colors.white),
            const SizedBox(
              height: 30,
            ),
            drawerRow('Patient Registration', FontAwesomeIcons.users, const ScheduledPatients()),
            drawerRow('Patient Scheduling', FontAwesomeIcons.calendar, const PatientsSchedulerList()),
            const SizedBox(
              height: 30,
            ),
            title('Practice Identification Engine', textColor: Colors.white),
            const SizedBox(
              height: 30,
            ),
            drawerRow('Patient Engagement Reg', FontAwesomeIcons.book, const EngagementReg()),
            drawerRow('Demographics', FontAwesomeIcons.chartPie, const Demography()),
            drawerRow('Identification', FontAwesomeIcons.passport, const Identification()),
            drawerRow('Identity Matching', CupertinoIcons.arrow_swap, IdentificationMatching()),
          ],
        ),
      ),
    );
  }
}

Widget drawerRow(String title, IconData iconData, Widget screen, {active = false}) {
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
            color: active ? ColorPalette.secondColor : ColorPalette.grey,
            size: 18,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: isMobile() ? 16.sp : 17.sp, fontWeight: FontWeight.w500, color: active ? ColorPalette.secondColor : ColorPalette.grey),
          ),
        ],
      ),
    ),
  );
}

Widget title(String title, {Color? textColor}) {
  return Container(
    margin: EdgeInsets.only(top: 0.01.sh),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: const BoxDecoration(
            color: ColorPalette.grey,
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
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.w900, color: textColor ?? ColorPalette.mainButtonColor),
        ),
      ],
    ),
  );
}
