import 'package:flutter/material.dart';

/// Couleurs du design system « EduApp Admin » (Stitch).
class C {
  static const primary = Color(0xFF364F8E);
  static const primaryPressed = Color(0xFF2B3F73);
  static const primarySoft = Color(0xFFEEF2FF);
  static const bg = Color(0xFFF5F7FB);
  static const card = Colors.white;
  static const border = Color(0xFFCBD5E1);
  static const borderLight = Color(0xFFE2E8F0);
  static const divider = Color(0xFFF1F5F9);
  static const heading = Color(0xFF0F172A);
  static const body = Color(0xFF334155);
  static const meta = Color(0xFF64748B);
  static const hint = Color(0xFF94A3B8);
  static const danger = Color(0xFFDC2626);
  static const dangerDark = Color(0xFFB91C1C);
  static const dangerSoft = Color(0xFFFEE2E2);
  static const success = Color(0xFF059669);
  static const successSoft = Color(0xFFECFDF5);
  static const successBorder = Color(0xFFA7F3D0);
  static const warning = Color(0xFFD97706);
  static const warningSoft = Color(0xFFFFF7ED);
  static const warningBorder = Color(0xFFFED7AA);
  static const info = Color(0xFF2563EB);
  static const infoSoft = Color(0xFFEFF6FF);
  static const infoBorder = Color(0xFFBFDBFE);
}

/// Styles de texte (police Inter si elle est disponible, sinon police système).
class T {
  static const h1 = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: C.heading, height: 1.25);
  static const h2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: C.heading, height: 1.3);
  static const h3 = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: C.heading, height: 1.3);
  static const title = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: C.heading);
  static const body = TextStyle(fontSize: 14, color: C.body, height: 1.45);
  static const bodySm = TextStyle(fontSize: 13, color: C.body, height: 1.4);
  static const caption = TextStyle(fontSize: 12, color: C.meta, height: 1.35);
  static const label = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: C.body);
  static const eyebrow = TextStyle(
      fontSize: 11, fontWeight: FontWeight.w700, color: C.meta, letterSpacing: 0.66);
  static const button = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
}

ThemeData buildTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: C.bg,
      colorScheme: ColorScheme.fromSeed(seedColor: C.primary, primary: C.primary),
      appBarTheme: const AppBarTheme(
        backgroundColor: C.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        titleTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
