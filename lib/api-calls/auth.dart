import 'package:console/database/provider.dart';
import 'package:console/screens/mobile/dashboard/dashboard.dart';
import 'package:console/services/navigate.dart';
import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../state-management/controller-variables.dart';
import '../state-management/state-management.dart';
import '../widgets/desktop/dialogs.dart';
import '../widgets/notification/snack-notification.dart';

Future<void> registerUser(Map payload, {bool isMobile = false}) async {
  await Future.delayed(const Duration(seconds: 3));
  try{
    User user = User(
        firstName: payload['firstName'],
        middleName: payload['middleName'],
        lastName: payload['lastName'],
        username: payload['username'],
        socHandle: payload['socHandle'],
        phone: payload['phone'],
        lga: payload['lga'],
        division: payload['division'],
        ethnicity: payload['ethnicity'],
        garrison: payload['garrison'],
        nationality: payload['nationality'],
        platoon: payload['platoon'],
        position: payload['position'],
        primaryAssignment: payload['primaryAssignment'],
        rank: payload['rank'],
        religion: payload['religion'],
        unit: payload['unit'],
        password: payload['password'],
    );
    await DBProvider.db.insertUser(user);

    if(isMobile){
      navigate(const Dashboard(), routeName: '/mobile-dashboard');
      consoleSnackNotification('Account created successfully!', header: 'Success');
    }else{
      // navigate(DesktopNavigation(), routeName: '/dashboard');
      currentScreen.value = CurrentAuthScreen.login;
      showSuccessDialog('Success', 'Account created successfully!');
    }

  }catch(e){
    print(e);
  }
}

Future<Map> loginUser(Map payload, {bool isMobile = false}) async {
  await Future.delayed(const Duration(seconds: 3));

  try{
    User? user = DBProvider.db.getUserByUsername(payload['username']);

    if(user != null){
      if(user.password == payload['password']){

        if(isMobile){
          navigate(const Dashboard(), routeName: '/mobile-dashboard');
          showSuccessDialog('Success!',
              'You have logged in successfully');
        }else{
          navigate(DesktopNavigation(), routeName: '/dashboard');
          showSuccessDialog('Login successful',
              'You have successfully logged In!');
        }

        return {'success': true, 'message': 'Login successful!', 'user': user};
      }
    }
  }catch(e){
    //
  }

  if(isMobile){
    consoleSnackNotification('Incorrect username or password!', header: 'Error');
  }else{
    showErrorDialog('Error!',
        'Incorrect username or password');
  }

  return {'success': false, 'message': 'Incorrect username or password', 'user': null};
}
