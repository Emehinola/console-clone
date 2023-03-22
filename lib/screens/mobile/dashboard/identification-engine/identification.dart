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
import '../../../../models/registered-patient.dart';
import '../../../../widgets/mobile/dialogs.dart';
import '../../../../widgets/mobile/table.dart';

class Identification extends StatefulWidget {
  const Identification({Key? key}) : super(key: key);

  @override
  State<Identification> createState() => _PatientsListState();
}

class _PatientsListState extends State<Identification> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Identification'),
      body: Column(
        children: [
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
                          PatientIdentification(
                            status: "Incomplete",
                            onTap: () {
                              showMobileInfoDialogue(RegPatient(
                                  id: 'ID',
                                  phone: '+2348131615393',
                                  acctTier: 'Tier 1',
                                  biodata: 'Grate',
                                  contactDetails: 'emehinolasam@gmail.com',
                                  medRecord: 'Greate',
                                  patientName: 'Big Sam',
                                  principalDesignation: 'principalDesignation',
                                  principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientIdentification(
                            status: "Completed",
                            onTap: () {
                              showMobileInfoDialogue(RegPatient(
                                  id: 'ID',
                                  phone: '+2348131615393',
                                  acctTier: 'Tier 1',
                                  biodata: 'Grate',
                                  contactDetails: 'emehinolasam@gmail.com',
                                  medRecord: 'Greate',
                                  patientName: 'Big Sam',
                                  principalDesignation: 'principalDesignation',
                                  principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientIdentification(
                            status: "Completed",
                            onTap: () {
                              showMobileInfoDialogue(RegPatient(
                                  id: 'ID',
                                  phone: '+2348131615393',
                                  acctTier: 'Tier 1',
                                  biodata: 'Grate',
                                  contactDetails: 'emehinolasam@gmail.com',
                                  medRecord: 'Greate',
                                  patientName: 'Big Sam',
                                  principalDesignation: 'principalDesignation',
                                  principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientIdentification(
                            status: "Incomplete",
                            onTap: () {
                              showMobileInfoDialogue(RegPatient(
                                  id: 'ID',
                                  phone: '+2348131615393',
                                  acctTier: 'Tier 1',
                                  biodata: 'Grate',
                                  contactDetails: 'emehinolasam@gmail.com',
                                  medRecord: 'Greate',
                                  patientName: 'Big Sam',
                                  principalDesignation: 'principalDesignation',
                                  principalWorkDetails: 'principalWorkDetails'));
                            },
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
