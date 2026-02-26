import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import '../newcustomdrawer.dart';
import '../services/auth_manager.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/app_routes.dart';
import '../widgets/bottom_nav_screen.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AuthManager().isLoggedIn ? NewCustomDrawer() : CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16 * widthScale),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20 * scales.heightScale),
                _buildInputField("Full Name", isTablet, isRequired: true),
                _buildInputField("Email Address", isTablet, isRequired: true),
                _buildInputField("Phone Number", isTablet),
                _buildInputField("Subject", isTablet, isRequired: true),
                _buildInputField("Message", isTablet, maxLines: 5, isRequired: true),
                _buildCaptchaField(isTablet, widthScale),
                SizedBox(height: 20 * scales.heightScale),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50 * scales.heightScale),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Send Message",
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 4, // Contact
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToAbout(context);
              break;
            case 1:
              AppRoutes.goToCalendar(context);
              break;
            case 2:
              AppRoutes.goToHome(context);
              break;
            case 3:
              AppRoutes.goToServices(context);
              break;
            case 4:
              AppRoutes.goToContact(context);
              break;
            case 5:
              AppRoutes.goToDonation(context);
              break;
          }
        },
        scales: scales,
      ),
    );
  }

  Widget _buildInputField(String label, bool isTablet,
      {int maxLines = 1, bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: "Enter $label",
              hintStyle: TextStyle(
                fontSize: isTablet ? 18 : 16,
                color: Colors.grey.shade500,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: maxLines > 1 ? 16 : 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                const BorderSide(color: AppColors.borderPrimary, width: 2),
              ),
            ),
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaptchaField(bool isTablet, double widthScale) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Captcha",
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.lightGreenBackground,
              borderRadius: BorderRadius.circular(8 * widthScale),
              border: Border.all(color: AppColors.borderPrimary),
            ),
            child: Row(
              children: [
                const Icon(Icons.security, color: AppColors.iconPrimary),
                const SizedBox(width: 12),
                Text(
                  "X8K9P2",
                  style: TextStyle(
                    fontSize: isTablet ? 22 : 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    letterSpacing: 4,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh,
                      color: AppColors.textPrimary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Captcha",
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}