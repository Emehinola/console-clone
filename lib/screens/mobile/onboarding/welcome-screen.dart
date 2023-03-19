import 'package:console/screens/mobile/auth/login.dart';
import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../services/navigate.dart';
import '../auth/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool willRefreshToken = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('./assets/images/crsplash.png'),
                fit: BoxFit.contain),
            color: Colors.black),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedBtn(buttonText: 'Create Account', verticalPadding: 0.02.sh, onTap: () => navigate(SignupScreen()),),
              FlatButton(buttonText: 'Login', verticalPadding: 0.02.sh, onTap: () => navigate(LoginScreen())),
            ],
          ),
        ));
  }
}