import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
    final bodyFontSize = screenWidth * 0.04 > 16 ? 16.0 : screenWidth * 0.04;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
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
                      'ABOUT US',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Background Section
                  Text(
                    'Background',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Afghan Canadian Islamic Community is a non-profit charitable organization providing cultural, social and religious services.\n\n'
                    'ACIC began its activities as a small community association in 1989 in response to the growing need of Afghan immigrants for a place where they can practice their religion, traditions, and celebrate cultural ceremonies. Two years later, in 1991, the organization was officially registered with the Government of Canada.\n\n'
                    'ACIC currently serves approximately 1,400 families and individual members, along with hundreds of non-members who actively participate in our programs and benefit from our services.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Vision Section
                  Text(
                    'Vision',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'A dynamic and inclusive community that constantly thrives towards cultural, social and spiritual growth.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Mission Statement Section
                  Text(
                    'Mission Statement',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'To help members of the community make a positive difference by educating, inspiring and empowering them through a variety of educational and cultural programs.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
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
}