import 'package:console/screens/desktop/onboarding/auth/create-account.dart';
import 'package:console/screens/desktop/onboarding/auth/login.dart';
import 'package:console/services/constants.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../state-management/state-management.dart';
import '../../../widgets/mob-desk/buttons/console-text-button.dart';

class DesktopWelcome extends StatefulWidget {
  const DesktopWelcome({Key? key}) : super(key: key);

  @override
  State<DesktopWelcome> createState() => _DesktopWelcomeState();
}

class _DesktopWelcomeState extends State<DesktopWelcome> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx((){
          return Row(
            children: [
              SizedBox(width: 1680.w / 2, child: const LeftPanel()),
              SizedBox(
                  width: 1680.w / 2,
                  child: currentScreen.value == CurrentAuthScreen.login
                      ? DesktopLoginScreen()
                      : DesktopSignUpScreen()),
            ],
          );
        })
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {

  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: ColorPalette.dark,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 200.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                './assets/images/console.jpeg',
                height: 200,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            OutlinedBtn(
              buttonText: 'Create Account',
              verticalPadding: 20,
              onTap: () => currentScreen.value = CurrentAuthScreen.singUp,
            ),
            FlatButton(
                buttonText: 'Sign In',
                verticalPadding: 20,
                onTap: () => currentScreen.value = CurrentAuthScreen.login),
          ],
        ),
      ),
    );
  }
}

