import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void consoleSnackNotification(String message, {int seconds = 30, String header = 'Error'}) {
  Get.snackbar(
    header,
    message,
    backgroundColor: Colors.black,
    duration: Duration(seconds: seconds),
    colorText: header == 'Error'
        ? Colors.red
        : header == 'Info'
        ? Colors.lightBlueAccent
        : Colors.lightGreenAccent,
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    mainButton: TextButton(
      onPressed: () {},
      child: InkWell(
        onTap: () => Get.back(),
        child: const Icon(
          FontAwesomeIcons.xmark,
          color: Colors.red,
        ),
      ),
    ),
  );
}