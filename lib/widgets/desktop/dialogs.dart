import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:clipboard/clipboard.dart';
import 'package:console/database/provider.dart';
import 'package:console/models/patient-schedule.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../api-calls/schedule-patient.dart';
import '../../models/user.dart';
import '../../services/edit-patient-info.dart';
import '../../services/validation-service.dart';
import '../../state-management/controller-variables.dart';
import '../mob-desk/buttons/console-text-button.dart';
import '../mob-desk/forms/console-text-field.dart';
import 'tables.dart';

void showSuccessDialog(String title, String desc) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.45.sh,
              width: 0.3.sw,
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/files/success.json',
                        width: 0.2.sw, height: 0.2.sh),
                    SizedBox(height: 0.02.sh),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.06.sh),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          buttonText: 'Close',
                          verticalPadding: 0.02.sh,
                          onTap: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showErrorDialog(String title, String desc) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.3.sh,
              width: 0.2.sw,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.xmark,
                      size: 0.06.sh,
                      color: Colors.red,
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.02.sh),
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.06.sh),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          buttonText: 'Close',
                          verticalPadding: 0.02.sh,
                          onTap: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showInfoDialogue(RegPatient patient) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Full Information',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 0.01.sh),
                    detailRow('First Name', 'Samuel', 'Last Name', 'Emehinola'),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow(
                        'Group Type', 'Group 1', 'Account Tier', 'Tier 1'),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Phone', '+2348131615393', '', ''),
                    SizedBox(height: 0.01.sh),
                    const Divider(),
                    SizedBox(height: 0.01.sh),
                    detailRow('Address', '8, Lagos-Ibadan Expressway', '', ''),
                    SizedBox(height: 0.06.sh),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          buttonText: 'Close',
                          verticalPadding: 0.02.sh,
                          onTap: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showInfoDialogueReal(RegPatient patient, {required bool fromReg}) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Patient Full Information',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                ConsoleState.state.patientToEdit = patient;
                                Navigator.pop(context);
                                showPatientEditDialog(patient);
                              },
                              child: const Icon(
                                FontAwesomeIcons.penToSquare,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      title('Personal Info'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('First Name', patient.firstName, 'Last Name',
                          patient.lastName),
                      SizedBox(height: 0.01.sh),
                      title('Health Records'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Blood Group', patient.bloodGroup, 'Genotype',
                          patient.genotype),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Age', '${patient.age}', 'Sex', patient.sex),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Height', '${patient.height}', 'Weight',
                          '${patient.weight}'),
                      SizedBox(height: 0.01.sh),
                      title('Group Type'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Group Type', '${patient.groupType}', '', ''),
                      SizedBox(height: 0.01.sh),
                      title('Contact Details'),
                      SizedBox(height: 0.01.sh),
                      detailRow('Phone', patient.phone, 'Email', patient.email),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow(
                        'Address',
                        patient.address,
                        'Social Handle',
                        patient.socHandle,
                      ),
                      SizedBox(height: 0.01.sh),
                      title('Principal Details'),
                      SizedBox(height: 0.01.sh),
                      detailRow(
                          'Rank', patient.rank, 'Position', patient.position),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow(
                        'Garrison',
                        patient.garrison,
                        'Division',
                        patient.division,
                      ),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow(
                        'Platoon',
                        patient.platoon,
                        'Unit',
                        patient.unit,
                      ),
                      SizedBox(height: 0.06.sh),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            buttonText: 'Close',
                            verticalPadding: 0.02.sh,
                            onTap: () {
                              Get.back();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showUserEditDialog(User user, {required bool fromReg}) {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final socHandleController = TextEditingController();
  final phoneController = TextEditingController();
  final nationalityController = TextEditingController();
  final ethnicityController = TextEditingController();
  final religionController = TextEditingController();
  final lgaController = TextEditingController();
  final rankController = TextEditingController();
  final positionController = TextEditingController();
  final garrisonController = TextEditingController();
  final divisionController = TextEditingController();
  final platoonController = TextEditingController();
  final unitController = TextEditingController();
  final primaryAssController = TextEditingController();

  if (ConsoleState.state.userToEdit != null) {
    emailController.text = user.username;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    middleNameController.text = user.middleName;
    socHandleController.text = user.socHandle;
    phoneController.text = user.phone;
    nationalityController.text = user.nationality;
    ethnicityController.text = user.ethnicity;
    religionController.text = user.religion;
    lgaController.text = user.lga;
    rankController.text = user.rank;
    positionController.text = user.position;
    garrisonController.text = user.garrison;
    divisionController.text = user.division;
    platoonController.text = user.platoon;
    unitController.text = user.unit;
    primaryAssController.text = user.primaryAssignment;
  }

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: ListView(
                children: [
                  title('Personal Info'),
                  FlatTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    isPassword: false,
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
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
                  title('Contact Info'),
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: emailController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Email Address'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: FlatTextField(
                          controller: socHandleController,
                          hintText: 'Social handle(Optional)',
                          isPassword: false,
                          validationService: (String? name) =>
                              ValidationService.isValidInput(name!),
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
                          controller: phoneController,
                          hintText: 'Phone Number',
                          maxInput: 10,
                          validationService: (String? text) =>
                              ValidationService.isValidNumber(text!),
                        ),
                      ),
                    ],
                  ),
                  title('Identity Details'),
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: nationalityController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Nationality'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: FlatTextField(
                          controller: ethnicityController,
                          hintText: 'Ethnicity',
                          isPassword: false,
                          validationService: (String? name) =>
                              ValidationService.isValidInput(name!),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: religionController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Religion'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: FlatTextField(
                          controller: lgaController,
                          hintText: 'LGA',
                          isPassword: false,
                          validationService: (String? name) =>
                              ValidationService.isValidInput(name!),
                        ),
                      ),
                    ],
                  ),
                  title('Official Info'),
                  FlatTextField(
                    controller: primaryAssController,
                    hintText: 'Place of Primary Assignment',
                    validationService: (String? name) =>
                        ValidationService.isValidInput(name!),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: rankController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Rank'),
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
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: garrisonController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Garrision'),
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
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FlatTextField(
                            controller: platoonController,
                            validationService: (String? name) =>
                                ValidationService.isValidEmail(name!),
                            hintText: 'Platoon'),
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedBtn(
                        buttonText: 'Cancel',
                        applyingMargin: false,
                        verticalPadding: 0.018.sh,
                        borderColor: Colors.red,
                        textColor: Colors.red,
                        horPadding: 0.05.sw,
                        onTap: () {
                          ConsoleState.state.userToEdit = null;
                          Get.back();
                        },
                      ),
                      SizedBox(
                        width: 0.02.sw,
                      ),
                      FlatButton(
                        buttonText: 'Update',
                        applyingMargin: false,
                        verticalPadding: 0.018.sh,
                        horPaddding: 0.05.sw,
                        loading: false,
                        onTap: () {
                          Get.back();
                          showSuccessDialog(
                              'Success', 'User updated successfully!');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showPatientEditDialog(RegPatient patient) {
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
    garrisonController.text =
        ConsoleState.state.patientToEdit!.garrison.toString();
    positionController.text =
        ConsoleState.state.patientToEdit!.position.toString();
    rankController.text = ConsoleState.state.patientToEdit!.rank.toString();
    socHandleController.text =
        ConsoleState.state.patientToEdit!.socHandle.toString();
  }

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: ListView(
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
                        loading: false,
                        onTap: () async {
                          Get.back();
                          // if (!_formKey.currentState!.validate()) return;

                          // setState(() {
                          //   loading = true;
                          // });

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

                          // await registerPatient(payload);
                          // setState(() {
                          //   loading = false;
                          // });
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
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showUserInfoDialogueReal(User user, {required bool fromReg}) {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.43.sh,
              width: 0.3.sw,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User Full Information',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Material(
                          //   color: Colors.transparent,
                          //   child: InkWell(
                          //     onTap: (){
                          //       ConsoleState.state.userToEdit = user;
                          //       Navigator.pop(context);
                          //       showUserEditDialog(user, fromReg: fromReg);
                          //     },
                          //     child: const Icon(
                          //       FontAwesomeIcons.penToSquare,
                          //       size: 15,
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      title('Personal Details'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('First Name', user.firstName, 'Middle Name',
                          user.middleName),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Last Name', user.lastName, 'Email Address',
                          user.username),
                      SizedBox(height: 0.01.sh),
                      title('Identity Details'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Nationality', user.nationality, 'Ethnicity',
                          user.ethnicity),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Religion', user.religion, 'LGA', user.lga),
                      SizedBox(height: 0.01.sh),
                      title('Official Details'),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Rank', user.rank, 'Position', user.position),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow(
                          'Garrison', user.garrison, 'Division', user.division),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Platoon', user.platoon, 'Unit', user.unit),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.01.sh),
                      detailRow('Place of Primary Assignment',
                          user.primaryAssignment, '', '',
                          isFull: true),
                      SizedBox(height: 0.01.sh),
                      const Divider(),
                      SizedBox(height: 0.03.sh),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            buttonText: 'Close',
                            verticalPadding: 0.02.sh,
                            onTap: () {
                              Get.back();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showIdentityTypes() {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.15.sh,
              width: 0.4.sw,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            './assets/images/barcode.png',
                            height: 0.05.sw,
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          FlatButton(
                            buttonText: 'Use Barcode',
                            onTap: () => Get.back(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            './assets/images/fingerprint1.jpg',
                            height: 0.05.sw,
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          FlatButton(
                              buttonText: 'Use Fingerprint',
                              onTap: () => Get.back()),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            './assets/images/id.png',
                            height: 0.05.sw,
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          FlatButton(
                              buttonText: 'Use ID',
                              onTap: () {
                                Get.back();
                                showIdForm();
                                // viewPatientInfoReal(
                                //     DBProvider.db.getAllPatients()[index], true);
                              }),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showIdForm() {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final idController = TextEditingController();

        return AlertDialog(
            content: SizedBox(
              height: 0.19.sh,
              width: 0.2.sw,
              child: ListView(
                children: [
                  FlatTextField(
                    controller: idController,
                    hintText: 'Enter Patient ID',
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  FlatButton(
                    buttonText: 'Match Identity',
                    verticalPadding: 0.02.sh,
                    horPaddding: 0.03.sw,
                    onTap: () {
                      Get.back();

                      RegPatient? patient = DBProvider.db.getPatientByID(idController.text);

                      if(patient != null){
                        viewPatientInfoReal(patient, false);
                      }else{
                        showEmpty();
                      }

                    },
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showPathDialog(String path) {
  // path = path.replaceFirst(' ', '').replaceFirst(':', '').replaceFirst('Directory', '').replaceAll('\'', '');
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final idController = TextEditingController(text: path);

        return AlertDialog(
            content: SizedBox(
              height: 0.19.sh,
              width: 0.3.sw,
              child: ListView(
                children: [
                  FlatTextField(
                    editable: false,
                    controller: idController,
                    hintText: 'Search for file name in your storage',
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  FlatButton(
                    buttonText: 'COPY PATH',
                    verticalPadding: 0.02.sh,
                    horPaddding: 0.03.sw,
                    onTap: () {
                      FlutterClipboard.copy(path).then(( value ) => debugPrint('dff'));
                      Get.back();
                      // Pspdfkit.present(path);
                    },
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showScheduleDialog(RegPatient patient) {
  ConsoleState.state.patientSchedule = PatientSchedule(
    id: patient.id,
    patientCase: 'Emergency',
    patientName: patient.firstName,
    patient: patient,
    appointmentDate: DateTime.now().toIso8601String().obs,
  ); // set schedule to state

  ConsoleState.state.loading.value = false;

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.5.sh,
              width: 0.3.sw,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Scheduler',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SchedulePatientCardReal(
                        status: 'Schedule',
                        patient: patient,
                      ),
                      CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.single,
                        ),
                        onValueChanged: (date) {
                          try {
                            ConsoleState.state.patientSchedule!.appointmentDate
                                .value = date.first!.toIso8601String();
                          } catch (e) {
                            //
                          }
                        },
                        initialValue: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedBtn(
                            buttonText: 'Cancel',
                            verticalPadding: 0.02.sh,
                            horPadding: 0.03.sw,
                            borderColor: Colors.red,
                            textColor: Colors.red,
                            onTap: () => Navigator.pop(context),
                          ),
                          Obx(() {
                            return FlatButton(
                              buttonText: 'Commit',
                              verticalPadding: 0.02.sh,
                              horPaddding: 0.03.sw,
                              loading: ConsoleState.state.loading.value,
                              onTap: () async {
                                if (await schedulePatient()) {
                                  Navigator.pop(context);
                                  selectedItem.value =
                                      CurrentSelectedNavItem.patientScheduling;
                                  showSuccessDialog(
                                      'Success', 'Patient schedule successful');
                                }
                              },
                            );
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showEmpty() {

  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: 0.1.sh,
              width: 0.1.sw,
              child: Column(
                children: [
                  Icon(CupertinoIcons.xmark, size: 0.03.sw,),
                  SizedBox(height: 0.01.sh,),
                  Text('No patient matched', style: TextStyle(fontSize: 18.sp),)
                ],
              )
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

void showFilterDialog() {
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Container(
              constraints: BoxConstraints(maxHeight: 0.3.sh),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConsoleDropdown(
                        label: 'Filter by:',
                        value: 'Patient Name',
                        options: const [
                          'Patient Name',
                          'ID',
                          'Date Created',
                          'Group Type',
                          'Contact',
                          'Account Tier',
                          'Address',
                        ],
                        onChanged: (value) {
                          // TODO: change value
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FlatButton(
                            buttonText: 'Apply Filter',
                            verticalPadding: 0.02.sh,
                            applyingMargin: false,
                            onTap: () {
                              Get.back();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}

Widget detailRow(String title1, String value1, String title2, String value2,
    {bool isFull = false}) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 12.sp),
            ),
            Text(
              value1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      if (!isFull)
        SizedBox(
          width: 0.08.sw,
        ),
      if (!isFull)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                value2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        )
    ],
  );
}
