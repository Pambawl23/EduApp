import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUneCategorie extends StatelessWidget {
  const CreerUneCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    const icons = [Icons.auto_awesome, Icons.code, Icons.insights, Icons.account_balance, Icons.diversity_3, Icons.security];
    return AdminPage(
      bar: const AdminBar('Créer Une Catégorie', actions: [Icons.close]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Créer la catégorie', icon: Icons.add_circle_outline),
        AppButton.text('Annuler'),
      ]),
      children: [
        Row(children: const [
          Expanded(child: Eyebrow('Catalogue Thématique')),
          Text('14 catégories actives', style: T.caption),
          SizedBox(width: 8),
          Icon(Icons.filter_list, size: 18, color: C.meta),
        ]),
        gap12,
        for (final r in const [
          (Icons.terminal, 'Développement Web & Cloud', '28 formations actives'),
          (Icons.psychology_outlined, 'Management & Leadership', '19 formations actives'),
          (Icons.palette_outlined, 'Design Numérique & UX/UI', '12 formations actives'),
        ])
          AdminRow(
            leading: IconBox(r.$1),
            title: r.$2,
            subtitle: r.$3,
            trailing: const Icon(Icons.chevron_right, color: C.hint),
          ),
        gap24,
        const InfoBanner('Ajoutez une catégorie pour classer vos formations et parcours d\'apprentissage.',
            title: 'Nouvelle catégorie'),
        const InfoBanner('Catégorie ajoutée avec succès au catalogue.',
            icon: Icons.check_circle, kind: Kind.published),
        const Field('Nom de la catégorie', hint: 'ex. Intelligence Artificielle & Data Science'),
        const Field('Description', hint: 'Décrivez le contenu de la catégorie…', lines: 4, counter: '0 / 250'),
        const Eyebrow('Identité visuelle & symbole'),
        gap12,
        Wrap(spacing: 12, runSpacing: 12, children: [
          for (var i = 0; i < icons.length; i++)
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: i == 0 ? C.primary : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: i == 0 ? C.primary : C.border),
              ),
              child: Stack(alignment: Alignment.center, children: [
                Icon(icons[i], color: i == 0 ? Colors.white : C.meta),
                if (i == 0)
                  const Positioned(top: 3, right: 3, child: Icon(Icons.check_circle, size: 14, color: Colors.white)),
              ]),
            ),
        ]),
      ],
    );
  }
}
