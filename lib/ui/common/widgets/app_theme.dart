import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// This class contains all UI related styles
///
class AppTheme extends StatefulWidget {
  final Widget child;

  const AppTheme({
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return AppThemeState();
  }

  static AppThemeState of(BuildContext context) {
    final _InheritedStateContainer? inheritedStateContainer =
        context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>();

    if (inheritedStateContainer == null) {
      return AppThemeState();
    } else {
      return inheritedStateContainer.data;
    }
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final AppThemeState data;

  const _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class AppThemeState extends State<AppTheme> {
  getResponsiveFont(double value) => ScreenUtil().setSp(value);

  getResponsiveWidth(double value) => ScreenUtil().setWidth(value);

  getResponsiveHeight(double value) => ScreenUtil().setHeight(value);

  ///
  /// Define All your colors here which are used in whole application
  ///
  Color get whiteColor => Color(0xFFFFFFFF);

  Color get primaryColor => Color(0xFF0256A6);

  Color get redColor => Color(0xFFD9534F);

  Color get dividerColor => Color(0xFFC2C2C2);

  Color get blackColor => Color(0xFF000000);

  Color get shimmerBackgroundColor => Color(0xff484848).withOpacity(0.3);

  get shimmerBaseColor => Colors.grey[300];

  get shimmerHighlightColor => Colors.grey[100];
  get black =>  Colors.black;

  get white70 => Colors.white70;

  ///
  /// Mention height and width which are mentioned in your design file(i.e XD)
  /// to maintain ratio for all other devices
  ///
  num get expectedDeviceWidth => 1080;

  num get expectedDeviceHeight => 1920;

  ///
  /// List of your Text Styles which are used through this app.
  ///

  TextStyle get signupTextStyle => TextStyle(
        fontFamily: "Nunito",
        fontWeight: FontWeight.w700,
        fontSize: 18.0.sp,
      );
  TextStyle get noInternetTextStyle => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFont(35.sp),
      color: whiteColor);


  TextStyle get loginTextStyle => TextStyle(
      fontFamily: "Nunito",
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 36.0.sp);

  TextStyle get doyouTextStyle => TextStyle(
      color: Colors.white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.normal,
      fontSize: 15.0.sp);

  TextStyle get login => TextStyle(
      color: Colors.white,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w700,
      fontSize: 15.0.sp);

  TextStyle get forgot => TextStyle(
        fontFamily: "Nunito",
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline,
        color: Colors.black,
        fontSize: 15.sp,
      );

  TextStyle get loginOnButton => TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 17.sp);

  TextStyle get lableOfPassWord =>
      TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.normal);

  TextStyle get lableOfEmail =>
      TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
