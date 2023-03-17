import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
           Padding(
            padding: EdgeInsets.only(left: 0.02.sw),
            child: Text(
              "Patient Registration",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 0.03.sh,),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
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
                                        FlatTextBoxField(hintText: 'Bio data', minLines: 3, maxLines: 4,)),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                    child: FlatTextBoxField(
                                        hintText: 'Health Record', minLines: 3, maxLines: 4,)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: FlatTextBoxField(
                                        hintText: 'Account Tier', minLines: 3, maxLines: 4,)),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                    child: FlatTextBoxField(
                                        hintText: 'Contact Details', minLines: 3, maxLines: 4,)),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: FlatTextBoxField(
                                        hintText: 'Principal Designation', minLines: 3, maxLines: 4,)),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: FlatTextBoxField(
                                      hintText: 'Principal Work Details', minLines: 3, maxLines: 4,),
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
                                  verticalPadding: 0.018.sh,
                                  borderColor: ColorPalette.mainButtonColor,
                                  textColor: ColorPalette.mainButtonColor,
                                  horPadding: 0.05.sw,
                                ),
                                SizedBox(
                                  width: 0.02.sw,
                                ),
                                FlatButton(
                                  buttonText: 'Submit',
                                  applyingMargin: false,
                                  verticalPadding: 0.018.sh,
                                  horPaddding: 0.05.sw,
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
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedBtn(buttonText: 'Schedule Patient', verticalPadding: 0.015.sh, borderColor: ColorPalette.mainButtonColor, textColor: ColorPalette.mainButtonColor,),
                          SizedBox(height: 0.02.sh,),
                          FlatButton(buttonText: 'Engage Patient', verticalPadding: 0.015.sh,),
                        ],
                      ),
                    )
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
