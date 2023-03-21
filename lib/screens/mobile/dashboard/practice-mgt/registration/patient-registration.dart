import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../services/validation-service.dart';
import '../../../../../state-management/state-management.dart';

class PatientRegistration extends StatefulWidget {
  const PatientRegistration({Key? key}) : super(key: key);

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final biodata = TextEditingController();
  final contactDetails = TextEditingController();
  final principalWork = TextEditingController();
  final principalDesignation = TextEditingController();
  final phone = TextEditingController();
  final healthRecord = TextEditingController();
  final acctTier = TextEditingController();

  @override
  void initState() {
    if (ConsoleState.state.patientToEdit != null) {
      name.text = ConsoleState.state.patientToEdit!.patientName;
      biodata.text = ConsoleState.state.patientToEdit!.biodata;
      contactDetails.text = ConsoleState.state.patientToEdit!.contactDetails;
      principalDesignation.text =
          ConsoleState.state.patientToEdit!.principalDesignation;
      principalWork.text = ConsoleState.state.patientToEdit!.principalWorkDetails;
      phone.text = ConsoleState.state.patientToEdit!.phone;
      healthRecord.text = ConsoleState.state.patientToEdit!.medRecord;
      acctTier.text = ConsoleState.state.patientToEdit!.acctTier;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsoleScaffold(
      appBar: appBar(
        title: 'Patient Registration',
      ),
      bottomBar: SizedBox(
        height: 0.09.sh,
        child: FlatButton(
          buttonText: 'SUBMIT',
        ),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            title('Personal Info', textColor: ColorPalette.offBlack),
            FlatTextField(
              controller: name,
              hintText: 'Full Name',
            ),
            FlatTextBoxField(
              hintText: 'Bio data',
              controller: biodata,
            ),
            title('Medical Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(
              hintText: 'Health Record',
              controller: healthRecord,
            ),
            title('Account Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(
              hintText: 'Account Tier',
              controller: acctTier,
            ),
            ConsoleDropdown(
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
            title('Contact Info', textColor: ColorPalette.offBlack),
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
            FlatTextBoxField(
              hintText: 'Contact Details',
              controller: contactDetails,
            ),
            title('Principal Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(
              hintText: 'Principal Designation',
              controller: principalDesignation,
            ),
            FlatTextBoxField(
              hintText: 'Principal Work Details',
              controller: principalWork,
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
