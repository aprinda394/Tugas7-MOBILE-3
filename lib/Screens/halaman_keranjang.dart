import 'package:flutter/material.dart';
import 'package:pertemuan7/Model/produk.dart';
import 'package:pertemuan7/Screens/halaman_produk.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  @override
  Widget build(BuildContext context) {
    final keranjang = context.watch<Keranjang>();
    final items = keranjang.item;

    final formatHarga = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('Keranjang'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: items.isEmpty
          ? const Center(child: Text("Keranjang masih kosong"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final produk = items[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(produk.gambar),
                  ),
                  title: Text(produk.nama),
                  subtitle: Text(formatHarga.format(produk.harga)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      keranjang.hapusProduk(produk);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${produk.nama} dihapus dari keranjang")),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.amberAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: ${formatHarga.format(keranjang.totalHarga)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: items.isEmpty
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Checkout berhasil!")),
                      );
                      keranjang.clear();
                    },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Checkout"),
            )
          ],
        ),
      ),
    );
  }
}