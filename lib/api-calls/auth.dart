import 'package:console/database/provider.dart';
import 'package:console/services/navigate.dart';
import '../models/user.dart';
import '../screens/desktop/dashboard/navigation.dart';
import '../widgets/desktop/dialogs.dart';

Future<void> registerUser(Map payload) async {
  await Future.delayed(const Duration(seconds: 3));
  try{
    User user = User(
      fullName: payload['full_name'],
      bioData: payload['biodata'],
      officialDetails: payload['official_details'],
      otherDetails: payload['other_details'],
      username: payload['username'],
      password: payload['password'],
    );
    await DBProvider.db.insertUser(user);

    navigate(DesktopNavigation(), routeName: '/dashboard');
    showSuccessSheet('Login successful', 'You have successfully logged In!');
  }catch(e){
    //
  }
}

Future<Map> loginUser(Map payload) async {
  await Future.delayed(const Duration(seconds: 3));

  try{
    User? user = DBProvider.db.getUserByUsername(payload['username']);

    if(user != null){
      if(user.password == payload['password']){

        navigate(DesktopNavigation(), routeName: '/dashboard');
        showSuccessSheet('Login successful',
            'You have successfully logged In!');

        return {'success': true, 'message': 'Login successful!', 'user': user};
      }
    }
  }catch(e){
    //
  }

  showErrorDialog('Error!',
      'Incorrect username or password');

  return {'success': false, 'message': 'Incorrect username or password', 'user': null};
}
