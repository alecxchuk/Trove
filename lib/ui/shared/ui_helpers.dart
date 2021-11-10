import 'package:flutter/material.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _verticalSpaceSmall = 10.0;
  static const double _verticalSpaceMedium = 20.0;
  static const double _verticalSpace40 = 40.0;
  static const double _verticalSpaceLarge = 60.0;
  // Vertical spacing constants. Adjust to your liking.
  static const double _horizontalSpaceSmall = 10.0;
  static const double _horizontalSpace4 = 4.0;
  static const double _horizontalSpaceMedium = 20.0;
  static const double _horizontalSpace25 = 25.0;
  static const double _horizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _verticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _verticalSpaceMedium);
  static const Widget verticalSpace40 = SizedBox(height: _verticalSpace40);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _verticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _horizontalSpaceSmall);
  static const Widget horizontalSpace4 = SizedBox(width: _horizontalSpace4);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _horizontalSpaceMedium);
  static const Widget horizontalSpace25 = SizedBox(width: _horizontalSpace25);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _horizontalSpaceLarge);
}
