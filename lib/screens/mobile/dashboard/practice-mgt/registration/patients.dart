import 'package:console/database/provider.dart';
import 'package:console/screens/mobile/dashboard/practice-mgt/registration/patient-registration.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../../widgets/mob-desk/buttons/console-text-button.dart';
import '../../../../../widgets/mob-desk/buttons/icon-buttons.dart';
import '../../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../../widgets/mobile/table.dart';

class ScheduledPatients extends StatefulWidget {
  const ScheduledPatients({Key? key}) : super(key: key);

  @override
  State<ScheduledPatients> createState() => _ScheduledPatientsState();
}

class _ScheduledPatientsState extends State<ScheduledPatients> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  bool complete = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Registered Patients'),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 0.4.sw,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 5),
                  child: FlatButton(
                    buttonText: 'Add New',
                    iconData: CupertinoIcons.add,
                    applyingMargin: false,
                    onTap: () => navigate(const PatientRegistration(), routeName: '/patient-reg-mobile').then((value) => setState((){})),
                  ),
                ),
              ),
            ),
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
                                    height: 50,
                                  ),
                                  const Text(
                                    'Total Patients',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        IconlyBold.user_2,
                                        color: ColorPalette.secondColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${DBProvider.db.getAllPatients().length}',
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
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(onTap: (){
                        setState(() {
                          complete = true;
                        });
                      },
                          child: fullyRegPatientCard('Registered', '(Complete)', '${DBProvider.db.getAllPatients().length}')),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(onTap: (){
                        setState(() {
                          complete = false;
                        });
                      },
                          child: fullyRegPatientCard('Registered', '(Incomplete)', '0', color: ColorPalette.lightRed)),
                    ],
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
                      // padding: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: ColorPalette.grey.withOpacity(0.01),
                        boxShadow: const [
                          BoxShadow(
                            color: ColorPalette.shadowColor,
                            offset: Offset(0, -3),
                            blurRadius: 2,
                            spreadRadius: 0.1,
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0.sp),
                          topRight: Radius.circular(30.0.sp),
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
                           if(complete) Visibility(
                             visible: DBProvider.db
                                 .getAllPatients().isNotEmpty,
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
                             child: Column(
                                children: DBProvider.db
                                    .getAllPatients()
                                    .map(
                                      (patient) => UserPatientCard(
                                        status: "Complete",
                                        patient: patient
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
      ),
    );
  }
}

Widget fullyRegPatientCard(String title, String subtitle, String value, {Color color = ColorPalette.lightGreen,}){
  return Container(
    decoration: BoxDecoration(
        color: color,
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
          child: Text(
            value,
            style: const TextStyle(
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
          children: [
            Text(
          title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: ColorPalette.grey, fontSize: 10),
            ),
          ],
        ),
      ],
    ),
  );
}
