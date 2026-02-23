import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  final List<String> formList = const [
    'Family Membership Form',
    'Individual Membership Form',
    'Pre-Authorized Credit Form',
    'Pre-Authorized Debit Form',
    'Bylaw - English',
    'Bylaw - Farsi',
    'Membership Info',
    'Funeral Service',
    'Khatme Quran',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    // Responsive padding and spacing
    final horizontalPadding = isTablet ? screenWidth * 0.1 : 24.0;
    final verticalPadding = screenHeight * 0.02 > 16 ? 16.0 : screenHeight * 0.02;

    // Responsive font sizes
    final titleFontSize = isTablet ? 28.0 : 22.0;
    final buttonFontSize = isTablet ? 18.0 : 16.0;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: verticalPadding * 1.5),
                    child: Text(
                      'Forms',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  // Form Buttons List
                  ...formList.map((formName) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: verticalPadding),
                      child: SizedBox(
                        width: double.infinity,
                        height: isTablet ? 55 : 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonPrimary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            shadowColor: AppColors.shadow,
                          ),
                          onPressed: () {
                            // Handle form button click
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: buttonFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/download.svg',
                                width: isTablet ? 22 : 18,
                                height: isTablet ? 22 : 18,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
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
