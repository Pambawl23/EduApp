import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class SupprimerLaCategorie extends StatelessWidget {
  const SupprimerLaCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Supprimer La Catégorie', actions: [Icons.close], profile: false),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        WarningHeader(
          'Supprimer la catégorie ?',
          Text.rich(TextSpan(children: const [
            TextSpan(text: 'Attention : ', style: TextStyle(color: C.danger, fontWeight: FontWeight.w700)),
            TextSpan(text: 'Cette catégorie contient actuellement '),
            TextSpan(text: '12 formations actives', style: TextStyle(color: C.heading, fontWeight: FontWeight.w700)),
            TextSpan(
                text: '. Sa suppression laissera ces 12 formations sans catégorie assignée '
                    '(déplacées vers « Non classées ») et peut perturber le parcours des apprenants.'),
          ])),
        ),
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Row(children: [
              const IconBox(Icons.folder_open, bg: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Eyebrow('Catégorie cible'),
                  Text('Développement Web', style: T.h3),
                ]),
              ),
              const StatusBadge('12 formations', Kind.danger),
            ]),
            gap12,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(children: const [
                Icon(Icons.group_outlined, size: 18, color: C.meta),
                SizedBox(width: 8),
                Expanded(child: Text('Apprenants impactés', style: T.caption)),
                Text('640 inscrits', style: T.title),
              ]),
            ),
          ]),
        ),
        const AppButton.danger('Confirmer la suppression', icon: Icons.delete_forever),
        const AppButton.text('Conserver la catégorie'),
      ]),
    );
  }
}
