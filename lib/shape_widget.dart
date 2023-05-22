import 'package:flutter/material.dart';
import 'package:random/shape.dart';

class ShapeWidget extends StatelessWidget {
  final Shape shape;

  const ShapeWidget({super.key, required this.shape});

  @override
  Widget build(BuildContext context) {
    Widget shapeWidget;

    switch (shape) {
      case Shape.square:
        shapeWidget = Container(
          width: 150,
          height: 150,
          color: Colors.red,
        );
        break;
      case Shape.circle:
        shapeWidget = Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        );
        break;
      case Shape.triangle:
        shapeWidget = Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.transparent,

          ),
          child: CustomPaint(
            painter: TrianglePainter(color: Colors.yellow),
          ),
        );
        break;
      case Shape.rectangle:
        shapeWidget = Container(
          width: 250,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
          ),
          child: CustomPaint(
            painter: TrianglePainter(color: Colors.green),
          ),
        );
        break;
    }

    return Center(child: shapeWidget);
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}

