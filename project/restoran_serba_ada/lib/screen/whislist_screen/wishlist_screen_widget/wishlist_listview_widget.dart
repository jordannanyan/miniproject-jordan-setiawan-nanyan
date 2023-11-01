import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/model/wishlist_model.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/bloc/get_database_bloc/get_database_bloc.dart';

class WishlistListviewWidget extends StatelessWidget {
  final List<WishlistModel> data;
  const WishlistListviewWidget({
    super.key,
    required this.data,
  });

  void addNumber(int index, int jumlah, int cost, BuildContext context) {
    cost = (cost + (cost / jumlah)).toInt();
    jumlah = jumlah + 1;
    BlocProvider.of<GetDatabaseBloc>(context).add(
      UpdateWishlistEvent(
        wishlistModel: WishlistModel(
          jumlah: jumlah,
          harga: cost,
          namaMenu: data[index].namaMenu,
          kategoriMenu: data[index].kategoriMenu,
          fotoMenu: data[index].fotoMenu,
          idMenu: data[index].idMenu,
        ),
      ),
    );
  }

  void reduceNumber(int index, int jumlah, int cost, BuildContext context) {
    if (jumlah > 1) {
      cost = (cost - (cost / jumlah)).toInt();
      jumlah = jumlah - 1;
      BlocProvider.of<GetDatabaseBloc>(context).add(
        UpdateWishlistEvent(
          wishlistModel: WishlistModel(
            jumlah: jumlah,
            harga: cost,
            namaMenu: data[index].namaMenu,
            kategoriMenu: data[index].kategoriMenu,
            fotoMenu: data[index].fotoMenu,
            idMenu: data[index].idMenu,
          ),
        ),
      );
    } else {
      BlocProvider.of<GetDatabaseBloc>(context)
          .add(DeleteWishlistByIdEvent(id: data[index].idMenu));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return BlocBuilder<GetDatabaseBloc, GetDatabaseState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Container(
                        width: 125,
                        height: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data[index].fotoMenu),
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
                              data[index].namaMenu,
                              style: ThemeTextStyle().textStyleSecondBold,
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
                              data[index].harga.toString(),
                              style: ThemeTextStyle().textStyleForthBold,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: ThemeColor().lightRed,
                                  ),
                                  onPressed: () {
                                    reduceNumber(index, data[index].jumlah,
                                        data[index].harga, context);
                                  },
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  data[index].jumlah.toString(),
                                  style: ThemeTextStyle().textStyleForthBold,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: ThemeColor().lightRed,
                                  ),
                                  onPressed: () {
                                    addNumber(index, data[index].jumlah,
                                        data[index].harga, context);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
