import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/model/category_list_model.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';

class CategoryResultWidget extends StatelessWidget {
  final List<Meal> categoryResult;
  final String categoryName;
  const CategoryResultWidget({
    super.key,
    required this.categoryResult,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categoryResult.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(
              '/detail',
              arguments: categoryResult[index],
            );
          },
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage(categoryResult[index].strMealThumb),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.abc),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            categoryResult[index].strMeal,
                            style: ThemeTextStyle().textStyleSecondBold,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        categoryName,
                        style: ThemeTextStyle().textStyleForthBold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }),
    );
  }
}
