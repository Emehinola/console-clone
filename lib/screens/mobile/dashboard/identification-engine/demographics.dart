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

class Demography extends StatefulWidget {
  const Demography({Key? key}) : super(key: key);

  @override
  State<Demography> createState() => _PatientsListState();
}

class _PatientsListState extends State<Demography> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Demographics'),
      backgroundColor: ColorPalette.cardGrey,
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
                          PatientDemography(
                            status: "Completed",
                            onTap: () {
                               // showMobileInfoDialogue(RegPatient(
                               //   id: 'ID',
                               //    phone: '+2348131615393',
                               //    acctTier: 'Tier 1',
                               //    biodata: 'Grate',
                               //    contactDetails: 'emehinolasam@gmail.com',
                               //    medRecord: 'Greate',
                               //    patientName: 'Big Sam',
                               //    principalDesignation: 'principalDesignation',
                               //    principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientDemography(
                            status: "Incomplete",
                            onTap: () {
                              // showMobileInfoDialogue(RegPatient(
                              //     id: 'ID',
                              //     phone: '+2348131615393',
                              //     acctTier: 'Tier 1',
                              //     biodata: 'Grate',
                              //     contactDetails: 'emehinolasam@gmail.com',
                              //     medRecord: 'Greate',
                              //     patientName: 'Big Sam',
                              //     principalDesignation: 'principalDesignation',
                              //     principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientDemography(
                            status: "Completed",
                            onTap: () {
                              // showMobileInfoDialogue(RegPatient(
                              //     id: 'ID',
                              //     phone: '+2348131615393',
                              //     acctTier: 'Tier 1',
                              //     biodata: 'Grate',
                              //     contactDetails: 'emehinolasam@gmail.com',
                              //     medRecord: 'Greate',
                              //     patientName: 'Big Sam',
                              //     principalDesignation: 'principalDesignation',
                              //     principalWorkDetails: 'principalWorkDetails'));
                            },
                          ),
                          PatientDemography(
                            status: "Incomplete",
                            onTap: () {
                              // showMobileInfoDialogue(RegPatient(
                              //     id: 'ID',
                              //     phone: '+2348131615393',
                              //     acctTier: 'Tier 1',
                              //     biodata: 'Grate',
                              //     contactDetails: 'emehinolasam@gmail.com',
                              //     medRecord: 'Greate',
                              //     patientName: 'Big Sam',
                              //     principalDesignation: 'principalDesignation',
                              //     principalWorkDetails: 'principalWorkDetails'));
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
