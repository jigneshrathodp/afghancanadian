import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import '../newcustomdrawer.dart';
import '../services/auth_manager.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';
import '../widgets/bottom_nav_screen.dart';
import '../controllers/contact_controller.dart';
import '../controllers/auth_controller.dart';
import '../new_bottomNavScreen.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Get.find<AuthController>().isLoggedIn.value ? NewCustomDrawer() : CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16 * widthScale),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16 * widthScale,
                    vertical: 12 * scales.heightScale,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16 * scales.heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Center(
                    child: Text(
                      'CONTACT US',
                      style: TextStyle(
                        fontSize: 20 * widthScale,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1B5E20),
                      ),
                    ),
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

                SizedBox(height: 24 * scales.heightScale),

                // Contact Info Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(isTablet ? 24 : 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderPrimary),
                  ),
                  child: Column(
                    children: [
                      // Phone
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone,
                              size: isTablet ? 28 : 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "(416) 757-2553",
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const Divider(color: AppColors.divider, thickness: 1),
                      const SizedBox(height: 20),

                      // Email
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.email,
                              size: isTablet ? 28 : 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "support@afghancanada.com",
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      const Divider(color: AppColors.divider, thickness: 1),
                      const SizedBox(height: 20),

                      // Address
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.location_on,
                              size: isTablet ? 28 : 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "22 Hobson Ave, North York,\nON M4A 1Y2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20 * scales.heightScale),

                // Map Section
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      "assets/map.png",
                      height: isTablet ? 300 : 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Get.find<AuthController>().isLoggedIn.value 
        ? NewCustomBottomBar(
            selectedIndex: 4, // Contact
            onIndexChanged: (index) {
              switch (index) {
                case 0:
                  Get.toNamed(AppRoutes.dashboard);
                  break;
                case 1:
                  Get.toNamed(AppRoutes.contactMembership);
                  break;
                case 2:
                  Get.toNamed(AppRoutes.home);
                  break;
                case 3:
                  Get.toNamed(AppRoutes.contactInvoice);
                  break;
                case 4:
                  // Already on contact screen
                  break;
                case 5:
                  Get.toNamed(AppRoutes.contactDonation);
                  break;
              }
            },
            scales: scales,
          )
        : CustomBottomBar(
            selectedIndex: 4, // Contact
            onIndexChanged: controller.onBottomNavChanged,
            scales: scales,
          ),
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