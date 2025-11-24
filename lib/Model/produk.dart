import 'package:flutter/material.dart';

class Produk {
  String nama;
  int harga;
  String gambar;
  Produk(this.nama, {this.harga = 100000, this.gambar = "https://via.placeholder.com/150"});
}

class Keranjang extends ChangeNotifier {
  
  List<Produk> Produks = [
    Produk('Laptop', harga: 5000000),
    Produk('Monitor', harga: 1500000),
    Produk('Keyboard', harga: 250000),
    Produk('Mouse', harga: 150000),
  ];

  List<Produk> _item = [];
  List<Produk> get item => _item;

  void tambahProduk(Produk produk) {
    _item.add(produk);
    notifyListeners();
  }

  void hapusProduk(Produk produk) {
    _item.remove(produk);
    notifyListeners();
  }

  int get totalHarga => _item.fold(0, (total, p) => total + p.harga);

  void clear() {
    _item.clear();
    notifyListeners();
  }
}