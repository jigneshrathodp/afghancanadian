import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class WomenServiceScreen extends StatelessWidget {
  const WomenServiceScreen({super.key});

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
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
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
                      'Women Services',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Introduction
                  Text(
                    'ACIC provides a healthy environment for Afghan families, including women, where they can:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.5),

                  // Bullet Points
                  _buildBulletPoint('get together as a community', bodyFontSize, verticalPadding),
                  _buildBulletPoint('recognize religious and cultural events and significant dates', bodyFontSize, verticalPadding),
                  _buildBulletPoint('share their experiences and passions', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding),

                  // Collaboration Section
                  Text(
                    'The women\'s services section collaborates with other sections in the planning and delivery of all activities and events of the community centre including Mother\'s Day, volunteer appreciation day, commemoration of Hazrat Zainab (SA) Day and educational classes.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
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
                          'If you have any suggestions, concerns or ideas, please contact the director of women at:',
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
          SizedBox(height: screenHeight * 0.05 > 60 ? 60 : screenHeight * 0.05)
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
