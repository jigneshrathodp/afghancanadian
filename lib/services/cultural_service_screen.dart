import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:flutter/material.dart';

class CulturalServiceScreen extends StatelessWidget {
  const CulturalServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive padding
    final horizontalPadding = screenWidth * 0.05 > 24 ? 24.0 : screenWidth * 0.05;
    final verticalPadding = screenHeight * 0.03 > 20 ? 20.0 : screenHeight * 0.03;

    // Responsive font sizes
    final titleFontSize = screenWidth * 0.06 > 28 ? 28.0 : screenWidth * 0.06;
    final headingFontSize = screenWidth * 0.05 > 22 ? 22.0 : screenWidth * 0.05;
    final subheadingFontSize = screenWidth * 0.045 > 18 ? 18.0 : screenWidth * 0.045;
    final bodyFontSize = screenWidth * 0.04 > 16 ? 16.0 : screenWidth * 0.04;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'CULTURAL SERVICES',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Subtitle
                  Text(
                    'Cultural and Religious Services',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.8),

                  // Description
                  Text(
                    'ACIC provides a friendly and conducive atmosphere for Afghan families where they can:\n• get together as a community\n• recognize religious and cultural events and significant dates\n• share their experiences and passions',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Services List Heading
                  Text(
                    'Some of the cultural services we provide include:',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.6),

                  // Bullet Points
                  _buildBulletPoint('weekly programs on Friday nights', bodyFontSize, verticalPadding),
                  _buildBulletPoint('monthly online Ahkam classes', bodyFontSize, verticalPadding),
                  _buildBulletPoint('monthly online Tafsir-e Quran classes', bodyFontSize, verticalPadding),
                  _buildBulletPoint('recognizing religious and national celebrations', bodyFontSize, verticalPadding),
                  _buildBulletPoint('organizing conferences and workshops on religious and cultural topics', bodyFontSize, verticalPadding),
                  _buildBulletPoint('family picnic events in the summer', bodyFontSize, verticalPadding),
                  _buildBulletPoint('poetry and literature gatherings', bodyFontSize, verticalPadding),
                  _buildBulletPoint('art exhibitions', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding),

                  // Contact Information
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(verticalPadding),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: subheadingFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'For any inquiries or suggestions regarding our cultural programs, please contact us at:',
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: AppColors.textPrimary,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'info@afghancanada.com',
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text, double fontSize, double verticalPadding) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalPadding * 0.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: AppColors.textPrimary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
