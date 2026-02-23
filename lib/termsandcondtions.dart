import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class termsandcondtions extends StatelessWidget {
  const termsandcondtions({super.key});

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
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Introduction
                  Text(
                    'Welcome to the website of the Afghan Canadian Islamic Community ("we," "our," "the Community"). By accessing or using our website, services, or online platforms, you agree to comply with the following Terms and Conditions. Please read them carefully before proceeding.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 1
                  Text(
                    '1. Acceptance of Terms',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'By using this website, you acknowledge that you have read, understood, and agreed to be bound by these Terms and Conditions, as well as our Privacy Policy. If you do not agree with any part of these terms, please discontinue use of this website.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 2
                  Text(
                    '2. Use of Website',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'You agree to use this website only for lawful and community-appropriate purposes. You may not:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  _buildBulletPoint('Engage in activities that disrupt or interfere with the functioning of the site', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Attempt to gain unauthorized access to any part of the site, server, or data', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Use the website to transmit harmful, offensive, or misleading information', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Copy, distribute, or modify content without explicit permission', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding * 0.3),
                  Text(
                    'All content on this site—including text, images, graphics, and logos—is the property of the Afghan Canadian Islamic Community or its respective owners and may not be reproduced without authorization.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 3
                  Text(
                    '3. Donations, Payments, and Online Transactions',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'When making donations or payments through our website, you agree that:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  _buildBulletPoint('You are providing accurate and complete information', bodyFontSize, verticalPadding),
                  _buildBulletPoint('You are authorized to use the credit card or payment method provided', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Certain information (such as your name and credit card details) may be securely shared with our trusted payment processor solely to complete the transaction', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding * 0.3),
                  Text(
                    'We use industry-standard SSL encryption to protect your data during transmission. However, no online system can guarantee absolute security, and you acknowledge this inherent risk. All payments are final unless otherwise required by law or at the discretion of the organization.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 4
                  Text(
                    '4. External Links',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Our website may contain links to third-party websites for convenience or additional resources. We do not control these sites and are not responsible for their content, accuracy, or privacy practices. Accessing third-party sites is at your own discretion and risk.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 5
                  Text(
                    '5. Disclaimer of Liability',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'The Afghan Canadian Islamic Community provides website information on an "as-is" and "as-available" basis. While we strive to ensure accuracy, we make no guarantees regarding:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  _buildBulletPoint('Completeness or correctness of information', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Continuous or error-free website operation', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Freedom from viruses or harmful components', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding * 0.3),
                  Text(
                    'To the fullest extent permitted by law, we are not liable for any damages arising from the use or inability to use this website.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 6
                  Text(
                    '6. User Accounts and Registrations (If Applicable)',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'If the website offers account creation or event registration:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  _buildBulletPoint('You are responsible for maintaining the confidentiality of your login information', bodyFontSize, verticalPadding),
                  _buildBulletPoint('You are responsible for all activities conducted under your account', bodyFontSize, verticalPadding),
                  _buildBulletPoint('We reserve the right to suspend or terminate accounts that violate these terms', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding),

                  // Section 7
                  Text(
                    '7. Changes to Terms',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'We may update or modify these Terms and Conditions at any time without prior notice. The most current version will always be posted on our website. Continued use of the website indicates your acceptance of any changes.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 8
                  Text(
                    '8. Governing Law',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'These Terms and Conditions shall be governed by and interpreted in accordance with the laws of Canada and the applicable province where the Afghan Canadian Islamic Community operates.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 9
                  Text(
                    '9. Contact Information',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'If you have questions or concerns regarding these Terms and Conditions, please contact us directly. We are committed to supporting our community and providing clear, respectful communication.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Section 10
                  Text(
                    '10. Employee, Volunteer, and Teacher Information Collection',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'If you are an employee, volunteer, teacher, or teacher assistant with the Afghan Canadian Islamic Community, you acknowledge and agree that:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  _buildBulletPoint('We may collect certain personal information necessary for employment, volunteer management, safety, or operational purposes.', bodyFontSize, verticalPadding),
                  _buildBulletPoint('This may include, but is not limited to, your full name, contact information, background information, emergency contacts, and other relevant data.', bodyFontSize, verticalPadding),
                  _buildBulletPoint('In some cases, we may also collect biometric information, strictly for security, attendance, or identification purposes.', bodyFontSize, verticalPadding),
                  _buildBulletPoint('All collected information is handled in accordance with applicable Canadian privacy laws and our internal privacy policies.', bodyFontSize, verticalPadding),
                  _buildBulletPoint('If you are under the age of 18, you confirm that you have obtained full authorization and consent from a parent or legal guardian before providing any personal information or participating in employment, volunteer activities, or educational programs with the Community.', bodyFontSize, verticalPadding),
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
