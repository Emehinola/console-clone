import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../mob-desk/buttons/shadow-btns.dart';

PreferredSize appBar({String? title}) {
  return PreferredSize(preferredSize: Size(Get.width, 70), child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShadowIconButton(iconData: CupertinoIcons.chevron_back, onTap: () {
            Get.back();
          },),
          const SizedBox(width: 20.0,),
          Text(title ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        ],
      ),
    ),
  ));
}