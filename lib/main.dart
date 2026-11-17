import 'package:flutter/material.dart';
//import 'screens/accueil.dart';
//import 'screens/page_connexion.dart';
//import 'screens/index_ecrans.dart';
import 'screens/apercu_du_cours.dart';
//import 'screens/nouvel_utilisateur.dart';

void main() => runApp(const EduApp());

class EduApp extends StatelessWidget {
  const EduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F5094)),
      ),
      // Pour voir l'écran de connexion : remplacer par PageConnexion()
      home: const ApercuDuCours(),
    );
  }
}