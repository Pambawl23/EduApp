import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreerUnExamenEtape1 extends StatelessWidget {
  const CreerUnExamenEtape1({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminPage(
      bar: const AdminBar('Création Examen Étape 1', actions: [Icons.more_vert]),
      bottom: Column(mainAxisSize: MainAxisSize.min, children: const [
        AppButton('Continuer vers l\'étape 2 (Questions)', icon: Icons.arrow_forward),
        AppButton.secondary('Enregistrer comme brouillon', icon: Icons.bookmark_border),
      ]),
      children: [
        Row(children: const [
          Expanded(child: Text('Configuration de la session', style: T.h2)),
          Text('50% complété', style: T.caption),
        ]),
        gap8,
        const ProgressBar(0.5),
        gap8,
        const Text('Étape 1 sur 2 : Paramètres généraux', style: T.caption),
        gap12,
        Row(children: [
          const Avatar('1', size: 28),
          const SizedBox(width: 8),
          const Text('Paramètres généraux', style: T.title),
          const Expanded(child: Divider(indent: 8, endIndent: 8)),
          const Avatar('2', size: 28, bg: C.hint),
          const SizedBox(width: 8),
          const Text('Questions & Barème', style: T.caption),
        ]),
        gap24,
        const Field('Titre de l\'examen',
            value: 'Évaluation Finale : React Native & État Global',
            counter: '45/100',
            required: true,
            suffix: Icon(Icons.check_circle, size: 18, color: C.success),
            helper: 'Visible par les étudiants sur leur tableau de bord d\'examen.'),
        const Eyebrow('Formation liée *'),
        gap8,
        AppCard(
          child: Row(children: [
            const IconBox(Icons.menu_book_outlined),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('Développement Web Fullstack', style: T.title),
                Text('Code promo : #FORM-WEB-01 • 28 Candidats', style: T.caption),
              ]),
            ),
            const StatusBadge('Actif', Kind.published),
            const Icon(Icons.expand_more, color: C.meta),
          ]),
        ),
        gap8,
        const Text('Les droits d\'accès sont automatiquement synchronisés avec la cohorte.', style: T.caption),
        gap24,
        const Eyebrow('Note de réussite (seuil minimum) *'),
        gap8,
        Row(children: [
          const Expanded(child: Field('Pourcentage', value: '75 %')),
          const SizedBox(width: 12),
          const Expanded(child: Field('Sur 20', value: '15 /20')),
        ]),
        const InfoBanner('Moyenne académique: 70%', icon: Icons.verified_outlined, title: '15/20 minimum requis pour valider'),
        const Eyebrow('Durée limite *'),
        gap8,
        AppCard(
          child: Column(children: [
            Row(children: const [
              Icon(Icons.timer_outlined, size: 18, color: C.primary),
              SizedBox(width: 8),
              Expanded(child: Text('Chronométré', style: T.title)),
            ]),
            gap12,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              _Time('Heures', '00'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text(':', style: T.h2)),
              _Time('Minutes', '45'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text(':', style: T.h2)),
              _Time('Secondes', '00'),
            ]),
            gap12,
            Row(children: const [
              Icon(Icons.check_box_outline_blank, size: 20, color: C.meta),
              SizedBox(width: 8),
              Expanded(child: Text('Temps illimité (désactiver le compte à rebours)', style: T.bodySm)),
            ]),
          ]),
        ),
        gap24,
        const Eyebrow('Tentatives maximales autorisées *'),
        gap8,
        Row(children: [
          for (final t in const ['1', '2', '3', 'Illimité'])
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: t == '2' ? C.primary : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: t == '2' ? C.primary : C.border),
                ),
                child: Text(t,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: t == '2' ? Colors.white : C.body)),
              ),
            ),
        ]),
        gap8,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          Icon(Icons.history, size: 14, color: C.meta),
          SizedBox(width: 4),
          Expanded(child: Text('Nombre de fois qu\'un apprenant peut soumettre l\'examen. Seule la meilleure note sera retenue.', style: T.caption)),
        ]),
        gap24,
        const SectionTitle('Sécurité & Pédagogie'),
        AppCard(
          child: Column(children: [
            _Toggle('Mélanger l\'ordre des questions', 'Réduit les risques de fraude en générant une séquence unique par élève.', true),
            const Divider(height: 24, color: C.divider),
            _Toggle('Afficher la correction détaillée', 'Affiche les explications et réponses types immédiatement après la validation finale.', false),
          ]),
        ),
      ],
    );
  }
}

class _Time extends StatelessWidget {
  final String label;
  final String value;
  const _Time(this.label, this.value);
  @override
  Widget build(BuildContext context) => Column(children: [
        Text(label, style: T.caption),
        const Icon(Icons.arrow_drop_up, color: C.meta),
        Container(
          width: 64,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: C.bg, borderRadius: BorderRadius.circular(10), border: Border.all(color: C.border)),
          child: Text(value, style: T.h2),
        ),
        const Icon(Icons.arrow_drop_down, color: C.meta),
      ]);
}

class _Toggle extends StatelessWidget {
  final String title;
  final String sub;
  final bool on;
  const _Toggle(this.title, this.sub, this.on);
  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: T.title),
            const SizedBox(height: 2),
            Text(sub, style: T.caption),
          ]),
        ),
        Switch(value: on, onChanged: (_) {}, activeColor: Colors.white, activeTrackColor: C.primary),
      ]);
}
