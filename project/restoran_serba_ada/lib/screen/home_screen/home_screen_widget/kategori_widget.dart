import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/model/category_model.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';

class KategoriWidget extends StatelessWidget {
  final List<Meal> dataCategory;
  final bool showMore;
  const KategoriWidget({
    super.key,
    required this.dataCategory,
    required this.showMore,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
      ),
      itemCount: (showMore) ? dataCategory.length : 8,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/category',
              arguments: dataCategory[index].strCategory,
            );
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColor().grey,
                ),
                borderRadius: BorderRadius.circular(100),
                color: ThemeColor().lightRed),
            height: 70,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                dataCategory[index].strCategory,
                style: ThemeTextStyle().textStyleSixth,
              ),
            ),
          ),
        );
      }),
    );
  }
}
