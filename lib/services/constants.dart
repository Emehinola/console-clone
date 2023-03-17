import 'package:flutter/foundation.dart';

enum DisplayType {mobile, desktop}

bool isMobile(){
  return (defaultTargetPlatform == TargetPlatform.android) || (defaultTargetPlatform == TargetPlatform.iOS);
}