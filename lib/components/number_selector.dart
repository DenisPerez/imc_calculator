import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatelessWidget {
  final String title;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int value;

  const NumberSelector({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.onDecrement,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(title, style: TextStyles.bodyText),
            Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  mini: true,
                  tooltip: "Decrease $title",
                  heroTag: "$title-minus",
                  onPressed: () {
                    onDecrement();
                  },
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  mini: true,
                  tooltip: "Increase $title",
                  heroTag: "$title-plus",
                  onPressed: () {
                    onIncrement();
                  },
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
