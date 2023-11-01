import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class WelcomeWidget extends StatelessWidget {
  final String name;
  final Function()? onTap;
  const WelcomeWidget({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: ThemeTextStyle().textStyleFirstBold,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome To Restaurant Serba Ada',
              style: ThemeTextStyle().textStyleThird,
            ),
          ],
        ),
        GestureDetector(
          child: Icon(
            Icons.logout,
            color: ThemeColor().lightRed,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
