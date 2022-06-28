import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const mySecondaryColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',

  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: const Color(0xFF26242e),
    scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.orange,
  ),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'Poppins',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFFFFF), brightness: Brightness.dark),
);
ThemeColor darkMode = ThemeColor(
  gradient: [
    const Color(0xFF8983F7),
    const Color(0xFFA3DAFB),
  ],
  backgroundColor: const Color(0xFF26242e),
  textColor: const Color(0xFFFFFFFF),
  toggleButtonColor: const Color(0xFf34323d),
  toggleBackgroundColor: const Color(0xFF222029),
  shadow: const <BoxShadow>[
    BoxShadow(
      color: Color(0x66000000),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
);

class ThemeColor {
  List<Color> gradient;
  Color backgroundColor;
  Color toggleButtonColor;
  Color toggleBackgroundColor;
  Color textColor;
  List<BoxShadow> shadow;

  ThemeColor({
    required this.gradient,
    required this.backgroundColor,
    required this.toggleBackgroundColor,
    required this.toggleButtonColor,
    required this.textColor,
    required this.shadow,
  });
}