import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appbarText;
  const AppbarWidget({super.key, required this.appbarText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(appbarText),
      titleTextStyle: ThemeTextStyle().appbarText,
      backgroundColor: ThemeColor().white,
      iconTheme: IconThemeData(
        color: ThemeColor().lightRed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
