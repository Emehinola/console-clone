import 'package:console/database/db-operations.dart';
import 'package:console/services/navigate.dart';

import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../widgets/desktop/dialogs.dart';

Future<void> registerUser(Map payload) async {
  await Future.delayed(const Duration(seconds: 3));
  User user = User(
    fullName: payload['full_name'],
    bioData: payload['biodata'],
    officialDetails: payload['official_details'],
    otherDetails: payload['other_details'],
    username: payload['username'],
    password: payload['password'],
  );
  await insertUser(user);

  navigate(DesktopNavigation(), routeName: '/dashboard');
  showSuccessSheet('Login successful', 'You have successfully logged In!');
}
