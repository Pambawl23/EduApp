import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLaFormation extends StatelessWidget {
  const ModifierLaFormation({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Détails De Formation'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer les modifications', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              StatusBadge('Statut : Publié', Kind.published, icon: Icons.verified),
              Spacer(),
              Text('312 inscrits', style: T.title),
            ]),
            gap8,
            Row(children: const [
              Expanded(child: Text('Dernière synchro : Aujourd\'hui à 09:42', style: T.caption)),
              Tag('v2.4'),
            ]),
          ]),
        ),
        gap16,
        const Eyebrow('Vignette & Couverture'),
        gap8,
        Container(
          height: 150,
          decoration: BoxDecoration(color: C.borderLight, borderRadius: BorderRadius.circular(12)),
          child: Stack(children: [
            const Center(child: Icon(Icons.image_outlined, size: 40, color: C.hint)),
            const Positioned(left: 10, top: 10, child: Tag('16:9 • HD', bg: Colors.white)),
            Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: C.primary, borderRadius: BorderRadius.circular(8)),
                child: Row(children: const [
                  Icon(Icons.photo_camera_outlined, size: 16, color: Colors.white),
                  SizedBox(width: 6),
                  Text('Changer l\'image', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),
                ]),
              ),
            ),
          ]),
        ),
        gap24,
        const Field('Titre de la formation',
            value: 'Développement Web Fullstack',
            counter: '27 / 60',
            suffix: Icon(Icons.cancel, size: 18, color: C.hint)),
        const Field('Description',
            value: 'Maîtrisez React, Node.js, TypeScript et le déploiement cloud pour concevoir des applications web scalables et modernes.',
            lines: 4),
        Row(children: const [
          Icon(Icons.auto_fix_high, size: 16, color: C.primary),
          SizedBox(width: 6),
          Text('Suggestion IA active', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: C.primary)),
          Spacer(),
          Text('109 caractères', style: T.caption),
        ]),
        gap16,
        const Field('Catégorie',
            value: 'Développement Web', prefix: Icons.terminal, suffix: Icon(Icons.expand_more, color: C.meta)),
        const Eyebrow('Niveau de compétence'),
        gap8,
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: C.divider, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            for (final l in const ['Débutant', 'Intermédiaire', 'Avancé'])
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: l == 'Avancé' ? C.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(l,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: l == 'Avancé' ? Colors.white : C.meta)),
                ),
              ),
          ]),
        ),
        gap16,
        Row(children: [
          const Expanded(child: Field('Durée estimée', value: '48 heures (12 modules)', prefix: Icons.schedule)),
        ]),
        AppCard(
          child: Row(children: [
            const Expanded(child: Text('Certifiante', style: T.title)),
            Switch(value: true, onChanged: (_) {}, activeColor: Colors.white, activeTrackColor: C.primary),
          ]),
        ),
        gap16,
        const Eyebrow('Rétention & Clôture'),
        gap8,
        Row(children: const [
          Expanded(child: StatTile(Icons.check_circle_outline, '89.4% succès', 'Taux de complétion moyen')),
          SizedBox(width: 12),
          Expanded(child: StatTile(Icons.schedule, '42h', 'par apprenant')),
        ]),
      ],
    );
  }
}
