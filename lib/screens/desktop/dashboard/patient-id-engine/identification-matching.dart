import 'package:console/widgets/mob-desk/buttons/console-text-button.dart';
import 'package:console/widgets/mob-desk/theme/color-palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../state-management/controller-variables.dart';
import '../../../../state-management/state-management.dart';
import '../../../../widgets/desktop/patient-list-tiles.dart';
import '../dashboard.dart';

class DesktopIdentificationMatching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderMetrics(),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: IdentificationTable(
            status: "Complete",
          ),
        ),
      ],
    );
  }
}
