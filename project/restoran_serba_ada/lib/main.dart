import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/account_screen/account_screen.dart';
import 'package:restoran_serba_ada/screen/category_screen/bloc/get_category_meal_bloc/get_category_meal_bloc.dart';
import 'package:restoran_serba_ada/screen/category_screen/category_screen.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/get_description_bloc/get_description_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/get_detail_bloc/get_detail_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/update_total_cost_bloc/update_total_cost_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/update_wishlist_data_bloc/update_wishlist_data_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/detail_screen.dart';
import 'package:restoran_serba_ada/screen/history_screen/history_screen.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/category_bloc/category_bloc_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/get_ai_reommendation_bloc/get_ai_recommendation_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/get_login_data_bloc/get_login_data_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/bloc/indicator_show_data_bloc/indicator_show_data_bloc.dart';
import 'package:restoran_serba_ada/screen/home_screen/home_screen.dart';
import 'package:restoran_serba_ada/screen/login_screen/bloc/get_login_data_bloc/get_login_data_bloc.dart';
import 'package:restoran_serba_ada/screen/login_screen/login_screen.dart';
import 'package:restoran_serba_ada/screen/search_screen/bloc/search_result_bloc/search_result_bloc.dart';
import 'package:restoran_serba_ada/screen/search_screen/search_screen.dart';
import 'package:restoran_serba_ada/screen/splash_screen/splash_screen.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/bloc/get_database_bloc/get_database_bloc.dart';
import 'package:restoran_serba_ada/screen/history_screen/bloc/get_database_bloc/get_database_bloc.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/whishlist_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider<IndicatorShowDataBloc>(
          create: (context) => IndicatorShowDataBloc(),
        ),
        BlocProvider<SearchResultBloc>(
          create: (context) => SearchResultBloc(),
        ),
        BlocProvider<GetDetailBloc>(
          create: (context) => GetDetailBloc(),
        ),
        BlocProvider<GetDescriptionBloc>(
          create: (context) => GetDescriptionBloc(),
        ),
        BlocProvider<GetDatabaseBloc>(
          create: (context) => GetDatabaseBloc(),
        ),
        BlocProvider<UpdateWishlistDataBloc>(
          create: (context) => UpdateWishlistDataBloc(),
        ),
        BlocProvider<UpdateTotalCostBloc>(
          create: (context) => UpdateTotalCostBloc(),
        ),
        BlocProvider<GetDatabaseHistoryBloc>(
          create: (context) => GetDatabaseHistoryBloc(),
        ),
        BlocProvider<GetCategoryMealBloc>(
          create: (context) => GetCategoryMealBloc(),
        ),
        BlocProvider<GetAiRecommendationBloc>(
          create: (context) => GetAiRecommendationBloc(),
        ),
        BlocProvider<GetLoginDataBloc>(
          create: (context) => GetLoginDataBloc(),
        ),
        BlocProvider<GetInputLoginDataBloc>(
          create: (context) => GetInputLoginDataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/login': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/category': (_) => const CategoryScreen(),
          '/search': (_) => const SearchScreen(),
          '/detail': (_) => const DetailScreen(),
          '/wishlist': (_) => const WishlistScreen(),
          '/history': (_) => const HistoryScreen(),
          '/account': (_) => const AccountScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
