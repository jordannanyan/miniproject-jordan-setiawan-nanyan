import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/search_screen/bloc/search_result_bloc/search_result_bloc.dart';
import 'package:restoran_serba_ada/screen/search_screen/search_sreen_widget/button_search_widget.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';
import 'package:restoran_serba_ada/screen/search_screen/search_sreen_widget/search_result_widget.dart';
import 'package:restoran_serba_ada/screen/widget/text_field_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<SearchResultBloc>().add(EmptySearchResultEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SearchResultBloc inputSearch =
        BlocProvider.of<SearchResultBloc>(context);
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
              TextFieldWidget(
                hintText: 'Enter Search',
                errorMessage: '',
                dataController: searchTextController,
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonSearchWidget(
                onPress: () {
                  inputSearch.add(GetSearchResultEvent(
                    searchText: searchTextController.text,
                  ));
                  searchTextController.clear();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Search Result',
                style: ThemeTextStyle().textStyleSecond,
              ),
              BlocBuilder<SearchResultBloc, SearchResultState>(
                builder: (context, state) {
                  if (state is ValueSearchResultState) {
                    return SearchResultWidget(
                      searchResult: state.data,
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
