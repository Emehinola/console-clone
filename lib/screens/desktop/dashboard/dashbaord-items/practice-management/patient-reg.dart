import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../api-calls/patients.dart';
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
  void initState() {
    if(consoleState.patientToEdit != null){
      showForm = true;
    }
    super.initState();
  }

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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 0.9.sh,
                    child: !showForm ? RegisteredPatient(
                      status: 'Completed',
                    ) : const PatientRegForm()
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

class PatientRegForm extends StatefulWidget {
  const PatientRegForm({Key? key}) : super(key: key);

  @override
  State<PatientRegForm> createState() => _PatientRegFormState();
}

class _PatientRegFormState extends State<PatientRegForm> {

  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final biodata = TextEditingController();
  final contactDetails = TextEditingController();
  final principalWork = TextEditingController();
  final principalDesignation = TextEditingController();
  final phone = TextEditingController();
  final healthRecord = TextEditingController();
  final acctTier = TextEditingController();

  bool loading = false;

  @override
  void initState() {

    if(consoleState.patientToEdit != null){
      name.text = consoleState.patientToEdit!.patientName;
      biodata.text = consoleState.patientToEdit!.biodata;
      contactDetails.text = consoleState.patientToEdit!.contactDetails;
      principalDesignation.text = consoleState.patientToEdit!.principalDesignation;
      principalWork.text = consoleState.patientToEdit!.principalWorkDetails;
      phone.text = consoleState.patientToEdit!.phone;
      healthRecord.text = consoleState.patientToEdit!.medRecord;
      acctTier.text = consoleState.patientToEdit!.acctTier;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.02.sw, right: 0.1.sw),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: name,
                    hintText: 'Full Name',
                    validationService: (String? text) =>
                        ValidationService.isValidInput(text!),
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
                      controller: biodata,
                  hintText: 'Bio data',
                  minLines: 3,
                  maxLines: 4,
                      validationService: (String? text) =>
                          ValidationService.isValidInput(text!),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: FlatTextBoxField(
                      controller: healthRecord,
                  hintText: 'Health Record',
                  minLines: 3,
                  maxLines: 4,
                      validationService: (String? text) =>
                          ValidationService.isValidInput(text!),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: FlatTextBoxField(
                      controller: acctTier,
                  hintText: 'Account Tier',
                  minLines: 3,
                  maxLines: 4,
                      validationService: (String? text) =>
                          ValidationService.isValidInput(text!),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: FlatTextBoxField(
                      controller: contactDetails,
                  hintText: 'Contact Details',
                  minLines: 3,
                  maxLines: 4,
                      validationService: (String? text) =>
                          ValidationService.isValidInput(text!),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: FlatTextBoxField(
                      controller: principalDesignation,
                  hintText: 'Principal Designation',
                  minLines: 3,
                  maxLines: 4,
                      validationService: (String? text) =>
                          ValidationService.isValidInput(text!),
                )),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: FlatTextBoxField(
                    controller: principalWork,
                    hintText: 'Principal Work Details',
                    minLines: 3,
                    maxLines: 4,
                    validationService: (String? text) =>
                        ValidationService.isValidInput(text!),
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
                    controller: phone,
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
                  loading: loading,
                  onTap: () async {
                    if(!_formKey.currentState!.validate()) return;

                    setState(() {
                      loading = true;
                    });

                    Map payload = {
                      'patientName': name.text,
                      'phone': phone.text,
                      'accountTier': acctTier.text,
                      'bioData': biodata.text,
                      'contactDetails': contactDetails.text,
                      'medRecord': healthRecord.text,
                      'principalDes': principalDesignation.text,
                      'principalWorkDetails': principalWork.text,
                    };

                    await registerPatient(payload);
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
