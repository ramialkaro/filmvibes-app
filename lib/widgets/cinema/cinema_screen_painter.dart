import 'package:flutter/material.dart';

class CinemaScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final gradient = RadialGradient(
      center: const Alignment(0.1, 0.9),
      radius: 2,
      colors: [
        const Color(0xFFFF79C6).withOpacity(0.4),
        Colors.transparent,
      ],
      stops: const [0.0, 2.0],
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    final path = Path()
      ..moveTo(10, size.height - 30)
      ..quadraticBezierTo(
        size.width / 2,
        size.height - 50,
        size.width - 10,
        size.height - 30,
      )
      ..lineTo(size.width - 10, 0)
      ..lineTo(10, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
