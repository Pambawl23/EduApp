import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ConfirmationDEnvoi extends StatelessWidget {
  const ConfirmationDEnvoi({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogPage(
      bar: const AdminBar('Programmer Un Envoi', leading: Icons.chevron_left, actions: [Icons.more_vert]),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(color: C.primarySoft, shape: BoxShape.circle),
          child: const Icon(Icons.send, size: 28, color: C.primary),
        ),
        gap12,
        const Eyebrow('Validation requise', color: C.primary),
        gap8,
        const Text('Confirmer l\'envoi de la notification ?', textAlign: TextAlign.center, style: T.h2),
        gap8,
        const Text('Vous vous apprêtez à diffuser cette notification push à vos apprenants. Cette action ne peut pas être annulée une fois lancée.',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: C.meta, height: 1.45)),
        gap16,
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: C.primarySoft, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Text('312', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: C.primary)),
              SizedBox(width: 10),
              Expanded(child: Text('Apprenants destinataires', style: T.title)),
              StatusBadge('Cible active', Kind.published),
            ]),
            const Divider(height: 24, color: C.borderLight),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Icon(Icons.school_outlined, size: 16, color: C.meta),
              SizedBox(width: 6),
              Expanded(child: Text.rich(TextSpan(children: [
                TextSpan(text: 'Formation : ', style: T.caption),
                TextSpan(text: 'Développement Web Fullstack', style: T.title),
              ]))),
            ]),
            gap8,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Icon(Icons.devices, size: 16, color: C.meta),
              SizedBox(width: 6),
              Expanded(child: Text.rich(TextSpan(children: [
                TextSpan(text: 'Canaux actifs : ', style: T.caption),
                TextSpan(text: 'Push mobile (312) • In-App (312) • E-mail (298 avec opt-in)', style: T.title),
              ]))),
            ]),
          ]),
        ),
        gap16,
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Eyebrow('Aperçu du message'),
            SizedBox(height: 8),
            Tag('Type Info'),
            SizedBox(height: 8),
            Text('Nouveau cours disponible : Hooks avancés React', style: T.title),
            SizedBox(height: 4),
            Text('Approfondissez useReducer, useCallback et custom hooks avec notre atelier pratique mis à jour.', style: T.caption),
          ]),
        ),
        gap12,
        Row(children: const [
          Icon(Icons.schedule, size: 16, color: C.meta),
          SizedBox(width: 6),
          Expanded(child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Date d\'exécution : ', style: T.caption),
            TextSpan(text: 'Immédiat (dès confirmation)', style: T.title),
          ]))),
        ]),
        gap8,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Icon(Icons.verified_user_outlined, size: 14, color: C.success),
          SizedBox(width: 6),
          Expanded(child: Text('File d\'attente sécurisée avec synchronisation en tâche de fond.', style: T.caption)),
        ]),
        gap16,
        const AppButton('Confirmer et envoyer maintenant', icon: Icons.send),
        const AppButton.text('Annuler et modifier'),
      ]),
    );
  }
}
