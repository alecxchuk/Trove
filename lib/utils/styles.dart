import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyle {
  static const double _size12 = 12;
  static const double _size14 = 14;
  static const double _size16 = 16;
  static const double _size18 = 18;
  // static const double _size18 = 19;
  static const double _size20 = 20;
  static const double _size24 = 24.0;
  static const double _size32 = 32.0;

  static const FontWeight _weight500 = FontWeight.w500;
  static const FontWeight _normalWeight = FontWeight.w400;
  static const FontWeight _weight600 = FontWeight.w600;
  static const FontWeight _boldWeight = FontWeight.w700;

  static TextStyle grey500_12 = _base(_size12, _weight500, AppColors.appGrey);

  static TextStyle greyNormal14 =
      _base(_size12, _normalWeight, AppColors.appGrey);
  static TextStyle greyNormal14s =
      _base(_size14, _normalWeight, AppColors.appGrey);
  static TextStyle greyNormal16 =
      _base(_size16, _normalWeight, AppColors.appGrey);

  static TextStyle blackBold14 =
      _base(_size14, _boldWeight, AppColors.appBlack);
  static TextStyle black500_14 = _base(_size14, _weight500, AppColors.appBlack);
  static TextStyle black500_16 = _base(_size16, _weight500, AppColors.appBlack);
  static TextStyle blackBold24 =
      _base(_size24, _boldWeight, AppColors.appBlack);
  static TextStyle blackBold20 =
      _base(_size20, _boldWeight, AppColors.appBlack);
  static TextStyle blackBold32 = _base(_size32, _weight600, AppColors.appBlack);

  static TextStyle whiteNormal12 =
      _base(_size12, _normalWeight, AppColors.appwhite);
  static TextStyle whiteNormal14 =
      _base(_size14, _normalWeight, AppColors.appwhite);
  static TextStyle white600_14 = _base(_size14, _weight600, AppColors.appwhite);
  static TextStyle whiteNormal16 =
      _base(_size16, _normalWeight, AppColors.appwhite);
  static TextStyle white600_18 = _base(_size18, _weight600, AppColors.appwhite);
  static TextStyle whiteBold24 =
      _base(_size24, _boldWeight, AppColors.appwhite);
  static TextStyle whiteBold32 =
      _base(_size32, _boldWeight, AppColors.appwhite);
  static TextStyle white500_20 = _base(_size20, _weight500, AppColors.appwhite);
  static TextStyle white600_32 = _base(_size32, _weight600, AppColors.appwhite);

  static TextStyle redNormal14 =
      _base(_size14, _normalWeight, AppColors.appRed);
  static TextStyle greenNormal14 =
      _base(_size14, _normalWeight, AppColors.appGreen);
  static TextStyle greenNormal12 =
      _base(_size12, _normalWeight, AppColors.appGreen);
  static TextStyle orangeNormal14 =
      _base(_size18, _normalWeight, AppColors.appOrange);

  //#base style
  static TextStyle _base(
    double size,
    FontWeight? fontWeight,
    Color? color,
  ) {
    return baseStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle baseStyle({
    double fontSize = 13,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.dmSans(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600],
    );
  }
}
