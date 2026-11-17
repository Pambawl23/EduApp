import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ModifierLaCategorie extends StatelessWidget {
  const ModifierLaCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Modifier La Catégorie', actions: [Icons.close]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Enregistrer les modifications', icon: Icons.save_outlined),
        AppButton.text('Annuler'),
      ]),
      children: [
        const Eyebrow('Catégorie'),
        gap8,
        const AdminRow(
          leading: IconBox(Icons.terminal),
          title: 'Développement Web',
          subtitle: '12 formations rattachées',
          trailing: StatusBadge('Publié', Kind.published),
        ),
        const AdminRow(
          leading: IconBox(Icons.draw_outlined),
          title: 'Design & Ergonomie',
          subtitle: '8 formations rattachées',
          trailing: Icon(Icons.chevron_right, color: C.hint),
        ),
        gap24,
        const Text('Modifier la catégorie', style: T.h2),
        const Text('Catégorie active • Contient 12 formations', style: T.caption),
        gap16,
        const Field('Nom',
            value: 'Développement Web',
            suffix: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.check_circle, size: 16, color: C.success),
              SizedBox(width: 4),
              Text('Valide', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: C.success)),
            ])),
        const Field('Description',
            value: 'Parcours complets sur les technologies web frontend, backend, bases de données et architectures '
                'logicielles modernes pour développeurs juniors et confirmés.',
            lines: 4,
            counter: '184 / 250'),
        const InfoBanner('Les 12 formations associées refléteront automatiquement les modifications apportées à cette catégorie.'),
        AppCard(
          child: Row(children: [
            SizedBox(
              width: 70,
              height: 32,
              child: Stack(children: const [
                Positioned(left: 0, child: Avatar('JS', size: 32)),
                Positioned(left: 20, child: Avatar('PY', size: 32, bg: C.meta)),
                Positioned(left: 40, child: Avatar('+10', size: 32, bg: C.hint)),
              ]),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Text('Modules synchronisés en temps réel', style: T.bodySm)),
            const Icon(Icons.sync, size: 20, color: C.primary),
          ]),
        ),
      ],
    );
  }
}
