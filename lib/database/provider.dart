// create database singleton
import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/user.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  var box = Hive.box('console');

  List<User> getAllUsers() {
    List<User> users = [];

    var rawUsers = box.get('users');
    List rawUsersList = rawUsers.toList();

    for (var element in rawUsersList) { users.add(User.fromJson(jsonDecode(element))); }
    return users;
  }

  List<Map> getLocalUsers() {
    List<Map> users = [];

    var rawUsers = box.get('users');
    List rawUsersList = rawUsers.toList();

    for (var element in rawUsersList) { users.add(User.toJson(jsonDecode(element))); }
    return users;
  }

  insertUser(User user) async {
      Map userMap = User.toJson(user);
      List<Map> previousUsers = getLocalUsers();
      previousUsers.add(userMap);

      await box.put('users', previousUsers);
  }

  User? getUserByUsername(String username){
    List<User> users = getAllUsers();

    return users.singleWhere((element) => element.username == username);
  }
}