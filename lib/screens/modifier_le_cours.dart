import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLeCours extends StatelessWidget {
  const ModifierLeCours({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Modifier Le Cours'),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer les modifications', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        const InfoBanner('Le cours #CRS-TS-03 a été mis à jour.',
            icon: Icons.verified, kind: Kind.published, title: 'Modifications enregistrées !'),
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              IconBox(Icons.menu_book_outlined),
              SizedBox(width: 10),
              Expanded(child: Text('#CRS-TS-03', style: T.title)),
              StatusBadge('Publié', Kind.published),
            ]),
            gap12,
            const Eyebrow('Formation rattachée'),
            const Text('Développement Web Fullstack', style: T.h3),
            gap8,
            Row(children: const [
              Icon(Icons.schedule, size: 14, color: C.meta),
              SizedBox(width: 4),
              Text('Modifié le 14 Mai à 16:30', style: T.caption),
            ]),
          ]),
        ),
        gap16,
        const Field('Titre du cours',
            value: 'Les types fondamentaux et interfaces', suffix: Icon(Icons.edit_outlined, size: 18, color: C.meta)),
        const Eyebrow('Type de contenu'),
        gap8,
        Row(children: const [
          Expanded(child: _Type(Icons.play_circle_outline, 'Vidéo', true)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.description_outlined, 'Article', false)),
          SizedBox(width: 8),
          Expanded(child: _Type(Icons.quiz_outlined, 'Quiz', false)),
        ]),
        gap16,
        AdminRow(
          leading: const IconBox(Icons.movie_outlined),
          title: 'intro_ts_types_v2.mp4',
          subtitle: 'Fichier vidéo • 142 Mo',
          trailing: Row(mainAxisSize: MainAxisSize.min, children: const [
            Icon(Icons.swap_horiz, size: 18, color: C.primary),
            SizedBox(width: 4),
            Text('Changer', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.primary)),
          ]),
        ),
        gap16,
        const Field('Contenu & description',
            value: 'Dans cette leçon vidéo de 45 minutes, nous explorerons les mécanismes de typage statique de TypeScript : '
                'types primitifs, unions, intersections, et création d\'interfaces robustes pour vos APIs.',
            lines: 4,
            counter: '148 car.'),
        Row(children: const [
          Expanded(child: Field('Durée estimée', value: '00:45:00', prefix: Icons.timelapse)),
          SizedBox(width: 12),
          Expanded(child: Field('Ordre', value: 'Position 3 sur 12', prefix: Icons.reorder)),
        ]),
        const Eyebrow('Statut de publication'),
        gap8,
        AppCard(
          child: Row(children: [
            const Icon(Icons.check_circle, color: C.success),
            const SizedBox(width: 10),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Publié', style: T.title),
                Text('Accessible à l\'ensemble des apprenants', style: T.caption),
              ]),
            ),
            const Text('Modifier', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.primary)),
          ]),
        ),
      ],
    );
  }
}

class _Type extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool on;
  const _Type(this.icon, this.label, this.on);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: on ? C.primarySoft : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: on ? C.primary : C.border, width: on ? 2 : 1),
        ),
        child: Column(children: [
          Icon(icon, size: 24, color: on ? C.primary : C.meta),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: on ? C.primary : C.body)),
          if (on) const Icon(Icons.check_circle, size: 16, color: C.primary),
        ]),
      );
}
