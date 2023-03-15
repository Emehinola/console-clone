import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../theme/color-palette.dart';

class ConsoleDropdown extends StatelessWidget {
  List<dynamic>? options;
  String? label;
  String? value;
  String? errorText;
  Function(dynamic value)? onChanged;

  ConsoleDropdown({
    Key? key,
    this.options,
    this.label,
    this.value,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: label != null,
            child: Text(
              label ?? '',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            )),
        // const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: ColorPalette.textFieldBg,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16.0)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 8),
          constraints: const BoxConstraints(minHeight: 55),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(
                IconlyLight.arrow_down_2,
                color: ColorPalette.offBlack,
              ),
              iconEnabledColor: ColorPalette.greyBlue,
              items: options
                  ?.map((value) => DropdownMenuItem(
                value: value,
                child: Text(value,
                    style: TextStyle(
                        color: ColorPalette.offBlack,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600)),
              ))
                  .toList(),
              onChanged: onChanged,
              isExpanded: true,
              value: value,
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(errorText ?? '',
                style: const TextStyle(color: Colors.red, fontSize: 11)),
          ),
        )
      ],
    );
  }
}