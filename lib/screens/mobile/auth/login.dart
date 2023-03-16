import 'package:console/screens/mobile/auth/signup.dart';
import 'package:console/services/navigate.dart';
import 'package:console/widgets/mob-desk/auth/social-icons.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/custom/console-scaffold.dart';
import 'package:console/widgets/notification/snack-notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../services/validation-service.dart';
import '../../../widgets/mob-desk/custom/custom-texts.dart';
import '../../../widgets/mob-desk/forms/console-text-field.dart';
import '../../../widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      height: 50.sp,
                    ),
                    brandText(),
                    SizedBox(
                      height: 50.0.sp,
                    ),
                    ConsoleTextField(
                      controller: emailController,
                      hintText: 'Username',
                      isPassword: false,
                      validationService: (String? email) =>
                          ValidationService.isValidInput(email!),
                    ),
                    ConsoleTextField(
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
                      height: 10.0.sp,
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
                      height: 50.0.sp,
                    ),
                    ConsoleTextButton(
                      buttonText: 'Sign In',
                      loading: loading,
                      applyingMargin: true,
                      onTap: (){
                        navigate(const Dashboard(), routeName: '/dashboard');
                        consoleSnackNotification('Login successful!', header: 'Success');
                      },
                    ),
                    SizedBox(
                      height: 30.0.sp,
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
                      height: 30.0.sp,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: ColorPalette.shadowColor,
                                offset: Offset(0, 2))
                          ]),
                      child: Image.asset(
                        './assets/images/fingerprint1.jpg',
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      "Use Biometric",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
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
                          text: 'Don\'t have an account yet ? ',
                          style: const TextStyle(
                            fontSize: 16,
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
                                  ..onTap = () => navigate(SignupScreen(),
                                      routeName: '/create-account')),
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
