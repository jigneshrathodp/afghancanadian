import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/service_detail_wrapper.dart';
import 'package:afghancanadian/services/cultural_service_screen.dart';
import 'package:afghancanadian/services/education_service_screen.dart';
import 'package:afghancanadian/boardofdirectoes_screen.dart';
import 'package:afghancanadian/form.dart';
import 'package:afghancanadian/formar_board_member_screen.dart';
import 'package:afghancanadian/services/funeral_service_screen.dart';
import 'package:afghancanadian/services/library_service_screen.dart';
import 'package:afghancanadian/membership.dart';
import 'package:afghancanadian/privacypolicy.dart';
import 'package:afghancanadian/termsandcondtions.dart';
import 'package:afghancanadian/services/women_service_screen.dart';
import 'package:afghancanadian/services/youth_service_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _navigateToBottomNav(BuildContext context, int index) {
    Navigator.of(context).pop();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => BottomNavScreen(initialIndex: index)),
      (route) => false,
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void _navigateToService(BuildContext context, Widget serviceScreen, String title) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ServiceDetailWrapper(
          title: title,
          currentNavIndex: 3, // Services tab
          child: serviceScreen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = isTablet ? screenWidth * 0.5 : screenWidth * 0.75;

    // Calculate image height based on drawer width to maintain aspect ratio
    // Original image aspect ratio approximately 1.2:1 (width:height)
    final imageHeight = drawerWidth / 1.2;

    return Drawer(
      width: drawerWidth,
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
            icon: Icons.home,
            title: "Home",
            onTap: () => _navigateToBottomNav(context, 2), // Home tab index
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // About section with submenu items
          ExpansionTile(
            leading: Icon(Icons.info, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
            title: Text("About", style: TextStyle(fontSize: isTablet ? 18 : (16 * widthScale))),
            children: [
              _subTile("Our History", widthScale, isTablet, onTap: () => _navigateToBottomNav(context, 0)), // About tab index
              _subTile("Board Of Directors", widthScale, isTablet, onTap: () => _navigateToScreen(context, const BoardOfDirectorsScreen())),
              _subTile("Former Board Members", widthScale, isTablet, onTap: () => _navigateToScreen(context, const DropdownScreen())),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Expandable Services
          ExpansionTile(
            leading: Icon(Icons.handshake, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
            title: Text("Services", style: TextStyle(fontSize: isTablet ? 18 : (16 * widthScale))),
            children: [
              _subTile("Education Services", widthScale, isTablet, onTap: () => _navigateToService(context, const EducationServiceScreen(), 'Education Services')),
              _subTile("Funeral Services", widthScale, isTablet, onTap: () => _navigateToService(context, const FuneralServiceScreen(), 'Funeral Services')),
              _subTile("Cultural Services", widthScale, isTablet, onTap: () => _navigateToService(context, const CulturalServiceScreen(), 'Cultural Services')),
              _subTile("Women Services", widthScale, isTablet, onTap: () => _navigateToService(context, const WomenServiceScreen(), 'Women Services')),
              _subTile("Youth Services", widthScale, isTablet, onTap: () => _navigateToService(context, const YouthServiceScreen(), 'Youth Programs')),
              _subTile("Library Services", widthScale, isTablet, onTap: () => _navigateToService(context, const Libraryservicescreen(), 'Library Services')),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.card_membership,
            title: "Membership",
            onTap: () => _navigateToScreen(context, const MembershipScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.store,
            title: "Marketplace",
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.book,
            title: "Publication",
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.phone,
            title: "Contact",
            onTap: () => _navigateToBottomNav(context, 4), // Contact tab index
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.attach_money,
            title: "Donation",
            onTap: () => _navigateToBottomNav(context, 5), // Donation tab index
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            onTap: () => _navigateToScreen(context, const PrivacyPolicyScreen()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.description,
            title: "Terms & Condition",
            onTap: () => _navigateToScreen(context, const termsandcondtions()),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: AppColors.iconError,
            textColor: AppColors.iconError,
            onTap: () {},
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

  // Sub Tile for Services
  Widget _subTile(String title, double widthScale, bool isTablet, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 72 * widthScale),
      title: Text(title, style: TextStyle(fontSize: isTablet ? 16 : (14 * widthScale))),
      onTap: onTap ?? () {},
    );
  }
}
