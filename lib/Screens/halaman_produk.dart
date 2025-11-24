import 'package:flutter/material.dart';
import 'package:pertemuan7/Model/produk.dart';
import 'package:pertemuan7/Screens/halaman_keranjang.dart';
import 'package:provider/provider.dart';

class HalamanProduk extends StatelessWidget {
  const HalamanProduk({super.key});

  @override
  Widget build(BuildContext context) {
    final Produks = context.watch<Keranjang>().Produks;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Katalog Produk'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HalamanKeranjang()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: Produks.length,
        itemBuilder: (context, index) {
          final item = Produks[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.gambar),
              ),
              title: Text(item.nama),
              subtitle: Text("Rp ${item.harga}"),
              trailing: IconButton(
                onPressed: () {
                  context.read<Keranjang>().tambahProduk(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item.nama} ditambahkan ke keranjang")),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}