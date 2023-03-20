import 'dart:math';

import 'package:console/database/provider.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/services/navigate.dart';

import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../widgets/desktop/dialogs.dart';

Future<void> registerPatient(Map payload) async {
  await Future.delayed(const Duration(seconds: 3));
  try {
    RegPatient patient = RegPatient(
      id: 'Q${Random.secure()}',
      phone: payload['phone'],
      acctTier: payload['accountTier'],
      biodata: payload['bioData'],
      contactDetails: payload['contactDetails'],
      medRecord: payload['medRecord'],
      patientName: payload['patientName'],
      principalDesignation: payload['principalDes'],
      principalWorkDetails: payload['principalWorkDetails'],
    );
    await DBProvider.db.insertPatient(patient);

    navigate(DesktopNavigation(), routeName: '/dashboard');
    showSuccessSheet('Login successful', 'You have successfully logged In!');
  } catch (e) {
    //
  }
}

Future<Map> loginUser(Map payload) async {
  await Future.delayed(const Duration(seconds: 3));

  try {
    User? user = DBProvider.db.getUserByUsername(payload['username']);

    if (user != null) {
      if (user.password == payload['password']) {
        navigate(DesktopNavigation(), routeName: '/dashboard');
        showSuccessSheet(
            'Login successful', 'You have successfully logged In!');

        return {'success': true, 'message': 'Login successful!', 'user': user};
      }
    }
  } catch (e) {
    //
  }

  showSuccessSheet(
      'Incorrect username or password', 'You have successfully logged In!');

  return {
    'success': false,
    'message': 'Incorrect username or password',
    'user': null
  };
}
