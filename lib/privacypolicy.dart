import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                      'Privacy Policy',
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
                    'The Afghan Canadian Islamic Community is committed to protecting the personal privacy of all individuals who visit our website or interact with our organization. The following section outlines our privacy practices and the measures we take to safeguard your information.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Security and Information Collection
                  Text(
                    'Security and Information Collection',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'The Afghan Canadian Islamic Community does not automatically collect any personal information—such as your name, telephone number, email address, or home address—when you visit our website. Personal information is collected only when you voluntarily provide it to us through in-person interactions, email, telephone, online forms, or other direct means of communication.\n\n'
                    'For any online transactions processed through our website, we use 128-bit SSL (Secure Socket Layer) encryption to protect your information and ensure its confidentiality while in transit.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Use and Disclosure of Information
                  Text(
                    'Use and Disclosure of Information',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Any personal information you provide is accessible only to authorized personnel who require it to process your request, donation, registration, or other interaction with our organization.\n\n'
                    'For online payments, certain information—such as your first and last name, credit card number, and other necessary billing details—may be securely shared with our trusted credit card payment processor solely for the purpose of completing your transaction. This information is transmitted using secure, encrypted systems.\n\n'
                    'We do not create individual profiles, nor do we use your information for purposes beyond those you have consented to. Other than the payment-related information described above, we do not disclose personal information to any third party inside or outside the Afghan Canadian Islamic Community unless required or authorized by law.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Protection of Personal Information
                  Text(
                    'Protection of Personal Information',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'All personal information collected by the Afghan Canadian Islamic Community is safeguarded in accordance with the Personal Information Protection and Electronic Documents Act (PIPEDA) and other applicable Canadian privacy laws.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Questions or Concerns
                  Text(
                    'Questions or Concerns',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'If you have questions, concerns, or feedback about our privacy practices—or if you feel that your privacy has not been adequately protected—we encourage you to contact the Afghan Canadian Islamic Community directly. We are committed to addressing your concerns promptly and respectfully.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final widthScale = ResponsiveHelper.getWidthScale(context);

    return Container(
      height: 55 * widthScale,
      color: AppColors.navBackground,
      child: Padding(
        padding: EdgeInsets.only(left: 8 * widthScale, right: 8 * widthScale, bottom: 8 * widthScale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.info_outline, 'About', 0, context, widthScale),
            _buildNavItem(Icons.calendar_today_outlined, 'Calendar', 1, context, widthScale),
            _buildNavItem(Icons.home, 'Home', 2, context, widthScale),
            _buildNavItem(Icons.miscellaneous_services_outlined, 'Services', 3, context, widthScale),
            _buildNavItem(Icons.contact_phone_outlined, 'Contact', 4, context, widthScale),
            _buildNavItem(Icons.volunteer_activism_outlined, 'Donation', 5, context, widthScale),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, BuildContext context, double widthScale) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => BottomNavScreen(initialIndex: index),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.navUnselected,
            size: 24 * widthScale,
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.navUnselected,
              fontSize: 10 * widthScale,
            ),
          ),
        ],
      ),
    );
  }
}
