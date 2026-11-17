import 'package:flutter/material.dart';

import 'screens/accueil.dart';
import 'screens/page_connexion.dart';
import 'screens/page_inscription.dart';
import 'screens/mot_de_passe_oublie.dart';
import 'screens/tableau_de_bord.dart';
import 'screens/statistiques.dart';
import 'screens/activites_a_realiser.dart';
import 'screens/progression.dart';
import 'screens/catalogue.dart';
import 'screens/recherche_filtre.dart';
import 'screens/inscription_formation.dart';
import 'screens/lire_cours.dart';
import 'screens/passer_examen.dart';
import 'screens/resultats.dart';
import 'screens/notifications.dart';
import 'screens/profil.dart';
import 'screens/deconnexion.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F5094),
        ),
      ),

      // Décommente UNE seule ligne à la fois :
      home: const Catalogue(),
      // home: const PageConnexion(),
      // home: const PageInscription(),
      // home: const MotDePasseOublie(),
      // home: const TableauDeBord(),
      // home: const Statistiques(),
      // home: const ActivitesARealiser(),
      // home: const Progression(),
      // home: const Catalogue(),
      // home: const RechercheFiltre(),
      // home: const InscriptionFormation(),
      // home: const LireCours(),
      // home: const PasserExamen(),
      // home: const Resultats(),
      // home: const Notifications(),
      // home: const Profil(),
      // home: const Deconnexion(),
    );
  }
}