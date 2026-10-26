import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_text.dart';
import 'add_menu_page.dart';
import 'menu_detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  final List<Map<String, dynamic>> _menus = [
    {'nama': 'Nasi Goreng Kampung', 'harga': 15000},
    {'nama': 'Mie Ayam Bakso', 'harga': 13000},
    {'nama': 'Soto Betawi', 'harga': 18000},
    {'nama': 'Pisang Goreng Keju', 'harga': 8000},
    {'nama': 'Es Teh Manis', 'harga': 4000},
  ];

  // Mengubah angka menjadi format Rupiah, contoh: 15000 -> "Rp 15.000"
  String _formatRupiah(int harga) {
    final angka = harga.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < angka.length; i++) {
      if (i > 0 && (angka.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(angka[i]);
    }
    return 'Rp $buffer';
  }

  Future<void> _bukaHalamanTambah() async {
    final hasil = await Get.to(() => const AddMenuPage());
    if (hasil != null && hasil is Map<String, dynamic>) {
      setState(() {
        _menus.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Kantin Kampus',
          size: 20,
          weight: FontWeight.w700,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: AppText(
              'Daftar Menu Hari Ini (${_menus.length})',
              size: 16,
              weight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _menus.length,
              itemBuilder: (context, index) {
                final String nama = _menus[index]['nama'] as String;
                final String harga =
                _formatRupiah(_menus[index]['harga'] as int);

                return Card(
                  color: Colors.white,
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    onTap: () => Get.to(
                          () => MenuDetailPage(nama: nama, harga: harga),
                    ),
                    leading: Icon(
                      Icons.ramen_dining,
                      color: warna.primary,
                    ),
                    title: AppText(
                      nama,
                      size: 15,
                      weight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    subtitle: AppText(
                      harga,
                      size: 13,
                      color: Colors.black54,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: warna.primary,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaHalamanTambah,
        child: const Icon(Icons.playlist_add),
      ),
    );
  }
}