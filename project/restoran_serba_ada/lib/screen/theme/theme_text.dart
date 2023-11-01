import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';

class ThemeTextStyle {
  TextStyle labelLarge = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  TextStyle buttonText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  TextStyle appbarText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ThemeColor().black,
  );

  TextStyle textStyleFirstBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ThemeColor().black,
  );

  TextStyle textStyleSecond = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ThemeColor().black,
  );

  TextStyle textStyleSecondBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ThemeColor().black,
  );

  TextStyle textStyleThird = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().black,
  );

  TextStyle textStyleThirdBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ThemeColor().black,
  );

  TextStyle textStyleForth = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().black,
  );

  TextStyle textStyleForthGrey = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().grey,
  );

  TextStyle textStyleForthBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ThemeColor().black,
  );

  TextStyle textStyleForthBoldRed = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ThemeColor().lightRed,
  );

  TextStyle textStyleFifth = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().grey,
  );
  TextStyle textStyleSixth = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w600,
  );
}
