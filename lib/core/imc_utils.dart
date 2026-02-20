import 'package:flutter/material.dart';

class ImcUtils {
  static double calculateImc({
    required double heightInCm,
    required int weightInKg,
  }) {
    return weightInKg / ((heightInCm / 100) * (heightInCm / 100));
  }

  static ImcFeedback getFeedback(double imc) {
    if (imc < 18.5) {
      return const ImcFeedback(
        title: 'Underweight',
        range: 'Below 18.5',
        description: 'Your IMC is below the recommended range.',
        recommendation:
            'Focus on balanced meals and consider consulting a nutrition professional.',
        color: Colors.amber,
      );
    }

    if (imc < 25) {
      return const ImcFeedback(
        title: 'Healthy Weight',
        range: '18.5 to 24.9',
        description: 'Great result. Your IMC is within a healthy range.',
        recommendation:
            'Maintain your routine with regular activity and consistent nutrition.',
        color: Colors.green,
      );
    }

    if (imc < 30) {
      return const ImcFeedback(
        title: 'Overweight',
        range: '25.0 to 29.9',
        description: 'Your IMC is above the ideal range.',
        recommendation:
            'Small changes in activity and food choices can improve your IMC over time.',
        color: Colors.orange,
      );
    }

    return const ImcFeedback(
      title: 'Obesity',
      range: '30.0 or higher',
      description: 'Your IMC is in a high-risk range.',
      recommendation:
          'Seek medical guidance for a safe, personalized improvement plan.',
      color: Colors.red,
    );
  }
}

class ImcFeedback {
  final String title;
  final String range;
  final String description;
  final String recommendation;
  final Color color;

  const ImcFeedback({
    required this.title,
    required this.range,
    required this.description,
    required this.recommendation,
    required this.color,
  });
}
