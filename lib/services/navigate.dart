import 'package:flutter/material.dart';
import 'package:get/get.dart';

void navigate(Widget screen, {String? routeName}){
  Navigator.push(Get.context!, MaterialPageRoute(settings: RouteSettings(name: routeName),builder: (_)=>screen));
}