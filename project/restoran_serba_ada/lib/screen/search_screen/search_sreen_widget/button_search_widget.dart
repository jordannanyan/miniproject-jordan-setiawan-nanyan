import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';

class ButtonSearchWidget extends StatelessWidget {
  final Function()? onPress;
  const ButtonSearchWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            ThemeColor().lightRed,
          ),
        ),
        onPressed: onPress,
        child: const Text(
          'Search',
        ),
      ),
    );
  }
}
