import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplaySuccess extends StatelessWidget {
  String title;
  String description;
  String nextText;
  Function()? onNext;

  DisplaySuccess({
    Key? key,
    required this.title,
    required this.description,
    required this.nextText,
    this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(height: 25),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: ConsoleTextButton(
                      buttonText: nextText,
                      onTap: () {
                        if(onNext != null) onNext!();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
