import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/category_screen/bloc/get_category_meal_bloc/get_category_meal_bloc.dart';
import 'package:restoran_serba_ada/screen/category_screen/category_screen_widget/category_result_widget.dart';
import 'package:restoran_serba_ada/screen/search_screen/bloc/search_result_bloc/search_result_bloc.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    context.read<SearchResultBloc>().add(EmptySearchResultEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 34,
              ),
              Text(
                'Category List',
                style: ThemeTextStyle().textStyleSecond,
              ),
              BlocBuilder<GetCategoryMealBloc, GetCategoryMealState>(
                builder: (context, state) {
                  if (state is ValueCategoryMealDataState) {
                    return CategoryResultWidget(
                      categoryResult: state.data,
                      categoryName: '',
                    );
                  } else if (state is LoadingSearchResultState) {
                    return const Padding(
                      padding: EdgeInsets.all(
                        56.0,
                      ),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is EmptySearchResultState) {
                    return const SizedBox();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
