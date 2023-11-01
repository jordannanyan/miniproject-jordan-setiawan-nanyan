import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';

class ButtonCategoryWidget extends StatelessWidget {
  final Function()? onPress;
  const ButtonCategoryWidget({super.key, this.onPress});

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
