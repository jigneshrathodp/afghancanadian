import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isAboutExpanded = false;
  bool _isServicesExpanded = false;

  void _navigateToScreen(BuildContext context, String routeName) {
    Navigator.of(context).pop();
    AppRoutes.navigateTo(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = isTablet ? screenWidth * 0.5 : screenWidth * 0.75;

    // Calculate image height based on drawer width to maintain aspect ratio
    final imageHeight = drawerWidth / 1.2;

    return Drawer(
      width: drawerWidth,
      backgroundColor: Colors.white,
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
          // Home
          _buildTile(
            icon: Icons.home,
            title: "Home",
            onTap: () => _navigateToScreen(context, AppRoutes.home),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // About with submenu
          _buildExpandableTile(
            icon: Icons.info,
            title: "About",
            isExpanded: _isAboutExpanded,
            onTap: () {
              setState(() {
                _isAboutExpanded = !_isAboutExpanded;
              });
            },
            widthScale: widthScale,
            isTablet: isTablet,
            children: [
              _buildSubTile(
                title: "Our History",
                onTap: () => _navigateToScreen(context, AppRoutes.about),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Board Of Directors",
                onTap: () => _navigateToScreen(context, AppRoutes.boardOfDirectors),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Former Board Members",
                onTap: () => _navigateToScreen(context, AppRoutes.formerBoardMembers),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Services with submenu
          _buildExpandableTile(
            icon: Icons.miscellaneous_services,
            title: "Services",
            isExpanded: _isServicesExpanded,
            onTap: () {
              setState(() {
                _isServicesExpanded = !_isServicesExpanded;
              });
            },
            widthScale: widthScale,
            isTablet: isTablet,
            children: [
              _buildSubTile(
                title: "Education Services",
                onTap: () => _navigateToScreen(context, AppRoutes.educationService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Funeral Services",
                onTap: () => _navigateToScreen(context, AppRoutes.funeralService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Cultural Services",
                onTap: () => _navigateToScreen(context, AppRoutes.culturalService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Women Services",
                onTap: () => _navigateToScreen(context, AppRoutes.womenService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Youth Services",
                onTap: () => _navigateToScreen(context, AppRoutes.youthService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
              _buildSubTile(
                title: "Library Services",
                onTap: () => _navigateToScreen(context, AppRoutes.libraryService),
                widthScale: widthScale,
                isTablet: isTablet,
              ),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Membership
          _buildTile(
            icon: Icons.people,
            title: "Membership",
            onTap: () => _navigateToScreen(context, AppRoutes.membership),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Marketplace
          _buildTile(
            icon: Icons.store,
            title: "Marketplace",
            onTap: () => _navigateToScreen(context, AppRoutes.marketplace),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Publication
          _buildTile(
            icon: Icons.article,
            title: "Publication",
            onTap: () => _navigateToScreen(context, AppRoutes.publications),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Contact
          _buildTile(
            icon: Icons.contact_phone,
            title: "Contact",
            onTap: () => _navigateToScreen(context, AppRoutes.contact),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Donation
          _buildTile(
            icon: Icons.volunteer_activism,
            title: "Donation",
            onTap: () => _navigateToScreen(context, AppRoutes.donation),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Privacy Policy
          _buildTile(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            onTap: () => _navigateToScreen(context, AppRoutes.privacyPolicy),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Terms & Condition
          _buildTile(
            icon: Icons.description,
            title: "Terms & Condition",
            onTap: () => _navigateToScreen(context, AppRoutes.termsAndConditions),
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Logout
          _buildTile(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              Navigator.of(context).pop();
              // Add logout logic here if needed
            },
            widthScale: widthScale,
            isTablet: isTablet,
            textColor: Colors.red,
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
    required double widthScale,
    required bool isTablet,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black, 
          fontSize: isTablet ? 18 : (16 * widthScale)
        ),
      ),
      onTap: onTap,
    );
  }

  // Expandable Tile with Arrow Indicator
  Widget _buildExpandableTile({
    required IconData icon,
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
    required double widthScale,
    required bool isTablet,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: isTablet ? 18 : (16 * widthScale),
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: AppColors.iconPrimary,
            size: isTablet ? 28 : (24 * widthScale),
          ),
          onTap: onTap,
        ),
        if (isExpanded) ...children,
      ],
    );
  }

  // Sub Menu Tile
  Widget _buildSubTile({
    required String title,
    required VoidCallback onTap,
    required double widthScale,
    required bool isTablet,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 56 * widthScale, right: 16 * widthScale),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: isTablet ? 16 : (14 * widthScale),
        ),
      ),
      onTap: onTap,
    );
  }
}