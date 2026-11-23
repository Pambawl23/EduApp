import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class ProgrammerUnEnvoi extends StatelessWidget {
  const ProgrammerUnEnvoi({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Programmer Un Envoi', leading: Icons.chevron_left, actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: [
        AppButton('Valider et programmer l\'envoi',
            icon: Icons.send_time_extension,
            onPressed: () => context.go(AppRoutes.notificationConfirmation)),
        AppButton.secondary('Retour à l\'édition',
            icon: Icons.edit_note,
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go(AppRoutes.createNotification)),
      ]),
      children: [
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.info_outline, size: 16, color: C.info),
              SizedBox(width: 6),
              Expanded(child: Eyebrow('Info · Apprentissage', color: C.info)),
              StatusBadge('Prêt à diffuser', Kind.published, icon: Icons.timer_outlined),
            ]),
            gap8,
            const Text('Nouveau cours disponible : Hooks avancés React', style: T.h3),
            gap12,
            Row(children: const [
              Icon(Icons.groups_outlined, size: 18, color: C.primary),
              SizedBox(width: 6),
              Text('312 apprenants', style: T.title),
              Text(' ciblés (Formation Web Fullstack)', style: T.caption),
            ]),
            gap8,
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
              Icon(Icons.verified_outlined, size: 14, color: C.success),
              SizedBox(width: 4),
              Expanded(child: Text('Filtre actif : Promotion Alpha & Bêta · Taux d\'engagement estimé : 94%', style: T.caption)),
            ]),
          ]),
        ),
        gap24,
        const Eyebrow('Mode de diffusion *'),
        gap8,
        const ChoiceCard('Envoyer immédiatement',
            subtitle: 'La notification push et le message in-app seront transmis instantanément à tous les destinataires.',
            icon: Icons.bolt),
        const ChoiceCard('Planifier pour plus tard',
            subtitle: 'Définissez une date et une heure précises pour automatiser l\'envoi selon la disponibilité des élèves.',
            icon: Icons.schedule,
            selected: true,
            trailing: StatusBadge('Recommandé', Kind.scheduled)),
        gap16,
        Row(children: const [
          Expanded(child: Eyebrow('Paramètres du calendrier (date & heure)')),
          Icon(Icons.public, size: 14, color: C.meta),
          SizedBox(width: 4),
          Text('Europe/Paris (UTC+2)', style: T.caption),
        ]),
        gap12,
        const Field('Date d\'envoi', value: 'Jeudi 16 Mai 2024', required: true,
            prefix: Icons.calendar_month_outlined, suffix: Icon(Icons.expand_more, color: C.meta)),
        const Eyebrow('Heure d\'envoi (fuseau Europe/Paris) *'),
        gap8,
        Row(children: const [
          Expanded(child: CounterStepper('09')),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text(':', style: T.h2)),
          Expanded(child: CounterStepper('30')),
        ]),
        gap4(),
        const Row(children: [
          Icon(Icons.schedule, size: 14, color: C.meta),
          SizedBox(width: 4),
          Text('Créneau retenu', style: T.caption),
        ]),
        gap16,
        const Eyebrow('Suggestions rapides'),
        gap8,
        Wrap(spacing: 8, runSpacing: 8, children: const [
          _Chip(Icons.sunny, 'Demain 09:00'),
          _Chip(Icons.date_range, 'Lundi prochain 08:30'),
          _Chip(Icons.flash_on, 'Dans 2 heures'),
        ]),
        gap24,
        const Eyebrow('Options avancées'),
        gap8,
        AppCard(
          child: Column(children: [
            _Opt(Icons.mail_outline, 'Envoyer également par e-mail récapitulatif', 'Inclus dans la newsletter académique hebdomadaire', true),
            const Divider(height: 24, color: C.divider),
            _Opt(Icons.campaign_outlined, 'Activer la notification sonore prioritaire', 'Force l\'alerte audible pour les cours obligatoires', false),
          ]),
        ),
        gap16,
        const InfoBanner(
            'L\'envoi sera consigné dans le journal d\'audit de l\'établissement. Vous pourrez modifier ou révoquer cette planification jusqu\'à 5 minutes avant l\'échéance.',
            icon: Icons.verified_user_outlined),
      ],
    );
  }

  static Widget gap4() => const SizedBox(height: 4);
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Chip(this.icon, this.label);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9999),
          border: Border.all(color: C.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: C.primary),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: C.body)),
        ]),
      );
}

class _Opt extends StatelessWidget {
  final IconData icon;
  final String title;
  final String sub;
  final bool on;
  const _Opt(this.icon, this.title, this.sub, this.on);
  @override
  Widget build(BuildContext context) => Row(children: [
        IconBox(icon, size: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: T.title),
            Text(sub, style: T.caption),
          ]),
        ),
        Switch(value: on, onChanged: (_) {}, activeColor: Colors.white, activeTrackColor: C.primary),
      ]);
}
