import 'package:console/api-calls/auth.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/validation-service.dart';
import '../../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
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
  final nameController = TextEditingController();
  final biodataController = TextEditingController();
  final officialDetails = TextEditingController();
  final otherDetails = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.13.sw),
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
                        height: 0.01.sh,
                      ),
                      brandText(),
                      SizedBox(
                        height: 0.07.sh,
                      ),
                      FlatTextField(
                        controller: nameController,
                        hintText: 'Full Name',
                        isPassword: false,
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
                      ),
                      FlatTextField(
                          controller: emailController,
                          validationService: (String? name) =>
                              ValidationService.isValidEmail(name!),
                          hintText: 'Email Address'),
                      FlatTextField(
                        controller: biodataController,
                        hintText: 'Bio Details',
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
                      ),
                      FlatTextField(
                        controller: officialDetails,
                        hintText: 'Official Details',
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
                      ),
                      FlatTextField(
                        controller: otherDetails,
                        hintText: 'Other Details',
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
                      ),
                      FlatTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
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
                          Map payload = {
                            'full_name': nameController.text,
                            'username': emailController.text,
                            'biodata': biodataController.text,
                            'official_details': officialDetails.text,
                            'other_details': nameController.text,
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
