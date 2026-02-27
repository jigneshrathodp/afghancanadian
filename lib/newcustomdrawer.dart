import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/clientscreens/credit_change_password_screen.dart';
import 'package:afghancanadian/clientscreens/edit_profile_screen.dart';
import 'package:afghancanadian/clientscreens/credit_card_on_file_screen.dart';
import 'package:afghancanadian/clientscreens/contact_payment_screen.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/services/auth_manager.dart';
import 'package:flutter/material.dart';

class NewCustomDrawer extends StatelessWidget {
  const NewCustomDrawer({super.key});

  void _navigateToBottomNav(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        // Dashboard - Navigate to client dashboard
        AppRoutes.goToClientHome();
        break;
      case 1:
        // Membership Details - Navigate to membership screen
        AppRoutes.goToContactMembership();
        break;
      case 2:
        // Home - Navigate to main home screen
        AppRoutes.goToHome();
        break;
      case 3:
        // Invoice - Navigate to invoice screen
        AppRoutes.goToContactInvoice();
        break;
      case 4:
        // Contact - Navigate to contact screen
        AppRoutes.goToContact();
        break;
      case 5:
        // Donation - Navigate to donation screen
        AppRoutes.goToContactDonation();
        break;
    }
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pop();
    // For screens that don't have named routes, we keep the direct navigation
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = isTablet ? screenWidth * 0.5 : screenWidth * 0.75;

    // Calculate image height based on drawer width to maintain aspect ratio
    // Original image aspect ratio approximately 1.2:1 (width:height)
    final imageHeight = drawerWidth / 1.2;

    return Drawer(
      width: drawerWidth,
      backgroundColor: Colors.white,
      // Use ListView so the header image and the menu items all scroll together
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ===== HEADER =====
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: imageHeight,
                child: Image.asset(
                  'assets/drawer.png',
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              // Close button in top right corner
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: isTablet ? 44 : 36,
                    height: isTablet ? 44 : 36,
                    decoration: BoxDecoration(
                      color: AppColors.closeButtonBackground,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowDark,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.closeButtonIcon,
                      size: isTablet ? 24 : 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== MENU ITEMS =====
          _buildTile(
            icon: Icons.dashboard,
            title: "Dashboard",
            onTap: () => _navigateToBottomNav(context, 0),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.person,
            title: "My Profile",
            onTap: () => _navigateToScreen(context, const EditProfileScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.card_membership,
            title: "Membership Details",
            onTap: () => _navigateToBottomNav(context, 1),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.credit_card,
            title: "Credit Card On File",
            onTap: () => _navigateToScreen(context, const CreditCardOnFileScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.favorite,
            title: "Donation",
            onTap: () => _navigateToBottomNav(context, 5),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.receipt,
            title: "Invoice",
            onTap: () => _navigateToBottomNav(context, 3),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.payment,
            title: "Payment",
            onTap: () => _navigateToScreen(context, const ContactPaymentScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.lock,
            title: "Change Password",
            onTap: () => _navigateToScreen(context, const CreditChangePasswordScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: AppColors.iconError,
            textColor: AppColors.iconError,
            onTap: () async {
              Navigator.of(context).pop();
              await AuthManager().logout();
              AppRoutes.goToHome();
            },
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),
        ],
      ),
    );
  }

  // Main Tile
  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = AppColors.iconPrimary,
    Color textColor = Colors.black,
    required double widthScale,
    required bool isTablet,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: isTablet ? 28 : (24 * widthScale)),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: isTablet ? 18 : (16 * widthScale)),
      ),
      onTap: onTap,
    );
  }
}
