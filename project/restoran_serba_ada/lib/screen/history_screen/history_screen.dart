import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/screen/history_screen/history_screen_widget/history_button_widget.dart';
import 'package:restoran_serba_ada/screen/history_screen/history_screen_widget/history_list_widget.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/history_screen/bloc/get_database_bloc/get_database_bloc.dart';
import 'package:restoran_serba_ada/screen/widget/appbar_widget.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<GetDatabaseHistoryBloc>().add(GetAllHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(appbarText: 'Order History'),
      body: Padding(
        padding: const EdgeInsets.all(
          18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your History',
                  style: ThemeTextStyle().textStyleSecond,
                ),
                BlocBuilder<GetDatabaseHistoryBloc, GetDatabaseState>(
                  builder: (context, state) {
                    if (state is ValueAllHistoryState &&
                        state.historyModel.isNotEmpty) {
                      return HistoryButtonWidget(
                        text: 'Clear History',
                        onPressed: () {
                          for (var element in state.historyModel) {
                            BlocProvider.of<GetDatabaseHistoryBloc>(context)
                                .add(
                              DeleteHistoryByIdEvent(
                                id: element.idMenu,
                              ),
                            );
                          }
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<GetDatabaseHistoryBloc, GetDatabaseState>(
              builder: (context, state) {
                if (state is ValueAllHistoryState) {
                  return HistoryListWidget(
                    listData: state.historyModel,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
