import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Results extends StatelessWidget {
  final double bmi;

  final String interpretation;
  final int weight;
  final int height;
  final int age;
  final String gender;
  const Results({super.key, required this.bmi, required this.interpretation, required this.weight, required this.height, required this.age, required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Results'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your BMI is ${bmi.toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Interpretation: $interpretation',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              //   if the bmi is not proper dont show the Paint
              if (bmi > 0 || bmi < 40)
                CustomPaint(
                  size: const Size(300, 300),
                  painter: GaugePainter(bmi, weight, height, age, gender),
                ),
              Text(
                'You are ${interpretation.split(' ')[0]}!',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double bmi;
  final int weight;
  final int height;
  final int age;
  final String gender;

  GaugePainter(this.bmi, this.weight, this.height, this.age, this.gender);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = Math.pi; // Start at -90 degrees
    double sweepAngle = Math.pi; // 180 degrees (half circle)
    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    var underweightEnd = 0.0;
    var normalEnd = 0.0;
    var overweightEnd = 0.0;
    var obeseEnd = 0.0;

    // Define the ranges for each category
    if (age >= 20) {
      // Adult BMI categories
      underweightEnd = 18.5;
      normalEnd = 25;
      overweightEnd = 30;
      obeseEnd = 40;
    } else {
      if (gender == 'male') {
        // Child BMI categories for
        underweightEnd = 16;
        normalEnd = 20;
        overweightEnd = 26;
        obeseEnd = 40;
      } else {
        underweightEnd = 14;
        normalEnd = 18;
        overweightEnd = 24;
        obeseEnd = 40;
      }
    }

    // Calculate total range
    double totalRange = obeseEnd - 10; // Starting from BMI of 10 for example

    // Draw sections dynamically based on the BMI ranges
    double underweightAngle = (underweightEnd - 10) / totalRange * sweepAngle;
    double normalAngle = (normalEnd - underweightEnd) / totalRange * sweepAngle;
    double overweightAngle =
        (overweightEnd - normalEnd) / totalRange * sweepAngle;
    double obeseAngle = (obeseEnd - overweightEnd) / totalRange * sweepAngle;

    // Draw Underweight section (red)
    paint.color = Colors.red;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle,
        underweightAngle,
        true,
        paint);

    // Draw Normal section (green)
    paint.color = Colors.green;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle + underweightAngle,
        normalAngle,
        true,
        paint);

    // Draw Overweight section (yellow)
    paint.color = Colors.lightBlue;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle + underweightAngle + normalAngle,
        overweightAngle,
        true,
        paint);

    // Draw Obese section (orange)
    paint.color = Colors.blue.shade900;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle + underweightAngle + normalAngle + overweightAngle,
        obeseAngle,
        true,
        paint);

    // Draw the needle
    paint.color = Colors.black;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.stroke;
    double angle = 0;

    // Draw the text
    if (age >= 20) {
      angle = (bmi - 100) / totalRange * sweepAngle;
      canvas.drawLine(
          Offset(centerX, centerY),
          Offset(centerX + radius * Math.cos(angle),
              centerY + radius * Math.sin(angle)),
          paint);
      drawText(canvas, ' Under\nWeight', centerX, centerY, 115, 60, 0);
      drawText(canvas, 'Normal', centerX, centerY, 62, 103, 0);
      drawText(canvas, '  Over\nWeight', centerX, centerY, -3, 116, 0);
      drawText(canvas, 'Obese', centerX, centerY, -50, 50, 0);
    }
    else {
      if (gender == 'male'){
        angle = (bmi - 100) / totalRange * sweepAngle;
        canvas.drawLine(
            Offset(centerX, centerY),
            Offset(centerX + radius * Math.cos(angle),
                centerY + radius * Math.sin(angle)),
            paint);
        drawText(canvas, ' Under\nWeight', centerX, centerY, 115, 50, 0);
        drawText(canvas, 'Normal', centerX, centerY, 109, 100, 0);
        drawText(canvas, '  Over\nWeight', centerX, centerY, 42, 116, 0);
        drawText(canvas, 'Obese', centerX, centerY, -50, 70, 0);
      }
      else {
        // draw the needle
        angle = (bmi - 100) / totalRange * sweepAngle;
        canvas.drawLine(
            Offset(centerX, centerY),
            Offset(centerX + radius * Math.cos(angle),
                centerY + radius * Math.sin(angle)),
            paint);
        drawText(canvas, ' Under\nWeight', centerX, centerY, 115, 50, 0);
        drawText(canvas, 'Normal', centerX, centerY, 103, 95, 0);
        drawText(canvas, '  Over\nWeight', centerX, centerY, 57, 136, 0);
        drawText(canvas, 'Obese', centerX, centerY, -40, 70, 0);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void drawText(Canvas canvas, String text, double centerX, double centerY,
      int dX, int dY, int angle) {
    //   draw text with 10 degree angle
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 100,
    );
    final offset = Offset(centerX - dX, centerY - dY);
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(angle * Math.pi / 180);
    textPainter.paint(canvas, Offset(0, 0));
    canvas.restore();
  }
}
