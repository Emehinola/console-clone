import 'package:console/screens/desktop/dashboard/dashboard.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../api-calls/patients.dart';
import '../../../../../services/validation-service.dart';
import '../../../../../widgets/desktop/patient-list-tiles.dart';
import '../../../../../widgets/mobile/drawer.dart';

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
    if (ConsoleState.state.patientToEdit != null) {
      showForm = true;
    } else {
      ConsoleState.state.regViewText.value = "Registered Patients (Complete)";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsoleScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMetrics(
            isUser: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.02.sw),
            child: Obx(
              () => Text(
                ConsoleState.state.regViewText.value,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
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
                      child: !showForm
                          ? RegisteredPatient(
                              status: 'Completed',
                            )
                          : const PatientRegForm()),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            showForm
                                ? './assets/images/reg.png'
                                : './assets/images/reg-new.png',
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

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final platoonController = TextEditingController();
  final divisionController = TextEditingController();
  final unitController = TextEditingController();
  final primAssController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final garrisonController = TextEditingController();
  final positionController = TextEditingController();
  final rankController = TextEditingController();
  final socHandleController = TextEditingController();


  bool loading = false;

  @override
  void initState() {
    if (ConsoleState.state.patientToEdit != null) {
      firstNameController.text = ConsoleState.state.patientToEdit!.firstName;
      lastNameController.text = ConsoleState.state.patientToEdit!.lastName;
      middleNameController.text = ConsoleState.state.patientToEdit!.firstName;
      phoneController.text = ConsoleState.state.patientToEdit!.phone;
      emailController.text = ConsoleState.state.patientToEdit!.email;
      addressController.text = ConsoleState.state.patientToEdit!.address;
      platoonController.text = ConsoleState.state.patientToEdit!.platoon;
      divisionController.text = ConsoleState.state.patientToEdit!.division;
      unitController.text = ConsoleState.state.patientToEdit!.unit;
      primAssController.text = ConsoleState.state.patientToEdit!.primaryAss;
      ageController.text = ConsoleState.state.patientToEdit!.age.toString();
      heightController.text = ConsoleState.state.patientToEdit!.height.toString();
      weightController.text = ConsoleState.state.patientToEdit!.weight.toString();
      garrisonController.text = ConsoleState.state.patientToEdit!.garrison.toString();
      positionController.text = ConsoleState.state.patientToEdit!.position.toString();
      rankController.text = ConsoleState.state.patientToEdit!.rank.toString();
      socHandleController.text = ConsoleState.state.patientToEdit!.socHandle.toString();
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
            title('Personal Details'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: middleNameController,
                    hintText: 'Middle Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Group Type',
                    options: const [
                      'Group',
                      'Single',
                    ],
                    value: 'Group',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
              ],
            ),
            title('Health Records'),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Blood Group',
                    options: const ['A+', 'A-', 'B-', 'B+', '0+'],
                    value: 'A+',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Genotype',
                    options: const [
                      'AA',
                      'AS',
                      'SS',
                    ],
                    value: 'AA',
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
                  child: FlatTextField(
                    controller: ageController,
                    hintText: 'Age',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ConsoleDropdown(
                    label: 'Sex',
                    options: const [
                      'Male',
                      'Female',
                    ],
                    value: 'Male',
                    onChanged: (value) {
                      // TODO: change field
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: heightController,
                    hintText: 'Height(cm)',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: weightController,
                    hintText: 'Weight(kg)',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            title('Group Type'),
            const SizedBox(
              width: 20.0,
            ),
            ConsoleDropdown(
              label: 'Group Type',
              options: const [
                'Group',
                'Single',
              ],
              value: 'Group',
              onChanged: (value) {
                // TODO: change field
              },
            ),
            title('Contact Details'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: phoneController,
                    hintText: 'Phone',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: emailController,
                    hintText: 'Email Address',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: addressController,
                    hintText: 'Address',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: socHandleController,
                    hintText: 'Social Handle',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            title('Principal Designation'),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: rankController,
                    hintText: 'Rank',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: positionController,
                    hintText: 'Position',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: garrisonController,
                    hintText: 'Garrison',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: divisionController,
                    hintText: 'Division',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatTextField(
                    controller: platoonController,
                    hintText: 'Platoon',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatTextField(
                    controller: unitController,
                    hintText: 'Unit',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            FlatTextField(
              controller: primAssController,
              hintText: 'Place of Primary Assignment',
              isPassword: false,
              validationService: (String? name) =>
                  ValidationService.isValidInput(name!),
            ),
            title('Account Tier'),
            Expanded(
              child: ConsoleDropdown(
                label: 'Account Tier',
                options: const [
                  'Class 1',
                  'Class 2',
                  'Class 3',
                  'Class 4',
                  'Class 5',
                  'Class 6',
                  'Class 7',
                  'Class 8',
                  'Class 9',
                  'Class 10',
                ],
                value: 'Class 1',
                onChanged: (value) {
                  // TODO: change field
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedBtn(
                  buttonText: 'Clear',
                  applyingMargin: false,
                  verticalPadding: 0.018.sh,
                  borderColor: ColorPalette.mainButtonColor,
                  textColor: ColorPalette.mainButtonColor,
                  horPadding: 0.05.sw,
                  onTap: () {
                    ConsoleState.state.patientToEdit = null;
                    selectedItem.value = CurrentSelectedNavItem.dashboard;
                  },
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
                    if (!_formKey.currentState!.validate()) return;

                    setState(() {
                      loading = true;
                    });

                    Map payload = {
                      'phone': phoneController.text,
                      'groupType': 'Single',
                      'accountTier': 'Class 1',
                      'firstName': firstNameController.text,
                      'lastName': lastNameController.text,
                      'height': heightController.text,
                      'weight': weightController.text,
                      'age': ageController.text,
                      'bloodGroup': 'A+',
                      'genotype': 'AA',
                      'bmi': 'None',
                      'photograph': 'None',
                      'sex': 'Male',
                      'email': emailController.text,
                      'address': addressController.text,
                      'garrison': garrisonController.text,
                      'position': positionController.text,
                      'primaryAss': primAssController.text,
                      'rank': rankController.text,
                      'socHandle': socHandleController.text,
                      'unit': unitController.text,
                      'platoon': platoonController.text,
                      'division': divisionController.text,
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
