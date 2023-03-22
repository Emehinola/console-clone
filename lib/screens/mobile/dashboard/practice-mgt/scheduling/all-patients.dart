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

class AllPatients extends StatefulWidget {
  const AllPatients({Key? key}) : super(key: key);

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
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
                    onTap: () => navigate(const PatientRegistration(),
                            routeName: '/patient-reg-mobile')
                        .then((value) => setState(() {})),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                              child: Column(
                                children: [
                                  FlatTextField(
                                      hintText: 'Search by parameter',
                                      suffixIcon: CupertinoIcons.search,
                                      fillColor: Colors.white),
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
                            if (complete)
                              Visibility(
                                visible:
                                    DBProvider.db.getAllPatients().isNotEmpty,
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
                                          patient: patient,
                                          isSchedule: true,
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
