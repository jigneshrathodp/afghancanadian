import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactMembershipScreen extends StatelessWidget {
  const ContactMembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
            child: Column(
              children: [
                // Main Card Container with Header and Content
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16 * widthScale),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Green Header with Title
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16 * widthScale),
                            topRight: Radius.circular(16 * widthScale),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Membership Details',
                            style: TextStyle(
                              fontSize: 18 * widthScale,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Content Padding
                      Padding(
                        padding: EdgeInsets.all(16 * widthScale),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // MEMBERSHIP CARD Label
                            Text(
                              'MEMBERSHIP CARD',
                              style: TextStyle(
                                fontSize: 12 * widthScale,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 8 * heightScale),
                            // Membership Card Container
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20 * widthScale),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(16 * widthScale),
                              ),
                              child: Column(
                                children: [
                                  // Logo
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/greenacic.png',
                                        width: 90 * widthScale,
                                        height: 90 * widthScale,
                                      ),
                                      SizedBox(width: 4 * widthScale),
                                      Image.asset(
                                        'assets/blackacic.png',
                                        width: 120 * widthScale,
                                        height: 120 * widthScale,
                                      ),
                                    ],
                                  ),
                                  // Member Name
                                  Text(
                                    'TEST CONTACT ACIC',
                                    style: TextStyle(
                                      fontSize: 16 * widthScale,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 4 * heightScale),
                                  // Member ID
                                  Text(
                                    'Member ID : 54881852',
                                    style: TextStyle(
                                      fontSize: 14 * widthScale,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  SizedBox(height: 4 * heightScale),
                                  // Valid Until
                                  Text(
                                    'Valid Until Mon, Dec 01, 2025',
                                    style: TextStyle(
                                      fontSize: 14 * widthScale,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12 * heightScale),
                            // Image Info Text
                            Center(
                              child: Text(
                                'Image Optimized For Smartphone | Printable pdf',
                                style: TextStyle(
                                  fontSize: 11 * widthScale,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                            SizedBox(height: 20 * heightScale),
                            // Membership Details List
                            _buildDetailRow('Membership Level', 'Single Monthly', widthScale, heightScale),
                            _buildDetailRowWithBadge('Membership\nStatus', 'Active', widthScale, heightScale),
                            _buildDetailRow('Member Since', 'Thu, Nov 13, 2025', widthScale, heightScale),
                            _buildDetailRow('Renewal Due On', 'Mon, Dec 01, 2025', widthScale, heightScale),
                            _buildDetailRow('Payment Type', 'Monthly', widthScale, heightScale),
                            _buildDetailRowMultiLine(
                              'Payment Terms',
                              'Pay Authorized with Bank\nTransit or Branch #bank\nFinancial institution #bank\nAccount #bank',
                              widthScale,
                              heightScale,
                            ),
                            _buildDetailRow('Renewal Date Last\nChanged', 'Thu, Nov 13, 2025', widthScale, heightScale),
                            _buildDetailRow('Level Last\nChanged', 'Thu, Jan 01, 1970', widthScale, heightScale),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16 * heightScale),
                // Support Message (Outside main card)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16 * widthScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Text(
                    '*To update any details for membership or to delete membership please contact support',
                    style: TextStyle(
                      fontSize: 12 * widthScale,
                      color: const Color(0xFFE53935),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20 * heightScale),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: 1, // Membership
        onIndexChanged: (index) {
          if (index != 1) { // Don't navigate if already on membership
            switch (index) {
              case 0:
                Get.toNamed(AppRoutes.dashboard);
                break;
              case 2:
                Get.toNamed(AppRoutes.home);
                break;
              case 3:
                Get.toNamed(AppRoutes.contactInvoice);
                break;
              case 4:
                Get.toNamed(AppRoutes.contact);
                break;
              case 5:
                Get.toNamed(AppRoutes.contactDonation);
                break;
            }
          }
        },
        scales: scales,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12 * heightScale),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRowWithBadge(String label, String value, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12 * heightScale),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12 * widthScale,
              vertical: 4 * heightScale,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(16 * widthScale),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRowMultiLine(String label, String value, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12 * heightScale),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
