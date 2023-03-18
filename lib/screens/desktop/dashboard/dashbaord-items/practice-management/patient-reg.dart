import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../services/validation-service.dart';
import '../../../../../widgets/desktop/patient-list-tiles.dart';

class DesktopPatientRegistration extends StatefulWidget {
  const DesktopPatientRegistration({Key? key}) : super(key: key);

  @override
  _DesktopPatientRegistrationState createState() =>
      _DesktopPatientRegistrationState();
}

class _DesktopPatientRegistrationState
    extends State<DesktopPatientRegistration> {
  final _formKey = GlobalKey<FormState>();

  bool showForm = false;

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
          SizedBox(
            height: 0.03.sh,
          ),
          Expanded(
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AnimatedCrossFade(
                      crossFadeState: showForm
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 600),
                      firstChild: const PatientRegForm(),
                      secondChild: RegisteredPatient(
                        status: 'Completed',
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
                            Image.asset(
                              showForm ? './assets/images/reg.png' : './assets/images/reg-new.png',
                              height: 0.2.sh,
                            ),
                            SizedBox(
                              height: 0.06.sh,
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 600),
                              crossFadeState: showForm
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild: FlatButton(
                                  buttonText: 'Add New Patient',
                                  verticalPadding: 0.015.sh,
                                  onTap: () {
                                    setState(() {
                                      showForm = true;
                                    });
                                  }),
                              secondChild: OutlinedBtn(
                                buttonText: 'See Full List',
                                borderColor: ColorPalette.mainButtonColor,
                                textColor: ColorPalette.mainButtonColor,
                                verticalPadding: 0.015.sh,
                                onTap: () {
                                  setState(() {
                                    showForm = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ))
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
      const SizedBox(
        height: 5.0,
      ),
      Text(
        value,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: ColorPalette.grey),
      ),
    ],
  );
}

class PatientRegForm extends StatelessWidget {
  const PatientRegForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.02.sw, right: 0.1.sw),
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
                    // TODO: change field
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: FlatTextBoxField(
                hintText: 'Bio data',
                minLines: 3,
                maxLines: 4,
              )),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: FlatTextBoxField(
                hintText: 'Health Record',
                minLines: 3,
                maxLines: 4,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: FlatTextBoxField(
                hintText: 'Account Tier',
                minLines: 3,
                maxLines: 4,
              )),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: FlatTextBoxField(
                hintText: 'Contact Details',
                minLines: 3,
                maxLines: 4,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: FlatTextBoxField(
                hintText: 'Principal Designation',
                minLines: 3,
                maxLines: 4,
              )),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: FlatTextBoxField(
                  hintText: 'Principal Work Details',
                  minLines: 3,
                  maxLines: 4,
                ),
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
    );
  }
}
