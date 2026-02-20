import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;
  const HeightSelector({
    super.key,
    required this.height,
    required this.onHeightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Height".toUpperCase(), style: TextStyles.bodyText),
            ),
            Text(
              "${height.toStringAsFixed(0)} cm",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: height,
              onChanged: (value) {
                onHeightChanged(value);
              },
              min: 120,
              max: 220,
              divisions: 100,
              label: "${height.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "120 cm",
                    style: TextStyles.bodyText.copyWith(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "220 cm",
                    style: TextStyles.bodyText.copyWith(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
