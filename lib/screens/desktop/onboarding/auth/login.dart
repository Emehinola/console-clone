import 'package:console/services/navigate.dart';
import 'package:console/widgets/desktop/dialogs.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/notification/snack-notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../services/constants.dart';
import '../../../../services/validation-service.dart';
import '../../../../state-management/controller-variables.dart';
import '../../../../state-management/state-management.dart';
import '../../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../../widgets/mob-desk/theme/color-palette.dart';
import '../../dashboard/navigation.dart';

class DesktopLoginScreen extends StatefulWidget {
  @override
  State<DesktopLoginScreen> createState() => _DesktopLoginScreenState();
}

class _DesktopLoginScreenState extends State<DesktopLoginScreen> {
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
        padding: EdgeInsets.symmetric(horizontal: 150.w),
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
                        height: 50.h,
                      ),
                      brandText(),
                      SizedBox(
                        height: 50.0.h,
                      ),
                      FlatTextField(
                        controller: emailController,
                        hintText: 'Username',
                        isPassword: false,
                        validationService: (String? email) =>
                            ValidationService.isValidInput(email!),
                      ),
                      FlatTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        isPassword: true,
                        obscure: obscurePassword,
                        validationService: (String? password) =>
                            ValidationService.isValidInput(password!),
                        suffixCallBack: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorPalette.offBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.0.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0.h,
                      ),
                      FlatButton(
                        buttonText: 'Sign In',
                        loading: loading,
                        applyingMargin: false,
                        verticalPadding: 20.0.h,
                        onTap: () {
                          navigate(DesktopNavigation(), routeName: '/dashboard');
                          showSuccessSheet('Login successful',
                              'You have successfully logged In!');
                        },
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Text(
                        "Or login with",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Align(alignment: Alignment.center, child: buildSocialRow()),
                      SizedBox(
                        height: 50.0.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: 'Don\'t have an account yet ? ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.grey,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Create Account',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorPalette.mainButtonColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => currentScreen.value =
                                        CurrentAuthScreen.singUp),
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
      ),
    );
  }
}
