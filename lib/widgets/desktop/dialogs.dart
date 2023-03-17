import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../mob-desk/buttons/console-text-button.dart';

void showSuccessSheet(String title, String desc){
  showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            content: SizedBox(
              height: Get.height * 0.5,
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/files/success.json',
                        width: 250, height: 250),
                    const SizedBox(height: 25),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      desc,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          buttonText: 'Close',
                          verticalPadding: 20.0,
                          onTap: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))));
      });
}