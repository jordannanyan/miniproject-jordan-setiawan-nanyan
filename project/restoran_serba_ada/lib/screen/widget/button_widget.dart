import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final String route;
  final Function()? onPressed;
  const ButtonWidget(
      {super.key,
      required this.textButton,
      required this.route,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          ThemeColor().lightRed,
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 50),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        textButton,
        style: ThemeTextStyle().buttonText,
      ),
    );
  }
}
