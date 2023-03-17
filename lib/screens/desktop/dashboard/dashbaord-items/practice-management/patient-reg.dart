import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/material.dart';

import '../../../../../services/validation-service.dart';

class DesktopPatientRegistration extends StatefulWidget {
  const DesktopPatientRegistration({Key? key}) : super(key: key);

  @override
  _DesktopPatientRegistrationState createState() =>
      _DesktopPatientRegistrationState();
}

class _DesktopPatientRegistrationState
    extends State<DesktopPatientRegistration> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ConsoleScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderMetrics(),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Text(
              "Patient Registration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Form(
                        key: _formKey,
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
                                      setState(() {
                                        // TODO: fix
                                      });
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
                                    validationService: (String? text) =>
                                        ValidationService.isValidNumber(text!),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedBtn(
                                  buttonText: 'Preview',
                                  applyingMargin: false,
                                  verticalPadding: 20.0,
                                  borderColor: ColorPalette.mainButtonColor,
                                  textColor: ColorPalette.mainButtonColor,
                                  horPadding: 40,
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                FlatButton(
                                  buttonText: 'Submit',
                                  applyingMargin: false,
                                  verticalPadding: 20.0,
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Registration Preview",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              title('Personal Info',
                                  textColor: ColorPalette.grey),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(child: previewText('Full Name', 'Emehinola Samuel')),
                                  Expanded(child: previewText('Bio Data', 'A programmer')),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              title('Contact Details',
                                  textColor: ColorPalette.grey),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: previewText(
                                          'Phone Number', '+2348131615393')),
                                  Expanded(
                                    child: previewText(
                                        'Address', '8, Expressway, Lagos'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              title('Employment Record',
                                  textColor: ColorPalette.grey),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: previewText(
                                        'Principal Details', 'Pa. Adebanjo'),
                                  ),
                                  Expanded(
                                      child: previewText(
                                          'Principal Work Details',
                                          'Pa. Adebanjo is a professional Architect')),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              title('Medical Record',
                                  textColor: ColorPalette.grey),
                              const SizedBox(
                                height: 20,
                              ),
                              previewText('Health Record',
                                  'Great health record. Thank God for that'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget previewText(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorPalette.offBlack,
            fontSize: 13),
      ),
      const SizedBox(height: 5.0,),
      Text(
        value,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: ColorPalette.grey),
      ),
    ],
  );
}
