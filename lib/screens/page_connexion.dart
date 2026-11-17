import 'package:flutter/material.dart';

class PageConnexion extends StatelessWidget {
  const PageConnexion({super.key});

  static const Color primary = Color(0xFF2F5094);
  static const Color labelGrey = Color(0xFF64748B);
  static const Color border = Color(0xFFC3CFE2);
  static const Color hintGrey = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Connexion',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _FieldLabel('E-MAIL'),
              const SizedBox(height: 8),
              const _StaticField(
                text: 'votre.email@domaine.com',
                isHint: true,
              ),
              const SizedBox(height: 20),
              const _FieldLabel('MOT DE PASSE'),
              const SizedBox(height: 8),
              const _StaticField(text: '••••••••', isHint: false),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(
                      fontSize: 14,
                      color: primary,
                      decoration: TextDecoration.underline,
                      decorationColor: primary,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primary,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: primary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Créer un compte',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: PageConnexion.labelGrey,
        letterSpacing: 0.3,
      ),
    );
  }
}

/// Champ statique (visuel uniquement, pas de saisie).
class _StaticField extends StatelessWidget {
  final String text;
  final bool isHint;
  const _StaticField({required this.text, required this.isHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PageConnexion.border),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: isHint ? PageConnexion.hintGrey : PageConnexion.labelGrey,
          letterSpacing: isHint ? 0 : 1.5,
        ),
      ),
    );
  }
}