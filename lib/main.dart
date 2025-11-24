import 'package:flutter/material.dart';
import 'package:pertemuan7/Screens/halaman_produk.dart';
import 'package:provider/provider.dart';
import 'package:pertemuan7/Model/produk.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Keranjang(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HalamanProduk(),
    );
  }
}