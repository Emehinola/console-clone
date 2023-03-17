import 'package:get/get.dart';

import 'controller-variables.dart';

Rx<CurrentAuthScreen> currentScreen = CurrentAuthScreen.login.obs;
Rx<CurrentSelectedNavItem> selectedItem = CurrentSelectedNavItem.dashboard.obs;

class ConsoleState extends GetxController{

}