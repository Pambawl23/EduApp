import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class SupprimerLUtilisateur extends StatelessWidget {
  const SupprimerLUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Supprimer L\'Utilisateur'),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const WarningHeader(
          'Supprimer cet utilisateur ?',
          Text('Cette action est irréversible. Toutes les données associées à cet apprenant '
              '(progression des cours, inscriptions, résultats d\'examens) seront définitivement supprimées.'),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            const Avatar('SM', size: 44),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Sophie Martin', style: T.title),
                Text('sophie.martin@email.fr', style: T.caption),
              ]),
            ),
            const Tag('Apprenant'),
          ]),
        ),
        const AppButton.danger('Confirmer la suppression', icon: Icons.delete_forever),
        const AppButton.text('Annuler'),
      ]),
    );
  }
}
