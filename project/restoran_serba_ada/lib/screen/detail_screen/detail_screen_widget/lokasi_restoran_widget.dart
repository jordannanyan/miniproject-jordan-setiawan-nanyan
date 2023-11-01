import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';

class LokasiRestoranWidget extends StatelessWidget {
  const LokasiRestoranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: ThemeColor().lightRed,
          size: 40,
        ),
        const SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jl. Kemana-mana',
              style: ThemeTextStyle().textStyleForthGrey,
            ),
            Text(
              'Palangka Raya',
              style: ThemeTextStyle().textStyleForthGrey,
            ),
          ],
        ),
        const Spacer(),
        Icon(
          Icons.arrow_right,
          color: ThemeColor().lightRed,
          size: 30,
        )
      ],
    );
  }
}
