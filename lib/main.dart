import 'screens/gestion_des_cours.dart';
import 'screens/gestion_des_cat_gories.dart';
import 'screens/gestion_des_formations.dart';
import 'screens/gestion_des_utilisateurs.dart';
import 'screens/gestion_des_examens.dart';
import 'screens/historique_des_notifications.dart';
import 'screens/statistiques_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/page_connexion.dart';
import 'screens/tableau_de_bord.dart';
import 'screens/catalogue.dart';
import 'screens/notifications.dart';
import 'screens/profil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EduApp(),
    ),
  );
}

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F5094),
        ),
      ),
      home: const PageConnexion(),
      routes: {
        '/accueil': (context) => const TableauDeBord(),
        '/catalogue': (context) => const Catalogue(),
        '/notifications': (context) => const Notifications(),
        '/profil': (context) => const Profil(),
        '/admin/accueil': (context) => const StatistiquesPerformance(),
        '/admin/formations': (context) => const GestionDesFormations(),
        '/admin/utilisateurs': (context) => const GestionDesUtilisateurs(),
        '/admin/examens': (context) => const GestionDesExamens(),
        '/admin/notifications': (context) => const HistoriqueDesNotifications(),
        '/admin/cours': (context) => const GestionDesCours(),
        '/admin/categories': (context) => const GestionDesCategories(),
        '/admin/statistiques': (context) => const StatistiquesPerformance(),
      },
    );
  }
}
