import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, User',
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
            Icons.person,
            color: ThemeColor().lightRed,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/account');
          },
        ),
      ],
    );
  }
}
