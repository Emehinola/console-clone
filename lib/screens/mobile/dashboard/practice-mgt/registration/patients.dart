import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patient-registration.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';

class PatientsList extends StatefulWidget {
  const PatientsList({Key? key}) : super(key: key);

  @override
  State<PatientsList> createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  metricCard("Registered\n(Full)", "10",
                      active: true, onTap: () {}),
                  metricCard("Registered\n(Incomplete)", "15",
                      valueColor: ColorPalette.red, active: true, onTap: () {}),
                  metricCard("Add New\nPatient", "+",
                      active: true,
                      valueColor: ColorPalette.checkGreen,
                      onTap: () => navigate(const PatientRegistration(), routeName: '/patient-registration')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: ColorPalette.shadowColor,
                            offset: Offset(0, -5),
                            blurRadius: 5,
                            spreadRadius: 0.2,
                            blurStyle: BlurStyle.outer,
                          )
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
                            FlatTextField(
                              hintText: 'Search by parameter',
                              suffixIcon: CupertinoIcons.search,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            const Divider(),
                            PatientCard(
                              status: "Complete",
                            ),
                            PatientCard(
                              status: "Incomplete",
                            )
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
      ),
    );
  }
}
