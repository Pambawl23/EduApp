import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class SupprimerLaFormation extends StatelessWidget {
  const SupprimerLaFormation({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Planifier Une Session'),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        WarningHeader(
          'Supprimer cette formation ?',
          Text.rich(TextSpan(children: const [
            TextSpan(text: 'Attention : Cette action est irréversible. La suppression définitive de '),
            TextSpan(text: '« Développement Web Fullstack » ', style: TextStyle(color: C.heading, fontWeight: FontWeight.w700)),
            TextSpan(text: 'impactera directement 312 apprenants actuellement inscrits ainsi que leurs progressions et certifications.'),
          ])),
        ),
        const FactBox([
          (Icons.school_outlined, 'Formation', 'Développement Web\n#FORM-WEB-01', null),
          (Icons.group_outlined, 'Apprenants', '312 inscrits actifs', C.danger),
          (Icons.folder_open, 'Contenus', '12 modules • 3 examens', null),
        ]),
        const AppButton.danger('Confirmer la suppression', icon: Icons.delete_forever),
        const AppButton.text('Conserver la formation'),
      ]),
    );
  }
}
