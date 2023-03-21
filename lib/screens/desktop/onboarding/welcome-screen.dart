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
      body: WillPopScope(
        onWillPop: () async{
          return false;
        },
        child: SizedBox(child: Obx(() {
          return Row(
            children: [
              SizedBox(width: 0.5.sw, child: const LeftPanel()),
              SizedBox(
                  width: 0.5.sw,
                  child: currentScreen.value == CurrentAuthScreen.login
                      ? DesktopLoginScreen()
                      : DesktopSignUpScreen()),
            ],
          );
        })),
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('./assets/images/crsplash.png'),
              fit: BoxFit.cover),
          color: Colors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(fontSize: 25.sp, color: Colors.white),
            ),
            SizedBox(
              height: 0.2.sh,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                './assets/images/console.jpeg',
                height: 0.2.sh,
              ),
            ),
            SizedBox(
              height: 0.2.sh,
            ),
            OutlinedBtn(
              buttonText: 'Create Account',
              verticalPadding: 0.02.sh,
              onTap: () => currentScreen.value = CurrentAuthScreen.singUp,
            ),
            FlatButton(
                buttonText: 'Sign In',
                verticalPadding: 0.02.sh,
                onTap: () => currentScreen.value = CurrentAuthScreen.login),
          ],
        ),
      ),
    );
  }
}
