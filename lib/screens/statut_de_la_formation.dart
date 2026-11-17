import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class StatutDeLaFormation extends StatelessWidget {
  const StatutDeLaFormation({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Planifier Une Session'),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Text('Statut de la formation', style: T.h2),
              Text('Développement Web Fullstack (312 inscrits)', style: T.caption),
            ]),
          ),
          const Icon(Icons.close, color: C.meta),
        ]),
        gap16,
        const ChoiceCard('Publier la formation',
            subtitle: 'Visible par tous les apprenants. Les 312 apprenants peuvent poursuivre leurs cours et examens normalement.',
            icon: Icons.check_circle_outline,
            selected: true,
            trailing: StatusBadge('Actuel', Kind.published)),
        const ChoiceCard('Archiver la formation',
            subtitle: 'Masquée du catalogue public. Les 312 apprenants conservent un accès en consultation seule, inscriptions closes.',
            icon: Icons.archive_outlined,
            trailing: StatusBadge('Archivé', Kind.archived)),
        const ChoiceCard('Remettre en brouillon',
            subtitle: 'Retire immédiatement la formation du catalogue actif pour révision majeure des modules.',
            icon: Icons.edit_document,
            trailing: StatusBadge('Brouillon', Kind.draft)),
        const InfoBanner('La formation restera disponible immédiatement sans interruption pour la promotion en cours.'),
        const AppButton('Appliquer le statut'),
        const AppButton.text('Annuler'),
      ]),
    );
  }
}
