import 'package:flutter/material.dart';
import 'package:restoran_serba_ada/theme/theme_color.dart';
import 'package:restoran_serba_ada/theme/theme_text.dart';

class DetailProdukWidget extends StatelessWidget {
  final String namaProduk;
  final int hargaProduk;
  final int jumlah;
  final Function()? addData;
  final Function()? reduceData;
  const DetailProdukWidget({
    super.key,
    required this.namaProduk,
    required this.hargaProduk,
    required this.jumlah,
    this.addData,
    this.reduceData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: Text(
                namaProduk,
                style: ThemeTextStyle().textStyleSecondBold,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Text(
              hargaProduk.toString(),
              style: ThemeTextStyle().textStyleForthBoldRed,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: reduceData,
              icon: Icon(
                Icons.remove_circle,
                color: ThemeColor().lightRed,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              jumlah.toString(),
              style: ThemeTextStyle().textStyleSecondBold,
            ),
            const SizedBox(
              width: 4,
            ),
            IconButton(
              onPressed: addData,
              icon: Icon(
                Icons.add_circle,
                color: ThemeColor().lightRed,
                size: 30,
              ),
            ),
          ],
        )
      ],
    );
  }
}
