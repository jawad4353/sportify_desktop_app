import 'package:flutter/material.dart';

class LeadingSectionCurvedClipper extends CustomClipper<Path> {
  final double curveDepth;

  const LeadingSectionCurvedClipper({this.curveDepth = 56.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    final out = curveDepth;
    final inn = curveDepth * 1.2;

    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.cubicTo(
      w + out,
      h * 0.22,
      w - inn,
      h * 0.72,
      w,
      h,
    );
    path.lineTo(0, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      oldClipper is LeadingSectionCurvedClipper && oldClipper.curveDepth != curveDepth;
}
