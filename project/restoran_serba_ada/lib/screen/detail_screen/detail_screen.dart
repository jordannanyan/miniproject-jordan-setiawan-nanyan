import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_serba_ada/model/search_model.dart';
import 'package:restoran_serba_ada/model/wishlist_model.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/get_description_bloc/get_description_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/get_detail_bloc/get_detail_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/update_total_cost_bloc/update_total_cost_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/bloc/update_wishlist_data_bloc/update_wishlist_data_bloc.dart';
import 'package:restoran_serba_ada/screen/detail_screen/detail_screen_widget/detail_produk_widget.dart';
import 'package:restoran_serba_ada/screen/detail_screen/detail_screen_widget/lokasi_restoran_widget.dart';
import 'package:restoran_serba_ada/screen/theme/theme_color.dart';
import 'package:restoran_serba_ada/screen/theme/theme_text.dart';
import 'package:restoran_serba_ada/screen/whislist_screen/bloc/get_database_bloc/get_database_bloc.dart';
import 'package:restoran_serba_ada/screen/widget/button_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Meal idData;
  int jumlah = 1;
  int harga = 50000;

  void addNumber(int jumlah, BuildContext context) {
    final updateJumlah = BlocProvider.of<UpdateWishlistDataBloc>(context);
    updateJumlah.add(
      GetWishlistDataEvent(
        data: (jumlah + 1),
      ),
    );
  }

  void reduceNumber(int jumlah, BuildContext context) {
    final updateJumlah = BlocProvider.of<UpdateWishlistDataBloc>(context);
    if (jumlah > 1) {
      updateJumlah.add(
        GetWishlistDataEvent(
          data: (jumlah - 1),
        ),
      );
    }
  }

  void addTotalCost(int jumlah, BuildContext context) {
    final updateJumlah = BlocProvider.of<UpdateTotalCostBloc>(context);
    updateJumlah.add(
      GetTotalCostEvent(
        data: (jumlah + harga),
      ),
    );
  }

  void reduceTotalCost(int jumlah, BuildContext context) {
    final updateJumlah = BlocProvider.of<UpdateTotalCostBloc>(context);
    if (jumlah > harga) {
      updateJumlah.add(
        GetTotalCostEvent(
          data: (jumlah - harga),
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access arguments here
    idData = ModalRoute.of(context)?.settings.arguments as Meal;
    // Call the API here
    context.read<GetDetailBloc>().add(
          GetDetailAPIEvent(
            id: idData.idMeal ?? '',
          ),
        );
    context
        .read<GetDescriptionBloc>()
        .add(GetMenuDescriptionAPIEvent(menu: idData.strMeal ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    final wishlistDb = BlocProvider.of<GetDatabaseBloc>(context);
    return Scaffold(
      body:
          BlocBuilder<GetDetailBloc, GetDetailState>(builder: (context, state) {
        if (state is ValueDetailMealState) {
          return Stack(
            children: [
              Image.network(
                state.data[0].strMealThumb ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 24.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: ThemeColor().black,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 240,
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ThemeColor().white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(26),
                                topRight: Radius.circular(26),
                              )),
                          width: double.infinity,
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              BlocBuilder<UpdateTotalCostBloc,
                                  UpdateTotalCostState>(
                                builder: (context, costState) {
                                  if (costState is ValueTotalCostState) {
                                    return BlocBuilder<UpdateWishlistDataBloc,
                                        UpdateWishlistDataState>(
                                      builder: (context, dataState) {
                                        if (dataState
                                            is ValueWishlistCountState) {
                                          return DetailProdukWidget(
                                            namaProduk:
                                                state.data[0].strMeal ?? '',
                                            hargaProduk: costState.data,
                                            jumlah: dataState.data,
                                            addData: () {
                                              addNumber(
                                                  dataState.data, context);
                                              addTotalCost(
                                                  costState.data, context);
                                            },
                                            reduceData: () {
                                              reduceNumber(
                                                  dataState.data, context);
                                              reduceTotalCost(
                                                  costState.data, context);
                                            },
                                          );
                                        } else {
                                          return DetailProdukWidget(
                                            namaProduk:
                                                state.data[0].strMeal ?? '',
                                            hargaProduk: harga,
                                            jumlah: jumlah,
                                            addData: () {
                                              addNumber(jumlah, context);
                                              addTotalCost(harga, context);
                                            },
                                            reduceData: () {
                                              reduceNumber(jumlah, context);
                                              reduceTotalCost(harga, context);
                                            },
                                          );
                                        }
                                      },
                                    );
                                  } else {
                                    return DetailProdukWidget(
                                      namaProduk: state.data[0].strMeal ?? '',
                                      hargaProduk: harga,
                                      jumlah: jumlah,
                                      addData: () {
                                        addNumber(jumlah, context);
                                        addTotalCost(harga, context);
                                      },
                                      reduceData: () {
                                        reduceNumber(jumlah, context);
                                        reduceTotalCost(harga, context);
                                      },
                                    );
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Menu Description',
                                style: ThemeTextStyle().textStyleForthBold,
                              ),
                              BlocBuilder<GetDescriptionBloc,
                                  GetDescriptionState>(
                                builder: (context, descState) {
                                  if (descState is ValueMenuDescriptionState) {
                                    return Text(
                                      descState.desc.choices[0].text,
                                      style: ThemeTextStyle().textStyleFifth,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Restaurant Serba Ada Location',
                                style: ThemeTextStyle().textStyleThird,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const LokasiRestoranWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child:
                        BlocBuilder<UpdateTotalCostBloc, UpdateTotalCostState>(
                      builder: (context, costState) {
                        if (costState is ValueTotalCostState) {
                          return BlocBuilder<UpdateWishlistDataBloc,
                              UpdateWishlistDataState>(
                            builder: (context, dataState) {
                              if (dataState is ValueWishlistCountState) {
                                return ButtonWidget(
                                  textButton: 'Buy',
                                  route: '/wishlist',
                                  onPressed: () {
                                    final WishlistModel wishlistModel =
                                        WishlistModel(
                                      jumlah: dataState.data,
                                      harga: costState.data,
                                      namaMenu: state.data[0].strMeal ?? '',
                                      kategoriMenu:
                                          state.data[0].strCategory ?? '',
                                      fotoMenu:
                                          state.data[0].strMealThumb ?? '',
                                      idMenu: state.data[0].idMeal ?? '',
                                    );
                                    wishlistDb.add(
                                      InsertWishlistEvent(
                                        wishlistModel: wishlistModel,
                                      ),
                                    );
                                    Navigator.of(context)
                                        .pushNamed('/wishlist');
                                  },
                                );
                              } else {
                                return ButtonWidget(
                                  textButton: 'Buy',
                                  route: '/wishlist',
                                  onPressed: () {
                                    final WishlistModel wishlistModel =
                                        WishlistModel(
                                      jumlah: jumlah,
                                      harga: harga,
                                      namaMenu: state.data[0].strMeal ?? '',
                                      kategoriMenu:
                                          state.data[0].strCategory ?? '',
                                      fotoMenu:
                                          state.data[0].strMealThumb ?? '',
                                      idMenu: state.data[0].idMeal ?? '',
                                    );
                                    wishlistDb.add(
                                      InsertWishlistEvent(
                                        wishlistModel: wishlistModel,
                                      ),
                                    );
                                    Navigator.of(context)
                                        .pushNamed('/wishlist');
                                  },
                                );
                              }
                            },
                          );
                        } else {
                          return ButtonWidget(
                            textButton: 'Buy',
                            route: '/wishlist',
                            onPressed: () {
                              final WishlistModel wishlistModel = WishlistModel(
                                jumlah: jumlah,
                                harga: harga,
                                namaMenu: state.data[0].strMeal ?? '',
                                kategoriMenu: state.data[0].strCategory ?? '',
                                fotoMenu: state.data[0].strMealThumb ?? '',
                                idMenu: state.data[0].idMeal ?? '',
                              );
                              wishlistDb.add(
                                InsertWishlistEvent(
                                  wishlistModel: wishlistModel,
                                ),
                              );
                              Navigator.of(context).pushNamed('/wishlist');
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
