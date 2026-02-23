import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class EducationServiceScreen extends StatelessWidget {
  const EducationServiceScreen({super.key});

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
                      'Education Services',
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
                    'ACIC offers a wide range of educational programs designed for children and youth. These programs are the result of nearly 20 years of dedicated effort by our passionate teachers, committed volunteers, and supportive staff. Our facilities and curriculum reflect this long-standing commitment to nurturing the next generation through quality education and community support.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Heritage and Traditions
                  Text(
                    'As a proud Afghan Canadian community, we are helping families to familiarize and educate their children with their heritage and traditions including teaching the Islamic principles of Shia theology, Quran recitation, Farsi-Dari language and cultural-focused activities.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Maktab Board of Education
                  Text(
                    'Maktab Board of Education',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'ACIC educational services are managed and overseen by a board of education called Maktab Board of Education (MBE) which is established to uplift the method of teaching and to organize the distribution of workflow. MBE is an independent body with its own policies and procedures, overseen by the Director of Education and ACIC Board.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // MBE Members
                  Text(
                    'The MBE consists of:',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  _buildBulletPoint('Principal', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Vice Principal & Communication', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Head of Quran Department', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Head of Islamic Studies Department', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Head of Farsi Department', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Head of Early Child Education', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Treasurer', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Office Administrator', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Events Coordinator', bodyFontSize, verticalPadding),
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
                          'More Information',
                          style: TextStyle(
                            fontSize: subheadingFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'For more info on Maktab services please visit:',
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: AppColors.primaryDark,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'www.maktab.com',
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
      padding: EdgeInsets.only(bottom: verticalPadding * 0.3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: AppColors.primaryDark,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
