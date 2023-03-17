import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum DisplayType {mobile, desktop}

double largeHorPadding = 0.15.sw;

bool isMobile(){
  return (defaultTargetPlatform == TargetPlatform.android) || (defaultTargetPlatform == TargetPlatform.iOS);
}