import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class SupprimerLeCours extends StatelessWidget {
  const SupprimerLeCours({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Supprimer Le Cours'),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        WarningHeader(
          'Supprimer ce cours ?',
          Text.rich(TextSpan(children: const [
            TextSpan(text: 'Attention : ', style: TextStyle(color: C.danger, fontWeight: FontWeight.w700)),
            TextSpan(text: 'Cette action est irréversible. La suppression définitive de la leçon '),
            TextSpan(text: '« 03. Les types fondamentaux et interfaces » ', style: TextStyle(color: C.heading, fontWeight: FontWeight.w700)),
            TextSpan(text: 'modifiera l\'ordre du cursus et supprimera la progression validée de '),
            TextSpan(text: '312 apprenants ', style: TextStyle(color: C.heading, fontWeight: FontWeight.w700)),
            TextSpan(text: 'inscrits.'),
          ])),
        ),
        Container(
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Icon(Icons.menu_book_outlined, color: C.meta),
              const SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Eyebrow('Élément ciblé'),
                  Text('03. Les types fondamentaux et interfaces', style: T.title),
                  Text('Réf. #CRS-TS-03', style: T.caption),
                ]),
              ),
            ]),
            const Divider(height: 24, color: C.borderLight),
            Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Eyebrow('Format'),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.play_circle_outline, size: 16, color: C.meta),
                    SizedBox(width: 4),
                    Flexible(child: Text('Vidéo • 45 min', style: T.title)),
                  ]),
                ]),
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Eyebrow('Impact direct'),
                  SizedBox(height: 4),
                  Row(children: [
                    Icon(Icons.person_remove_outlined, size: 16, color: C.danger),
                    SizedBox(width: 4),
                    Flexible(child: Text('312 progressions', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.danger))),
                  ]),
                ]),
              ),
            ]),
          ]),
        ),
        const AppButton.danger('Confirmer la suppression', icon: Icons.delete_outline),
        const AppButton.text('Conserver le cours'),
      ]),
    );
  }
}
