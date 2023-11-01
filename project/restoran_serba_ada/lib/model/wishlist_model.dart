class WishlistModel {
  late String idMenu;
  late String namaMenu;
  late String kategoriMenu;
  late String fotoMenu;
  late int jumlah;
  late int harga;

  WishlistModel({
    required this.jumlah,
    required this.harga,
    required this.namaMenu,
    required this.kategoriMenu,
    required this.fotoMenu,
    required this.idMenu,
  });

  Map<String, dynamic> toMap() {
    return {
      'idMenu': idMenu,
      'namaMenu': namaMenu,
      'kategoriMenu': kategoriMenu,
      'fotoMenu': fotoMenu,
      'harga': harga,
      'jumlah': jumlah
    };
  }

  WishlistModel.fromMap(Map<String, dynamic> map) {
    idMenu = map['idMenu'];
    namaMenu = map['namaMenu'];
    kategoriMenu = map['kategoriMenu'];
    fotoMenu = map['fotoMenu'];
    harga = map['harga'];
    jumlah = map['jumlah'];
  }
}
