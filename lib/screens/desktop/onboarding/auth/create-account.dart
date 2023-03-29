import 'package:console/api-calls/auth.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mobile/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/validation-service.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../widgets/mob-desk/forms/dropdowns.dart';
import '../../../../widgets/mob-desk/theme/color-palette.dart';

class DesktopSignUpScreen extends StatefulWidget {
  @override
  State<DesktopSignUpScreen> createState() => _DesktopSignUpScreenState();
}

class _DesktopSignUpScreenState extends State<DesktopSignUpScreen> {
  bool obscurePassword = false;
  bool loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.07.sw),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 0.08.sh,
                      ),
                      // brandText(),
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
                          const SizedBox(width: 10.0,),
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
                          const SizedBox(width: 10.0,),
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
                                    ValidationService.isValidInput(name!),
                                hintText: 'Nationality'),
                          ),
                          const SizedBox(width: 10.0,),
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
                                    ValidationService.isValidInput(name!),
                                hintText: 'Religion'),
                          ),
                          const SizedBox(width: 10.0,),
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
                                    ValidationService.isValidInput(name!),
                                hintText: 'Rank'),
                          ),
                          const SizedBox(width: 10.0,),
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
                                    ValidationService.isValidInput(name!),
                                hintText: 'Garrision'),
                          ),
                          const SizedBox(width: 10.0,),
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
                                    ValidationService.isValidInput(name!),
                                hintText: 'Platoon'),
                          ),
                          const SizedBox(width: 10.0,),
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
                      FlatTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        validationService: (String? name) =>
                            ValidationService.isValidPassword(name!),
                      ),
                      SizedBox(
                        height: 0.06.sh,
                      ),
                      FlatButton(
                        buttonText: 'Sign Up',
                        loading: loading,
                        applyingMargin: false,
                        verticalPadding: 0.02.sh,
                        onTap: () async {
                          if(!_formKey.currentState!.validate()) return;
                          Map payload = {
                            'firstName': firstNameController.text,
                            'middleName': middleNameController.text,
                            'lastName': lastNameController.text,
                            'socHandle': socHandleController.text,
                            'phone': phoneController.text,
                            'nationality': nationalityController.text,
                            'ethnicity': ethnicityController.text,
                            'religion': religionController.text,
                            'lga': lgaController.text,
                            'username': emailController.text,
                            'primaryAssignment': primaryAssController.text,
                            'rank': rankController.text,
                            'position': positionController.text,
                            'garrison': garrisonController.text,
                            'division': divisionController.text,
                            'platoon': platoonController.text,
                            'unit': unitController.text,
                            'password': passwordController.text,
                          };
                          setState(() {
                            loading = true;
                          });
                          await registerUser(payload);
                          setState(() {
                            loading = false;
                          });
                        },
                      ),
                      SizedBox(
                        height: 0.06.sh,
                      ),
                      Text(
                        "Or sign up with",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.grey,
                        ),
                      ),
                      SizedBox(
                        height: 0.06.sh,
                      ),
                      Align(
                          alignment: Alignment.center, child: buildSocialRow()),
                      SizedBox(
                        height: 0.09.sh,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account ? ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.grey,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Sign In',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorPalette.mainButtonColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => currentScreen.value =
                                        CurrentAuthScreen.login),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.09.sh,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
