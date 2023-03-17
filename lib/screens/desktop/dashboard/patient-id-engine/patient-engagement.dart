import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/desktop/patient-list-tiles.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/mob-desk/custom/cards.dart';
import '../../../../../widgets/mob-desk/theme/color-palette.dart';
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
                  child: Column(
                    children: [
                      Container(
                        width: Get.width,
                        // padding: const EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            DesktopPatienntScheduleTable(
                              status: "Complete",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Expanded(
                    child: EngagemenntRegistration()
                ),
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
                child: const Text(
                  'Patient Engagement Registration',
                  style: TextStyle(
                    color: ColorPalette.grey,
                    fontSize: 18,
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
                              child:
                              FlatTextBoxField(hintText: 'Bio data')),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: FlatTextBoxField(
                                  hintText: 'Health Record')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatTextBoxField(
                                  hintText: 'Account Tier')),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: FlatTextBoxField(
                                  hintText: 'Contact Details')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: FlatTextBoxField(
                                  hintText: 'Principal Designation')),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: FlatTextBoxField(
                                hintText: 'Principal Work Details'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
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
                            flex: 4,
                            child: FlatTextField(
                              hintText: 'Phone Number',
                              maxInput: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      FlatButton(
                        buttonText: 'Register',
                        applyingMargin: false,
                        verticalPadding: 20.0,
                        horPaddding: 40,
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
        )
    );
  }
}

