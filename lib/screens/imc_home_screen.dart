import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  static const int minWeight = 20;
  static const int maxWeight = 300;
  static const int minAge = 1;
  static const int maxAge = 120;
  static const double minHeight = 120;
  static const double maxHeight = 220;

  String? selectedGender;
  int selectedAge = 26;
  int selectedWeight = 72;
  double selectedHeight = 178;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('IMC Calculator'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track your body index',
                        style: TextStyles.bodyText.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Adjust the fields below and tap Calculate IMC.',
                        style: TextStyles.bodyText.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GenderSelector(
                selectedGender: selectedGender,
                onGenderChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              HeightSelector(
                height: selectedHeight,
                onHeightChanged: (value) {
                  setState(() {
                    selectedHeight = value.clamp(minHeight, maxHeight).toDouble();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: NumberSelector(
                        title: 'Weight',
                        value: selectedWeight,
                        onIncrement: () {
                          setState(() {
                            selectedWeight = min(maxWeight, selectedWeight + 1);
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            selectedWeight = max(minWeight, selectedWeight - 1);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: NumberSelector(
                        title: 'Age',
                        value: selectedAge,
                        onIncrement: () {
                          setState(() {
                            selectedAge = min(maxAge, selectedAge + 1);
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            selectedAge = max(minAge, selectedAge - 1);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (selectedGender == null) {
                        _showValidationMessage("Please select a gender first.");
                        return;
                      }

                      final bool invalidWeight = selectedWeight < minWeight ||
                          selectedWeight > maxWeight;
                      final bool invalidHeight = selectedHeight < minHeight ||
                          selectedHeight > maxHeight;

                      if (invalidWeight || invalidHeight) {
                        _showValidationMessage(
                          "Please review your height and weight values.",
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImcResultScreen(
                            height: selectedHeight,
                            weight: selectedWeight,
                            gender: selectedGender!,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        AppColors.primary,
                      ),
                    ),
                    icon: const Icon(Icons.calculate, color: Colors.white),
                    label: Text('Calculate IMC', style: TextStyles.bodyText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showValidationMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
