import 'package:flutter/material.dart';

class ConsoleScaffold extends StatelessWidget {

  PreferredSize? appBar;
  Widget child;
  Widget? bottomBar;

  ConsoleScaffold({Key? key, this.appBar, required this.child, this.bottomBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: child,
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
