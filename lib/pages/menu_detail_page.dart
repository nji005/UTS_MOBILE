import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_text.dart';

class MenuDetailPage extends StatelessWidget {
  final String nama;
  final String harga;

  const MenuDetailPage({
    super.key,
    required this.nama,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Detail Menu',
          size: 20,
          weight: FontWeight.w700,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.fastfood, size: 80, color: warna.primary),
              const SizedBox(height: 16),
              AppText(
                nama,
                size: 24,
                weight: FontWeight.w700,
                color: Colors.black87,
                align: TextAlign.center,
              ),
              const SizedBox(height: 8),
              AppText(
                harga,
                size: 20,
                weight: FontWeight.w500,
                color: warna.primary,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
                label: const AppText(
                  'Kembali ke Daftar',
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}