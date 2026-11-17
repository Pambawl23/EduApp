import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class DetailDeLaNotification extends StatelessWidget {
  const DetailDeLaNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Détail De La Notification', leading: Icons.chevron_left, actions: [Icons.more_vert]),
      children: [
        const InfoBanner('Notification renvoyée aux 38 apprenants !', icon: Icons.check_circle, kind: Kind.published),
        AppCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: const [
              Icon(Icons.check_circle, color: C.success),
              SizedBox(width: 8),
              Expanded(child: Text('Envoyée avec succès', style: T.h3)),
              Text('Il y a 2 jours', style: T.caption),
            ]),
            gap8,
            Row(children: const [
              Icon(Icons.forward_to_inbox, size: 14, color: C.meta),
              SizedBox(width: 6),
              Text('Envoyée le 14 Mai 2024 à 10:30', style: T.caption),
            ]),
            gap16,
            Row(children: const [
              Tag('Info'),
              SizedBox(width: 8),
              Icon(Icons.campaign_outlined, size: 16, color: C.meta),
              SizedBox(width: 4),
              Expanded(child: Text('Formation Web Fullstack (#FORM-WEB-01)', style: T.caption)),
            ]),
            gap12,
            const Text('Nouvel examen certifiant disponible !', style: T.h3),
            const SizedBox(height: 4),
            const Text('L\'examen d\'évaluation sur l\'Architecture TypeScript & React est ouvert. Vous avez jusqu\'au 20 mai pour valider vos acquis.',
                style: T.body),
            gap12,
            Wrap(spacing: 14, children: const [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.priority_high, size: 14, color: C.meta),
                Text(' Priorité normale', style: T.caption),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.touch_app_outlined, size: 14, color: C.meta),
                Text(' Lien intégré actif', style: T.caption),
              ]),
            ]),
          ]),
        ),
        gap24,
        Row(children: const [
          Expanded(child: Text('Statistiques de diffusion & lecture', style: T.h3)),
          StatusBadge('Temps réel', Kind.published, icon: Icons.insights),
        ]),
        gap12,
        Row(children: const [
          Expanded(child: StatTile(Icons.group_outlined, '312', 'Total envoyés')),
          SizedBox(width: 8),
          Expanded(child: StatTile(Icons.done_all, '274', 'Lus (87.8%)')),
          SizedBox(width: 8),
          Expanded(child: StatTile(Icons.mark_email_unread_outlined, '38', 'Non lus (12.2%)')),
        ]),
        gap12,
        AppCard(
          child: Column(children: const [
            Row(children: [
              Expanded(child: Text('Taux d\'engagement global', style: T.title)),
              Text('87.8%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: C.primary)),
            ]),
            SizedBox(height: 12),
            _Line('Lus (274 apprenants)', '87.8%', 0.878, C.success),
            SizedBox(height: 10),
            _Line('Non lus / En attente (38 apprenants)', '12.2%', 0.122, C.warning),
          ]),
        ),
        gap24,
        Row(children: const [
          Expanded(child: Text('Analytique par canal d\'envoi', style: T.h3)),
          Text('3 canaux', style: T.caption),
        ]),
        gap12,
        const AdminRow(leading: IconBox(Icons.notifications_active_outlined), title: 'Notification Push',
            subtitle: '312 délivrés • 261 clics', trailing: Text('83.6% clics réels', style: _pct)),
        const AdminRow(leading: IconBox(Icons.inbox_outlined), title: 'Centre In-App',
            subtitle: '312 délivrés • 274 vues', trailing: Text('87.8% ouvertures', style: _pct)),
        const AdminRow(leading: IconBox(Icons.mail_outline), title: 'E-mail Digest',
            subtitle: '298 envoyés • 185 ouverts', trailing: Text('62.1% lectures', style: _pct)),
        gap24,
        const SectionTitle('Échantillon des apprenants', action: 'Voir tous (312)'),
        const AdminRow(leading: Avatar('CM'), title: 'Camille Martin', subtitle: 'Lu il y a 1 jour via Push',
            trailing: StatusBadge('Lu', Kind.sent, icon: Icons.check)),
        const AdminRow(leading: Avatar('AP', bg: C.meta), title: 'Alexandre Petit', subtitle: 'En attente d\'ouverture',
            trailing: StatusBadge('Non lu', Kind.draft, icon: Icons.schedule)),
        gap24,
        const Eyebrow('Actions sur les non-lus'),
        gap8,
        AppCard(
          color: C.warningSoft,
          borderColor: C.warningBorder,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Row(children: [
              Icon(Icons.mark_chat_unread_outlined, size: 18, color: C.warning),
              SizedBox(width: 8),
              Text('Rappel d\'échéance', style: T.title),
            ]),
            SizedBox(height: 6),
            Text('38 apprenants n\'ont pas encore consulté cette annonce concernant l\'examen.', style: T.bodySm),
          ]),
        ),
        gap12,
        const AppButton('Relancer les 38 non-lus', icon: Icons.notifications_active_outlined),
        const SizedBox(height: 4),
        const Text('Une notification push prioritaire et un e-mail direct seront émis.', style: T.caption, textAlign: TextAlign.center),
        gap16,
        const AppButton.secondary('Dupliquer cette notification', icon: Icons.content_copy),
        gap12,
        const AppButton.secondary('Exporter le rapport CSV', icon: Icons.download),
      ],
    );
  }
}

const _pct = TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: C.primary);

class _Line extends StatelessWidget {
  final String label;
  final String value;
  final double v;
  final Color color;
  const _Line(this.label, this.value, this.v, this.color);
  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          Expanded(child: Text(label, style: T.caption)),
          Text(value, style: T.title),
        ]),
        const SizedBox(height: 6),
        ProgressBar(v, color: color),
      ]);
}
