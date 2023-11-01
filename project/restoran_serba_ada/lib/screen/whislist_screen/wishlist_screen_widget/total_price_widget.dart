import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class TotalPriceWidget extends StatelessWidget {
  final int price;
  const TotalPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: ThemeTextStyle().textStyleForthBold,
        ),
        Text(
          price.toString(),
          style: ThemeTextStyle().textStyleForthBold,
        ),
      ],
    );
  }
}
