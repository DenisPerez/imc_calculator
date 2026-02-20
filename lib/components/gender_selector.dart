import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderChanged("M"),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "M"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset("assets/images/male.png"),
                      ),
                      Text("Male".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onGenderChanged("F"),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                bottom: 16,
                right: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "F"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset("assets/images/female.png"),
                      ),
                      Text("Female".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
