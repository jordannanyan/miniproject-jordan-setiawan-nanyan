import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';

class HistoryButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const HistoryButtonWidget({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          ThemeColor().lightRed,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
