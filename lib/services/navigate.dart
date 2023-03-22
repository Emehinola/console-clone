import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> navigate(Widget screen, {String? routeName}) async {
  await Navigator.push(Get.context!, MaterialPageRoute(settings: RouteSettings(name: routeName),builder: (_)=>screen));
}