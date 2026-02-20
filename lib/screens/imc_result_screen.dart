import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/imc_utils.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  final String gender;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final double imc = ImcUtils.calculateImc(
      heightInCm: height,
      weightInKg: weight,
    );
    final ImcFeedback feedback = ImcUtils.getFeedback(imc);
    final String genderLabel = _genderLabel(gender);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('IMC Result'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          feedback.title.toUpperCase(),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: feedback.color,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          imc.toStringAsFixed(1),
                          style: TextStyles.bodyText.copyWith(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'IMC',
                          style: TextStyles.bodyText.copyWith(
                            color: Colors.white70,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMetricTile(
                                title: 'Height',
                                value: '${height.toStringAsFixed(0)} cm',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildMetricTile(
                                title: 'Weight',
                                value: '$weight kg',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildMetricTile(
                          title: 'Gender',
                          value: genderLabel,
                        ),
                        const SizedBox(height: 20),
                        _buildInfoTile(
                          title: 'Healthy range',
                          message: feedback.range,
                        ),
                        const SizedBox(height: 12),
                        _buildInfoTile(
                          title: 'Interpretation',
                          message: feedback.description,
                        ),
                        const SizedBox(height: 12),
                        _buildInfoTile(
                          title: 'Suggestion',
                          message: feedback.recommendation,
                        ),
                        const SizedBox(height: 12),
                        _buildInfoTile(
                          title: 'Disclaimer',
                          message:
                              'IMC is an indicator and should not replace professional medical diagnosis.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(AppColors.primary),
                  ),
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: Text('Recalculate', style: TextStyles.bodyText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricTile({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyles.bodyText.copyWith(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(value, style: TextStyles.bodyText),
        ],
      ),
    );
  }

  Widget _buildInfoTile({required String title, required String message}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.bodyText.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: TextStyles.bodyText.copyWith(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  String _genderLabel(String value) {
    if (value == "M") return "Male";
    if (value == "F") return "Female";
    return "Not specified";
  }
}
