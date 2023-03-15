import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/mob-desk/buttons/shadow-btns.dart';

class PMTemplate extends StatefulWidget {
  Widget child;

  PMTemplate({Key? key, required this.child}) : super(key: key);

  @override
  State<PMTemplate> createState() => _PMTemplatetate();
}

class _PMTemplatetate extends State<PMTemplate> {
  List<bool> activeList = [true, false, false];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadowIconButton(
                    iconData: CupertinoIcons.chevron_back,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: widget.child)
          ],
        ),
      ),
    );
  }
}
