import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/model/history_model.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryModel> listData;
  const HistoryListWidget({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColor().grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Container(
                      width: 125,
                      height: 110,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(listData[index].fotoMenu),
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
                          Text(
                            listData[index].namaMenu,
                            style: ThemeTextStyle().textStyleSecond,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            listData[index].harga.toString(),
                            style: ThemeTextStyle().textStyleForth,
                          ),
                          Row(
                            children: [
                              Text(
                                'x',
                                style: ThemeTextStyle().textStyleForthGrey,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                listData[index].jumlah.toString(),
                                style: ThemeTextStyle().textStyleForthGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
