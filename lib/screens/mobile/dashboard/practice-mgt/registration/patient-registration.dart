import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/mob-desk/forms/console-text-field.dart';
import 'package:console/widgets/mob-desk/forms/dropdowns.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:console/widgets/mobile/app-bar.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/material.dart';

import '../../../../../services/validation-service.dart';

class PatientRegistration extends StatefulWidget {
  const PatientRegistration({Key? key}) : super(key: key);

  @override
  _PatientRegistrationState createState() => _PatientRegistrationState();
}

class _PatientRegistrationState extends State<PatientRegistration> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ConsoleScaffold(
      appBar: appBar(
        title: 'Patient Registration',
      ),
      bottomBar: ConsoleTextButton(
        buttonText: 'SUBMIT',
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            title('Personal Info', textColor: ColorPalette.offBlack),
            FlatTextField(
              hintText: 'Full Name',
            ),
            FlatTextBoxField(hintText: 'Bio data'),
            title('Medical Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Health Record'),
            title('Account Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Account Tier'),
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
                    options: const ['+234',],
                    value: '+234',
                    onChanged: (value){
                      //
                    },
                  ),
                ),
                const SizedBox(width: 10,),
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
            FlatTextBoxField(hintText: 'Contact Details'),
            title('Principal Info', textColor: ColorPalette.offBlack),
            FlatTextBoxField(hintText: 'Principal Designation'),
            FlatTextBoxField(hintText: 'Principal Work Details'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
