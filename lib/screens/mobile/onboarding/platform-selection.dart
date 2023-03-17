import 'package:console/screens/desktop/onboarding/welcome-screen.dart';
import 'package:flutter/material.dart';
import '../../../services/constants.dart';


class SelectWelcomeScreen extends StatefulWidget {
  const SelectWelcomeScreen({Key? key}) : super(key: key);

  @override
  _SelectWelcomeScreenState createState() => _SelectWelcomeScreenState();
}

class _SelectWelcomeScreenState extends State<SelectWelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return isMobile() ? const SelectWelcomeScreen() : const DesktopWelcome();
  }
}
