import 'package:console/services/navigate.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/notification/snack-notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/constants.dart';
import '../../../../services/validation-service.dart';
import '../../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../dashboard/navigation.dart';

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
                        controller: emailController,
                        hintText: 'Full Name',
                        isPassword: false,
                        validationService: (String? name) =>
                            ValidationService.isValidInput(name!),
                      ),
                      FlatTextField(
                        hintText: 'Bio Details',
                      ),
                      FlatTextField(
                        hintText: 'Official Details',
                      ),
                      FlatTextField(
                        hintText: 'Other Details',
                      ),
                      SizedBox(
                        height: 0.06.sh,
                      ),
                      FlatButton(
                        buttonText: 'Sign Up',
                        loading: loading,
                        applyingMargin: false,
                        verticalPadding: 0.02.sh,
                        onTap: () {
                          navigate(DesktopNavigation(),
                              routeName: '/dashboard');
                          consoleSnackNotification('Login successful!',
                              header: 'Success');
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
