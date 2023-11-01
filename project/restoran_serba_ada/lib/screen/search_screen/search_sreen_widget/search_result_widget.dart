import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/model/search_model.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class SearchResultWidget extends StatelessWidget {
  final List<Meal> searchResult;
  const SearchResultWidget({
    super.key,
    required this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: searchResult.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(
              '/detail',
              arguments: searchResult[index],
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
                          image: NetworkImage(
                              searchResult[index].strMealThumb ?? ''),
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
                            searchResult[index].strMeal ?? '',
                            style: ThemeTextStyle().textStyleSecondBold,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        searchResult[index].strCategory ?? '',
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
