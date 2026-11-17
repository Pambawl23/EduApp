import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ApercuDuCours extends StatelessWidget {
  const ApercuDuCours({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Aperçu Du Cours'),
      bottom: Row(children: const [
        Expanded(child: AppButton.secondary('Précédent', icon: Icons.arrow_back)),
        SizedBox(width: 10),
        Expanded(child: AppButton('Suivant', icon: Icons.arrow_forward)),
      ]),
      children: [
        const InfoBanner('Vue simulée pour validation pédagogique',
            icon: Icons.visibility_outlined, title: 'Mode Apprenant Actif'),
        Row(children: const [
          Tag('APERÇU'),
          SizedBox(width: 8),
          Icon(Icons.school_outlined, size: 16, color: C.meta),
          SizedBox(width: 4),
          Expanded(child: Text('Développement Web Fullstack • Module 1 / Leçon 3', style: T.caption)),
        ]),
        gap8,
        const Text('Les types fondamentaux et interfaces TypeScript', style: T.h1),
        gap12,
        Wrap(spacing: 12, runSpacing: 6, children: const [
          Text('▶ Vidéo HD', style: T.caption),
          Text('⏱ 45 min', style: T.caption),
          Text('✔ 312 validations', style: T.caption),
        ]),
        gap16,
        // Lecteur vidéo
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 200,
            color: C.heading,
            child: Stack(children: [
              const Positioned(left: 12, top: 10, child: Eyebrow('Aperçu lecteur', color: Colors.white70)),
              const Positioned(right: 12, top: 8, child: Tag('1080P HD', bg: Colors.white24, fg: Colors.white)),
              const Center(child: Icon(Icons.play_circle_fill, size: 56, color: Colors.white)),
              Positioned(
                left: 12,
                right: 12,
                bottom: 10,
                child: Column(children: [
                  const ProgressBar(0.32, color: Colors.white, height: 4),
                  const SizedBox(height: 8),
                  Row(children: const [
                    Icon(Icons.pause, size: 18, color: Colors.white),
                    SizedBox(width: 8),
                    Icon(Icons.volume_up_outlined, size: 18, color: Colors.white),
                    SizedBox(width: 8),
                    Text('14:20 / 45:00', style: TextStyle(fontSize: 11, color: Colors.white)),
                    Spacer(),
                    Text('1.25x', style: TextStyle(fontSize: 11, color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.closed_caption_outlined, size: 18, color: Colors.white),
                    SizedBox(width: 8),
                    Icon(Icons.fullscreen, size: 18, color: Colors.white),
                  ]),
                ]),
              ),
            ]),
          ),
        ),
        gap16,
        const FilterRow(['Contenu & Notes', 'Ressources (2)', 'Quiz de validation']),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.menu_book_outlined, size: 20, color: C.primary),
              SizedBox(width: 8),
              Expanded(child: Text('Support de cours & Notes', style: T.h3)),
            ]),
            const SizedBox(height: 4),
            const Text('Notions indispensables abordées dans cette session', style: T.caption),
            gap16,
            const _Note('Types Aliases vs Interfaces',
                'Privilégiez les interface pour modéliser des contrats d\'objets extensibles et les type pour les unions, intersections ou tuples complexes.'),
            gap12,
            const _Note('Introduction aux Types Génériques',
                'Comprendre l\'opérateur générique <T> pour concevoir des composants logiciels réutilisables tout en garantissant un contrôle strict à la compilation.'),
          ]),
        ),
        gap16,
        const SectionTitle('Ressources téléchargeables', action: '1 fichier'),
        const AdminRow(
          leading: IconBox(Icons.picture_as_pdf_outlined, bg: C.dangerSoft, fg: C.danger),
          title: 'Aide-mémoire-TS-cheat-sheet.pdf',
          subtitle: 'Document de synthèse • 1.4 Mo',
          trailing: Icon(Icons.download, color: C.primary),
        ),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.terminal, size: 18, color: C.primary),
              SizedBox(width: 8),
              Expanded(child: Eyebrow('Exercice pratique validant')),
              StatusBadge('À compléter', Kind.scheduled),
            ]),
            gap8,
            const Text('Refactorisation de l\'API de commande', style: T.h3),
            gap8,
            const Text('Déclarez l\'ensemble des types de réponse HTTP pour sécuriser les mutations client. Temps estimé : 20 min.', style: T.bodySm),
            gap12,
            Row(children: const [
              Icon(Icons.hourglass_top, size: 14, color: C.meta),
              SizedBox(width: 4),
              Expanded(child: Text('3 tentatives restantes', style: T.caption)),
              Text('Ouvrir le bac à sable', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
              Icon(Icons.chevron_right, size: 18, color: C.primary),
            ]),
          ]),
        ),
        gap16,
        const Text('Précédent : Bonnes pratiques', style: T.caption),
      ],
    );
  }
}

class _Note extends StatelessWidget {
  final String title;
  final String text;
  const _Note(this.title, this.text);
  @override
  Widget build(BuildContext context) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Icon(Icons.check_circle, size: 18, color: C.success),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: T.title),
            const SizedBox(height: 2),
            Text(text, style: T.bodySm),
          ]),
        ),
      ]);
}
