import 'dart:math';

import 'package:console/database/provider.dart';
import 'package:console/models/registered-patient.dart';
import 'package:console/services/navigate.dart';
import 'package:console/state-management/controller-variables.dart';
import 'package:console/state-management/state-management.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../widgets/desktop/dialogs.dart';
import '../widgets/notification/snack-notification.dart';

Future<void> registerPatient(Map payload, {bool isMobile = false}) async {
  await Future.delayed(const Duration(seconds: 3));
  try {
    RegPatient patient = RegPatient(
      id: 'Q${Random.secure().nextInt(100)}',
      phone: "+234${payload['phone']}",
      acctTier: payload['accountTier'],
      firstName: payload['firstName'],
      lastName: payload['lastName'],
      genotype: payload['genotype'],
      bloodGroup: payload['bloodGroup'],
      age: int.parse(payload['age']),
      weight: double.parse(payload['weight']),
      height: double.parse(payload['height']),
      sex: payload['sex'],
      photograph: payload['photograph'],
      bmi: payload['bmi'],
      email: payload['email'],
      address: payload['address'],
      garrison: payload['garrison'],
      position: payload['position'],
      primaryAss: payload['primaryAss'],
      rank: payload['rank'],
      socHandle: payload['socHandle'],
      unit: payload['unit'],
      groupType: payload['groupType'],
      division: payload['division'],
      platoon: payload['platoon'],
      date: DateTime.now().toIso8601String(),
    );
    await DBProvider.db.insertPatient(patient);

    if(isMobile){
      Navigator.popUntil(Get.context!, ModalRoute.withName('/patient-list-mobile'));
      consoleSnackNotification('Patient added successfully!', header: 'Success');
    }else{
      selectedItem.value = CurrentSelectedNavItem.dashboard;
      showSuccessSheet('Success', 'Patient successfully added');
    }
  } catch (e) {
    print('preg: $e');
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
