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
  int selectedAge = 26;
  int selectedWeight = 72;
  double selectedHeight = 178;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          height: selectedHeight,
          onHeightChanged: (value) {
            setState(() {
              selectedHeight = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Weight",
                  value: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight = max(0, selectedWeight + 1);
                    });
                  },
                  onDrecrement: () {
                    setState(() {
                      selectedWeight = max(0, selectedWeight - 1);
                    });
                  },
                ),
              ),
              Expanded(
                child: NumberSelector(
                  title: "Age",
                  value: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge = max(0, selectedAge + 1);
                    });
                  },
                  onDrecrement: () {
                    setState(() {
                      selectedAge = max(0, selectedAge - 1);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      height: selectedHeight,
                      weight: selectedWeight,
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
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calculate IMC", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
