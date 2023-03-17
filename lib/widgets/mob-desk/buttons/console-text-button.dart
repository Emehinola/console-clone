import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/color-palette.dart';

class ConsoleTextButton extends StatelessWidget {
  String buttonText;
  Function()? onTap;
  Color? backgroundColor;
  Color? shadowColor;
  bool loading;
  bool disabled;
  bool applyingMargin;

  ConsoleTextButton({
    required this.buttonText,
    this.onTap,
    this.backgroundColor,
    this.shadowColor,
    this.loading = false,
    this.disabled = false,
    this.applyingMargin = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && !loading) onTap!();
      },
      child: Container(
        height: 56,
        alignment: Alignment.center,
        margin: applyingMargin
            ? const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backgroundColor ??
              (disabled
                  ? ColorPalette.lightGrey
                  : ColorPalette.mainButtonColor),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? ColorPalette.greyBlue.withOpacity(0.15),
              offset: const Offset(0, 8),
              blurRadius: 5,
            ),
          ],
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0.sp),
                  ),
                  const CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ],
              )
            : Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(16.0),
                ),
              ),
      ),
    );
  }
}

class FlatButton extends StatelessWidget {
  String buttonText;
  Function()? onTap;
  Color? backgroundColor;
  Color? shadowColor;
  bool loading;
  bool disabled;
  bool applyingMargin;
  IconData? iconData;
  double? verticalPadding;
  double? horPaddding;

  FlatButton({
    required this.buttonText,
    this.onTap,
    this.backgroundColor,
    this.shadowColor,
    this.loading = false,
    this.disabled = false,
    this.applyingMargin = true,
    this.iconData,
    this.verticalPadding,
    this.horPaddding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && !loading) onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        margin: applyingMargin
            ? const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: horPaddding ?? 15.0, vertical: verticalPadding ?? 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor ??
              (disabled
                  ? ColorPalette.lightGrey
                  : ColorPalette.mainButtonColor),
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0.sp),
                  ),
                  const CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (iconData != null)
                    Icon(
                      iconData,
                      color: Colors.white,
                    ),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(16.0),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class OutlinedBtn extends StatelessWidget {
  String buttonText;
  Function()? onTap;
  Color? backgroundColor;
  Color? textColor;
  Color? borderColor;
  Color? shadowColor;
  bool loading;
  bool disabled;
  bool applyingMargin;
  IconData? iconData;
  double? verticalPadding;
  double? horPadding;

  OutlinedBtn({
    required this.buttonText,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.shadowColor,
    this.loading = false,
    this.disabled = false,
    this.applyingMargin = true,
    this.iconData,
    this.verticalPadding,
    this.horPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled && !loading) onTap!();
      },
      child: Container(
        alignment: Alignment.center,
        margin: applyingMargin
            ? const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0)
            : EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: horPadding ?? 15.0, vertical: verticalPadding ?? 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.5, color: borderColor ?? ColorPalette.secondColor),
          color: Colors.transparent,
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0.sp),
                  ),
                  const CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (iconData != null)
                    Icon(
                      iconData,
                      color: Colors.white,
                    ),
                  Text(
                     buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(16.0),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
