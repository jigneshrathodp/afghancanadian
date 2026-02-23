import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class YouthServiceScreen extends StatelessWidget {
  const YouthServiceScreen({super.key});

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
                      'Youth Services',
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
                    'ACIC\'s youth programs and services are coordinated by the Afghan Youth Committee (AYC).',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Mission
                  Text(
                    'Our Mission',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Our Youth Committee\'s mission is to empower our youth\'s critical understanding and awareness of their faith and traditions that masks the Canadian-Afghan Muslim identity. AYC has been focusing on providing the community with a holistic set of programs ranging from lectures to social programs. The committee\'s aim is to bring together the community in an engaging, interactive and educational manner. Also, the AYC\'s main goal is to provide the community with many different opportunities throughout the year to learn more about Islam through different methods.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Social Events
                  Text(
                    'Social Events',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'AYC social events allow youth to try something fun and get to know others in the community in an enjoyable and relaxed atmosphere. Throughout the years, AYC has held events such as:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  _buildBulletPoint('Skating', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Skiing', bodyFontSize, verticalPadding),
                  _buildBulletPoint('BBQs', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Horseback riding', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Swimming', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Soccer tournaments', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding),

                  // Cultural Events
                  Text(
                    'Cultural Events',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'AYC\'s cultural events are focused on celebrating our Afghan culture in a memorable way and have culturally-related events such as:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  _buildBulletPoint('Nowroz Carnival', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Eid Family Picnics', bodyFontSize, verticalPadding),
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
                          'If you have any suggestions, concerns or ideas, please contact us at:',
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
