import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/bottom_nav_screen.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

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

    final scales = ResponsiveHelper.getScales(context);
    
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
                      'Membership',
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
                    'ACIC membership is available only to individuals interested in furthering the objectives of the organization, aged 18+, who have applied and have been accepted for membership in the Corporation by the Board of Directors.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Membership Conditions
                  Text(
                    'Membership Conditions',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'All members are required to obey the ACIC by-law, resolutions passed by the general meetings and written policies of the ACIC.\n\n'
                    'In the case of termination of membership, whether by resignation or expulsion, a member shall remain liable for payment of any arrears which become payable by him/her to the organization at the time of termination.\n\n'
                    'The Board has the authority to suspend or expel any member from the Corporation for any one or more of the following grounds: violating any provision of the articles, by-laws or written policies of the organization; carrying out any conduct which may be detrimental to the Organization as determined by the Board in its sole discretion; and for any other reason that the board in its sole and absolute discretion considers to be reasonable, having regard to the purpose of the organization.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Membership Classes
                  Text(
                    'Membership Classes',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'There are two classes of members in the ACIC:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),

                  // Class A Member
                  Text(
                    'Class "A" Member',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  Text(
                    'A Class "A" member is entitled to vote in the general meetings and can be nominated for a position on the Board of Directors after three years of membership.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.5),

                  // Class B Member
                  Text(
                    'Class "B" Member',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.3),
                  Text(
                    'A Class "B" member is non-voting member; however, he/she will automatically be converted to a Class "A" voting member following one full year of membership as a Class B non-voting member.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Membership Fee
                  Text(
                    'Membership Fee',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'The membership fee is fixed by resolution of the Board and sanctioned by a majority vote at a general meeting of members.\n\n'
                    '2025 – New Membership groups and fees:\n\n'
                    'In an effort to serve its members better, ACIC has introduced new membership groups with new membership dues as follows:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding * 0.5),

                  // Fee Structure Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(verticalPadding),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderPrimary),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFeeRow('Family membership:', '\$600 annual / \$50 monthly', bodyFontSize),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'Note: A family membership fee covers parents and their children under 18. Children older than 18 or other relatives of the applicants such as father or mother, no matter if they live in the same house, should pay a separate membership fee.',
                          style: TextStyle(
                            fontSize: bodyFontSize * 0.9,
                            color: AppColors.textPrimary,
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: verticalPadding),
                        _buildFeeRow('Individual (Age 26+):', '\$300 annual / \$25 monthly', bodyFontSize),
                        SizedBox(height: verticalPadding * 0.5),
                        _buildFeeRow('Youth (Ages 18 to 25):', '\$150 annual / \$12.50 monthly', bodyFontSize),
                        SizedBox(height: verticalPadding),
                        Container(
                          padding: EdgeInsets.all(verticalPadding * 0.5),
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Newcomer discount:\n50% membership fees for the first two years after arrival in Canada.',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Membership Benefits
                  Text(
                    'Membership Benefits',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'All Class "A" Members are entitled to receive the following benefits:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),

                  // Benefits List
                  _buildBulletPoint('Discount on Maktab/school fees', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Exemption from hall rental fees', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Access to burial assistance programs & exemption from Fateha fees', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Right to vote at the annual general meetings or any special general meeting', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Right to be nominated for a position on the Board of Directors after three years of active membership', bodyFontSize, verticalPadding),
                  _buildBulletPoint('Eligibility to serve on committees and apply for ACIC annual scholarship', bodyFontSize, verticalPadding),

                  SizedBox(height: verticalPadding * 0.5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(verticalPadding * 0.8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderPrimary),
                    ),
                    child: Text(
                      'Note: To be entitled to these benefits, all membership dues should have been paid on time.',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: -1, // No item selected
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToAbout();
              break;
            case 1:
              AppRoutes.goToCalendar();
              break;
            case 2:
              AppRoutes.goToHome();
              break;
            case 3:
              AppRoutes.goToServices();
              break;
            case 4:
              AppRoutes.goToContact();
              break;
            case 5:
              AppRoutes.goToDonation();
              break;
          }
        },
        scales: scales,
      ),
    );
  }

  Widget _buildFeeRow(String label, String value, double fontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
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
