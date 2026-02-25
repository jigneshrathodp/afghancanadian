import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class FuneralServiceScreen extends StatelessWidget {
  const FuneralServiceScreen({super.key});

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
                      'Funeral Service',
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
                    'The ACIC has been committed to provide full emotional support in the event of death within the community by providing full funeral and burial services ranging from taking care of the official paper work to the transportation of the Jenaza (dead body) from home or hospital to the ACIC centre and also the Taghseel, Takfeen, Jenaza prayer and Tadfeen.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Membership Coverage
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
                        Text(
                          'Membership Coverage',
                          style: TextStyle(
                            fontSize: subheadingFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        SizedBox(height: verticalPadding * 0.5),
                        Text(
                          'ACIC covers the complete funeral and burial cost if the deceased was an active member over the last three years and does not have any outstanding balance regarding membership dues.',
                          style: TextStyle(
                            fontSize: bodyFontSize,
                            color: AppColors.textPrimary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Non-Members Fees
                  Text(
                    'Non-Members Fees',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'The non-members or members who are not eligible have to pay the following fees:',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  _buildBulletPoint('\$5,000 grave cost at Elgin Mills Cemetery or \$4,000 for Toronto Muslim Cemetery', bodyFontSize, verticalPadding),
                  _buildBulletPoint('\$1,600-\$2,500 for coffin, transportation, and paperwork (to be paid to the external funeral service provider)', bodyFontSize, verticalPadding),
                  _buildBulletPoint('\$1,275 cemetery service fee for opening and closing of a grave (to be paid to the cemetery)', bodyFontSize, verticalPadding),
                  _buildBulletPoint('\$2,000 ACIC service charge (Taghseel, Takfeen, Tadfeen and Fateha.)', bodyFontSize, verticalPadding),
                  SizedBox(height: verticalPadding * 0.5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(verticalPadding * 0.8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Note: \$1,000 service fee applies to non-members who use ACIC\'s Taghseel, and Takfeen services only.',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),

                  // Fateha and Khatem-e Quran
                  Text(
                    'Fateha and Khatem-e Quran',
                    style: TextStyle(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'ACIC provides complete Fateha and Khatem-e Quran service to members as well as non-members such as booking of Quran reciters, speakers, and catering service.\n\n'
                    'According to the resolution passed at the general meeting, Fateha majlis can be conducted only on alternate Sundays from 10:00 am to 12:00 pm.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Fee Section
                  Text(
                    'Fee',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'There is no charge by the members for Fateha majlis, but donations are accepted to meet the expenses of utilities, maintenance and hygiene, honorarium of Quran reciters and speakers, and serving tea, etc.\n\n'
                    'Non-members will be charged \$500 for hosting a Fateha.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Announcements
                  Text(
                    'Announcements',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Announcements of Fateha must be in Farsi/Dari and emailed to info@afghancanada.com. In order to make the announcement brief, it is recommended to only list immediate family members\' names and not mention children\'s names.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Serving Food
                  Text(
                    'Serving Food',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Even though, ACIC recommends not serving food after Fateha and instead sending the money to feed poor people in Afghanistan, members can host their guests by serving food after the Fateha.\n\n'
                    'Members can only serve their guests rice and one stew (khoresh), salad, and bottled water according to the ACIC general assembly resolution.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Catering
                  Text(
                    'Catering',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'ACIC provides catering for your Fateha and Khatem-e Quran gatherings. The catering for at least 100 individuals needs to be ordered. It would be \$10 per person.\n\n'
                    'For more than one Fateha, the host families will split the cost according to the number of their guests.',
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: AppColors.textPrimary,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: verticalPadding),

                  // Contact
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
                          'To place catering orders or book your Fateha or Khatem-e Quran, email Director of Logistics at:',
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
                  SizedBox(height: verticalPadding),

                  // Cleaning
                  Text(
                    'Cleaning',
                    style: TextStyle(
                      fontSize: subheadingFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.customGold,
                    ),
                  ),
                  SizedBox(height: verticalPadding * 0.5),
                  Text(
                    'Although ACIC volunteers are always ready to clean up after a Fateha, we also request that host families designate a few individuals to assist volunteers in serving food, and cleaning up the halls after the majlis. This will leave the center clean and prepared for the next event.',
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
