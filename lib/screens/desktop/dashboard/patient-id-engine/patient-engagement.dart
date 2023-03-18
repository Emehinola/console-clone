import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/widgets/desktop/patient-list-tiles.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../../widgets/desktop/dialogs.dart';
import '../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../widgets/mob-desk/forms/dropdowns.dart';
import '../dashboard.dart';

class DesktopPatientEngagement extends StatefulWidget {
  const DesktopPatientEngagement({Key? key}) : super(key: key);

  @override
  State<DesktopPatientEngagement> createState() => _PatientsListState();
}

class _PatientsListState extends State<DesktopPatientEngagement> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderMetrics(),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DesktopPatienntScheduleTable(
                    status: "Complete",
                  ),
                ),
                const Expanded(child: BuildEngagementCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EngagemenntRegistration extends StatelessWidget {
  const EngagemenntRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  'Patient Engagement Registration',
                  style: TextStyle(
                    color: ColorPalette.grey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FlatTextField(
                              hintText: 'Full Name',
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: ConsoleDropdown(
                              label: 'Group Type',
                              options: const [
                                'Group 1',
                                'Group 2',
                                'Group 3',
                              ],
                              value: 'Group 1',
                              onChanged: (value) {
                                //
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatTextField(
                            hintText: 'Bio data',
                          )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: FlatTextField(
                            hintText: 'Health Record',
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatTextField(
                            hintText: 'Account Tier',
                          )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: FlatTextField(
                            hintText: 'Contact Details',
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatTextField(
                            hintText: 'Principal Designation',
                          )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: FlatTextField(
                              hintText: 'Principal Work Details',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ConsoleDropdown(
                              options: const [
                                '+234',
                              ],
                              value: '+234',
                              label: 'Code',
                              onChanged: (value) {
                                //
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: FlatTextField(
                              hintText: 'Phone Number',
                              maxInput: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedBtn(
                            buttonText: 'Clear Fields',
                            verticalPadding: 0.02.sh,
                            horPadding: 40,
                            borderColor: ColorPalette.mainButtonColor,
                            textColor: ColorPalette.mainButtonColor,
                            applyingMargin: false,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            buttonText: 'Register',
                            applyingMargin: false,
                            verticalPadding: 0.02.sh,
                            horPaddding: 40,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class BuildEngagementCard extends StatelessWidget {
  const BuildEngagementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        // padding: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Text(
                  'Patient Engagement',
                  style: TextStyle(
                    color: ColorPalette.grey,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SchedulePatientCard(
                        status: 'Engaged',
                      ),
                      Text(
                        "Pick Engagement Date",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorPalette.grey),
                      ),
                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        onValueChanged: (dates) {},
                        initialValue: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedBtn(
                            buttonText: 'Clear Fields',
                            verticalPadding: 0.02.sh,
                            horPadding: 40,
                            borderColor: ColorPalette.mainButtonColor,
                            textColor: ColorPalette.mainButtonColor,
                            applyingMargin: false,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            buttonText: 'Register',
                            applyingMargin: false,
                            verticalPadding: 0.02.sh,
                            horPaddding: 40,
                            onTap: () => showSuccessSheet('Success!',
                                'Engagement registered successfully'),
                          ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
