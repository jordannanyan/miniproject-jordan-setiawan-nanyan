import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/category_bloc/category_bloc_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/get_ai_reommendation_bloc/get_ai_recommendation_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/get_login_data_bloc/get_login_data_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/indicator_show_data_bloc/indicator_show_data_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/home_screen_widget/kategori_widget.dart';
import 'package:restoran_serba_ada/screen/home_screen/home_screen_widget/rekomendasi_widget.dart';
import 'package:restoran_serba_ada/screen/home_screen/home_screen_widget/show_more_button_widget.dart';
import 'package:restoran_serba_ada/screen/home_screen/home_screen_widget/welcome_widget.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences logindata;

  void getLoginData() async {
    logindata = await SharedPreferences.getInstance();
    executeBloc(logindata.getString('username').toString());
  }

  void executeBloc(String data) {
    context.read<GetLoginDataBloc>().add(GetUsernameEvent(data: data));
  }

  @override
  void initState() {
    getLoginData();
    context
        .read<IndicatorShowDataBloc>()
        .add(const ChangeIndicatorShowDataEvent(data: false));
    context.read<CategoryBloc>().add(GetCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indicatorData = BlocProvider.of<IndicatorShowDataBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 34,
              ),
              BlocBuilder<GetLoginDataBloc, GetLoginDataState>(
                builder: (context, state) {
                  if (state is ValueUsernameState) {
                    String username = state.dataUsername;
                    String sentence = 'Hello, $username';
                    return WelcomeWidget(
                      name: sentence,
                      onTap: () {
                        logindata.setBool('login', true);
                        logindata.remove('username');
                        logindata.remove('password');
                        Navigator.of(context).popAndPushNamed('/');
                      },
                    );
                  } else {
                    return const WelcomeWidget(
                      name: 'Hello, User',
                    );
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                child: Image.asset(
                  'assets/banner.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Category',
                style: ThemeTextStyle().textStyleSecond,
              ),
              BlocBuilder<IndicatorShowDataBloc, IndicatorShowDataState>(
                builder: (context, categoryState) {
                  if (categoryState is ValueIndicatorShowDataState) {
                    return BlocBuilder<CategoryBloc, CategoryBlocState>(
                      builder: (context, state) {
                        if (state is ValueCategoryState) {
                          return Column(
                            children: [
                              KategoriWidget(
                                dataCategory: state.categoryData,
                                showMore: categoryState.data,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ShowMoreButtonWidget(
                                onPress: () {
                                  indicatorData.add(
                                    ChangeIndicatorShowDataEvent(
                                      data: !categoryState.data,
                                    ),
                                  );
                                },
                                data: categoryState.data,
                              ),
                            ],
                          );
                        } else if (state is LoadingDataState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'Data Kosong',
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Data Kosong'),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'Ask AI Recommendation',
                style: ThemeTextStyle().textStyleSecond,
              ),
              BlocBuilder<GetAiRecommendationBloc, GetAiRecommendationState>(
                builder: (context, state) {
                  if (state is ValueAIRecommendationState) {
                    return RekomendasiWidget(
                      recommendation: state.data.choices[0].text,
                    );
                  } else if (state is LoadingRecommendationState) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return const RekomendasiWidget(
                      recommendation: 'No Data Still',
                    );
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
