import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/category_screen/bloc/get_category_meal_bloc/get_category_meal_bloc.dart';
import 'package:restoran_serba_ada/screen/category_screen/category_screen_widget/category_result_widget.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void didChangeDependencies() {
    final categoryName = ModalRoute.of(context)?.settings.arguments as String;
    context.read<GetCategoryMealBloc>().add(
          GetCategoryDataEvent(
            category: categoryName,
          ),
        );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)?.settings.arguments as String;
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
                      categoryName: categoryName,
                    );
                  } else if (state is LoadingCategoryResultState) {
                    return const Padding(
                      padding: EdgeInsets.all(
                        56.0,
                      ),
                      child: Center(child: CircularProgressIndicator()),
                    );
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
