import 'package:afghancanadian/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);
    final heightScale = (screenHeight / 896).clamp(0.8, 1.2);
    final isTablet = screenWidth > 600;

    return Drawer(
      width: isTablet ? screenWidth * 0.5 : screenWidth * 0.75,
      // Use ListView so the header image and the menu items all scroll together
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ===== HEADER =====
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: isTablet ? 320 : (280 * heightScale),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Image.asset(
                  'assets/drawer.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: isTablet ? 340 : (300 * heightScale),
                ),
              ),
              // Close button in top right corner
              Positioned(
                top: 16 * heightScale,
                right: 16 * widthScale,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: isTablet ? 44 : (36 * widthScale),
                    height: isTablet ? 44 : (36 * widthScale),
                    decoration: BoxDecoration(
                      color: AppColors.closeButtonBackground,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowDark,
                          blurRadius: 4 * widthScale,
                          offset: Offset(0, 2 * heightScale),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.closeButtonIcon,
                      size: isTablet ? 24 : (20 * widthScale),
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
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // About section with submenu items
          ExpansionTile(
            leading: Icon(Icons.info, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
            title: Text("About", style: TextStyle(fontSize: isTablet ? 18 : (16 * widthScale))),
            children: [
              _subTile("Our History", widthScale, isTablet),
              _subTile("Board Of Directors", widthScale, isTablet),
              _subTile("Former Board Members", widthScale, isTablet),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          // Expandable Services
          ExpansionTile(
            leading: Icon(Icons.handshake, color: AppColors.iconPrimary, size: isTablet ? 28 : (24 * widthScale)),
            title: Text("Services", style: TextStyle(fontSize: isTablet ? 18 : (16 * widthScale))),
            children: [
              _subTile("Education Services", widthScale, isTablet),
              _subTile("Funeral Services", widthScale, isTablet),
              _subTile("Cultural Services", widthScale, isTablet),
              _subTile("Women Services", widthScale, isTablet),
              _subTile("Youth Services", widthScale, isTablet),
              _subTile("Library", widthScale, isTablet),
            ],
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.card_membership,
            title: "Membership",
            onTap: () {},
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
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.attach_money,
            title: "Donation",
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            onTap: () {},
            widthScale: widthScale,
            isTablet: isTablet,
          ),
          Divider(height: 1, indent: 16 * widthScale, endIndent: 16 * widthScale),

          _buildTile(
            icon: Icons.description,
            title: "Terms & Condition",
            onTap: () {},
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
  Widget _subTile(String title, double widthScale, bool isTablet) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 72 * widthScale),
      title: Text(title, style: TextStyle(fontSize: isTablet ? 16 : (14 * widthScale))),
      onTap: () {},
    );
  }
}
