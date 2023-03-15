import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ConsoleScaffold(
      child: Form(
        key: _formKey,
        child: ListView(
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
                    brandText(),
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
                    ConsoleTextField(
                      controller: emailController,
                      hintText: 'Full Name',
                      isPassword: false,
                      validationService: (String? name) =>
                          ValidationService.isValidInput(name!),
                    ),
                    ConsoleTextBoxField(
                      hintText: 'Bio Details',
                      minLines: 3,
                      maxLines: 4,
                    ),
                    ConsoleTextBoxField(
                      hintText: 'Official Details',minLines: 3,
                      maxLines: 4,

                    ),
                    ConsoleTextBoxField(
                      hintText: 'Other Details',
                      minLines: 3,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                    ConsoleTextButton(
                        buttonText: 'Submit',
                        loading: loading,
                        applyingMargin: false,
                        onTap: () => consoleSnackNotification('Account created successfully!', header: 'Success')
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
                                ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: const RouteSettings(
                                        name: '/login'),
                                    builder: (_) => const Scaffold(),
                                  ),
                                ),
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
