import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/model/helper/database_helper.dart';
import 'package:restoran_serba_ada/model/history_model.dart';
import 'package:restoran_serba_ada/model/wishlist_model.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/bloc/get_database_bloc/get_database_bloc.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/wishlist_screen_widget/total_price_widget.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/wishlist_screen_widget/wishlist_listview_widget.dart';
import 'package:restoran_serba_ada/screen/widget/appbar_widget.dart';
import 'package:restoran_serba_ada/screen/widget/bottom_navigation_bar_widget.dart';
import 'package:restoran_serba_ada/screen/widget/button_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    context.read<GetDatabaseBloc>().add(GetAllWishlistEvent());
    super.initState();
  }

  void deleteAllWishlist(List<WishlistModel> data) {
    for (var element in data) {
      BlocProvider.of<GetDatabaseBloc>(context)
          .add(DeleteWishlistByIdEvent(id: element.idMenu));
    }
    Navigator.pushNamed(context, '/history');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(appbarText: 'Wishlist'),
      body: Padding(
        padding: const EdgeInsets.all(
          18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Your Wishlist",
              style: ThemeTextStyle().textStyleSecond,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<GetDatabaseBloc, GetDatabaseState>(
              builder: (context, state) {
                if (state is ValueAllWishlistState) {
                  return WishlistListviewWidget(data: state.wishlistModel);
                } else if (state is ValueUpdateWishlistState) {
                  return WishlistListviewWidget(data: state.wishlistModel);
                } else if (state is ValueDeleteWishlistState) {
                  return WishlistListviewWidget(data: state.wishlistModel);
                } else {
                  return const Center(
                    child: Text('Wishlist Kosng'),
                  );
                }
              },
            ),
            const SizedBox(
              height: 14,
            ),
            BlocBuilder<GetDatabaseBloc, GetDatabaseState>(
              builder: (context, state) {
                int totalPrice;
                if (state is ValueAllWishlistState) {
                  totalPrice = state.wishlistModel.fold(0, (total, element) {
                    return total + element.harga;
                  });
                  return TotalPriceWidget(price: totalPrice);
                } else if (state is ValueUpdateWishlistState) {
                  totalPrice = state.wishlistModel.fold(0, (total, element) {
                    return total + element.harga;
                  });
                  return TotalPriceWidget(price: totalPrice);
                } else if (state is ValueDeleteWishlistState) {
                  totalPrice = state.wishlistModel.fold(0, (total, element) {
                    return total + element.harga;
                  });
                  return TotalPriceWidget(price: totalPrice);
                } else {
                  return const Center(child: TotalPriceWidget(price: 0));
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<GetDatabaseBloc, GetDatabaseState>(
              builder: (context, state) {
                if (state is ValueAllWishlistState &&
                    state.wishlistModel.isNotEmpty) {
                  return ButtonWidget(
                    textButton: 'Finish Transaction',
                    route: '/home',
                    onPressed: () async {
                      for (var element in state.wishlistModel) {
                        await DatabaseHelper().insertHistory(
                          HistoryModel(
                            jumlah: element.jumlah,
                            harga: element.harga,
                            namaMenu: element.namaMenu,
                            kategoriMenu: element.kategoriMenu,
                            fotoMenu: element.fotoMenu,
                            idMenu: element.idMenu,
                          ),
                        );
                      }
                      deleteAllWishlist(state.wishlistModel);
                    },
                  );
                } else if (state is ValueUpdateWishlistState &&
                    state.wishlistModel.isNotEmpty) {
                  return ButtonWidget(
                    textButton: 'Finish Transaction',
                    route: '/home',
                    onPressed: () async {
                      for (var element in state.wishlistModel) {
                        await DatabaseHelper().insertHistory(
                          HistoryModel(
                            jumlah: element.jumlah,
                            harga: element.harga,
                            namaMenu: element.namaMenu,
                            kategoriMenu: element.kategoriMenu,
                            fotoMenu: element.fotoMenu,
                            idMenu: element.idMenu,
                          ),
                        );
                      }
                      deleteAllWishlist(state.wishlistModel);
                    },
                  );
                } else if (state is ValueDeleteWishlistState &&
                    state.wishlistModel.isNotEmpty) {
                  return ButtonWidget(
                    textButton: 'Finish Transaction',
                    route: '/home',
                    onPressed: () async {
                      for (var element in state.wishlistModel) {
                        await DatabaseHelper().insertHistory(
                          HistoryModel(
                            jumlah: element.jumlah,
                            harga: element.harga,
                            namaMenu: element.namaMenu,
                            kategoriMenu: element.kategoriMenu,
                            fotoMenu: element.fotoMenu,
                            idMenu: element.idMenu,
                          ),
                        );
                      }
                      deleteAllWishlist(state.wishlistModel);
                    },
                  );
                } else {
                  return const ButtonWidget(
                    textButton: 'Finish Transaction',
                    route: '/home',
                  );
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
