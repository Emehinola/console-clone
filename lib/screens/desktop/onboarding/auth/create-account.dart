import 'package:console/screens/mobile/auth/signup.dart';
import 'package:console/services/navigate.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/notification/snack-notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/validation-service.dart';
import '../../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../../mobile/dashboard/dashboard.dart';


class DesktopSignUpScreen extends StatefulWidget {
  @override
  State<DesktopSignUpScreen> createState() => _DesktopSignUpScreenState();
}

class _DesktopSignUpScreenState extends State<DesktopSignUpScreen> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200),
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
                      height: 50.sp,
                    ),
                    brandText(),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                    FlatTextField(
                      controller: emailController,
                      hintText: 'Full Name',
                      isPassword: false,
                      validationService: (String? name) =>
                          ValidationService.isValidInput(name!),
                    ),
                    FlatTextBoxField(
                      hintText: 'Bio Details',
                      minLines: 3,
                      maxLines: 4,
                    ),
                    FlatTextBoxField(
                      hintText: 'Official Details',minLines: 3,
                      maxLines: 4,

                    ),
                    FlatTextBoxField(
                      hintText: 'Other Details',
                      minLines: 3,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                    FlatButton(
                      buttonText: 'Sign Up',
                      loading: loading,
                      applyingMargin: false,
                      verticalPadding: 20.0,
                      onTap: (){
                        consoleSnackNotification('Login successful!', header: 'Success');
                      },
                    ),
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
                      height: 50.0.sp,
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
                                  ..onTap = () => currentScreen.value = CurrentAuthScreen.login),
                          ],
                        ),
                      ),
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
