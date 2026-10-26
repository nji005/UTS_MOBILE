import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Noto Sans dipilih karena hurufnya bersih, netral, dan tetap jelas dibaca di layar HP yang kecil.
// Cocok untuk nama menu dan harga yang perlu dibaca cepat saat antre di kantin.
// Ukuran, ketebalan, dan warna dibuat sebagai parameter agar satu widget bisa dipakai di semua teks.
class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;
  final TextAlign? align;

  const AppText(
      this.text, {
        super.key,
        this.size = 14,
        this.weight = FontWeight.w400,
        this.color,
        this.align,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.notoSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}