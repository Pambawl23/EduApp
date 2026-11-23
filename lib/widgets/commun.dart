import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';

/// Couleurs de EduApp (les mêmes que accueil.dart et page_connexion.dart).
class Couleurs {
  static const Color primary = Color(0xFF2F5094);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textGrey = Color(0xFF64748B);
  static const Color hintGrey = Color(0xFF94A3B8);
  static const Color border = Color(0xFFC3CFE2);
  static const Color placeholderBg = Color(0xFFE2E8F0);
  static const Color primaryClair = Color(0xFFE8EEF8);
  static const Color succes = Color(0xFF16A34A);
  static const Color alerte = Color(0xFFDC2626);
  static const Color attention = Color(0xFFD97706);
}

/// AppBar bleue commune à tous les écrans.
AppBar barreEcran(String titre) {
  return AppBar(
    backgroundColor: Couleurs.primary,
    foregroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    title: Text(
      titre,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ),
  );
}

/// Petit libellé au-dessus d'un champ.
class EtiquetteChamp extends StatelessWidget {
  final String text;
  const EtiquetteChamp(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Couleurs.textGrey,
        letterSpacing: 0.3,
      ),
    );
  }
}

/// Champ statique (visuel uniquement, pas de saisie).
class ChampStatique extends StatelessWidget {
  final String text;
  final bool isHint;
  final IconData? icone;
  const ChampStatique({
    super.key,
    required this.text,
    this.isHint = false,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Couleurs.border),
      ),
      child: Row(
        children: [
          if (icone != null) ...[
            Icon(icone, size: 20, color: Couleurs.hintGrey),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: isHint ? Couleurs.hintGrey : Couleurs.textGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bouton plein bleu.
class BoutonPrimaire extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const BoutonPrimaire(this.label, {this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Couleurs.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

/// Bouton blanc avec bordure bleue.
class BoutonContour extends StatelessWidget {
  final String label;
  final Color couleur;
  final VoidCallback? onPressed;
  const BoutonContour(this.label,
      {super.key, this.couleur = Couleurs.primary, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: couleur,
          backgroundColor: Colors.white,
          side: BorderSide(color: couleur, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

/// Carte blanche à coins arrondis.
class Carte extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const Carte({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: child,
    );
  }
}

/// Titre de section.
class TitreSection extends StatelessWidget {
  final String text;
  const TitreSection(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Couleurs.textDark,
      ),
    );
  }
}

/// Barre de progression (valeur entre 0 et 1).
class BarreProgression extends StatelessWidget {
  final double valeur;
  const BarreProgression(this.valeur, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: valeur,
        minHeight: 8,
        backgroundColor: Couleurs.placeholderBg,
        color: Couleurs.primary,
      ),
    );
  }
}

/// Petite étiquette colorée (ex : Réussi, Cours, Examen).
class Pastille extends StatelessWidget {
  final String text;
  final Color couleur;
  const Pastille(this.text, {super.key, this.couleur = Couleurs.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Color.alphaBlend(couleur.withAlpha(30), Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: couleur,
        ),
      ),
    );
  }
}

/// Tuile de statistique (grand chiffre + libellé).
class TuileStat extends StatelessWidget {
  final String valeur;
  final String libelle;
  const TuileStat({super.key, required this.valeur, required this.libelle});

  @override
  Widget build(BuildContext context) {
    return Carte(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: [
          Text(
            valeur,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Couleurs.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            libelle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Couleurs.textGrey),
          ),
        ],
      ),
    );
  }
}

/// Ligne d'activité à réaliser (cours ou examen).
class LigneActivite extends StatelessWidget {
  final String titre;
  final String formation;
  final String echeance;
  final bool estExamen;
  const LigneActivite({
    super.key,
    required this.titre,
    required this.formation,
    required this.echeance,
    this.estExamen = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.push(
        estExamen ? AppRoutes.takeExam : AppRoutes.coursePreview,
      ),
      child: Carte(
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Couleurs.primaryClair,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                estExamen ? Icons.quiz_outlined : Icons.menu_book_outlined,
                color: Couleurs.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Couleurs.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$formation • $echeance',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Couleurs.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Pastille(
              estExamen ? 'Examen' : 'Cours',
              couleur: estExamen ? Couleurs.attention : Couleurs.primary,
            ),
          ],
        ),
      ),
    );
  }
}

/// Zone d'image (placeholder).
class ImagePlaceholder extends StatelessWidget {
  final double hauteur;
  const ImagePlaceholder({super.key, this.hauteur = 140});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hauteur,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Couleurs.placeholderBg.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.image_outlined,
        size: 30,
        color: Couleurs.textGrey,
      ),
    );
  }
}


/// Barre de navigation fonctionnelle de l'apprenant.
class BarreNavigation extends StatelessWidget {
  final int index;

  const BarreNavigation({super.key, required this.index});

  static const List<String> routes = [
    AppRoutes.learnerDashboard,
    AppRoutes.catalogue,
    AppRoutes.notifications,
    AppRoutes.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (nouvelIndex) {
        if (nouvelIndex == index) return;

        context.go(routes[nouvelIndex]);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Couleurs.primary,
      unselectedItemColor: Couleurs.hintGrey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'Catalogue',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    );
  }
}
