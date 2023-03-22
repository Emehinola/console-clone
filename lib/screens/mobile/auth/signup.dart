import 'package:console/screens/mobile/auth/login.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../api-calls/auth.dart';
import '../../../services/navigate.dart';
import '../../../services/validation-service.dart';
import '../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/notification/snack-notification.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
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

    return ConsoleScaffold(
      padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
      child: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    // brandText(),
                    SizedBox(
                      height: 30.0.sp,
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
                      height: 30.0.sp,
                    ),
                    Align(alignment: Alignment.center, child: buildSocialRow()),
                    SizedBox(
                      height: 20.0.sp,
                    ),
                    FlatTextField(
                      controller: nameController,
                      hintText: 'Full Name',
                      isPassword: false,
                      validationService: (String? name) =>
                          ValidationService.isValidInput(name!),
                    ),FlatTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                      isPassword: false,
                      validationService: (String? name) =>
                          ValidationService.isValidInput(name!),
                    ),
                    FlatTextField(
                      controller: biodataController,
                      hintText: 'Bio Details',
                    ),
                    FlatTextField(
                      controller: officialDetails,
                      hintText: 'Official Details',
                    ),
                    FlatTextField(
                      controller: otherDetails,
                      hintText: 'Other Details',
                    ),
                    FlatTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: false,
                      validationService: (String? name) =>
                          ValidationService.isValidInput(name!),
                    ),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                    FlatButton(
                        buttonText: 'Submit',
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
                          await registerUser(payload, isMobile: true);
                          setState(() {
                            loading = false;
                          });
                        }
                    ),
                    SizedBox(
                      height: 30.0.sp,
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
                                ..onTap = () => navigate(LoginScreen(),
                                    routeName: '/create-account')
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
