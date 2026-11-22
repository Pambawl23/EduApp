import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  static const Color primary = Color(0xFF2F5094);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textGrey = Color(0xFF64748B);
  static const Color placeholderBg = Color(0xFFE2E8F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'EduApp',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              // Logo
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.school_outlined,
                    color: Colors.white, size: 32),
              ),
              const SizedBox(height: 32),
              // Zone d'illustration
              CustomPaint(
                painter: _DashedBorderPainter(
                  color: const Color(0xFFB8C4D6),
                  radius: 12,
                ),
                child: Container(
                  height: 232,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: placeholderBg.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, size: 30, color: textGrey),
                      SizedBox(height: 8),
                      Text(
                        'Illustration de bienvenue',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Suivez votre progression',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textDark,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Votre compagnon de formation en ligne',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: textGrey),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {}, // écran statique
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Commencer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bordure en pointillés pour la zone d'illustration.
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  _DashedBorderPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(radius),
      ));

    const dash = 5.0, gap = 4.0;
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dash),
          paint,
        );
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}