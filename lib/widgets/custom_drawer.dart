import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Use ListView so the header image and the menu items all scroll together
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ===== HEADER =====
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Image.asset(
                  'assets/drawer.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              // Close button in top right corner
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFBD995F),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
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
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          // About section with submenu items
          ExpansionTile(
            leading: const Icon(Icons.info, color: Color(0xFF2D5016)),
            title: const Text("About"),
            children: [
              _subTile("Our History"),
              _subTile("Board Of Directors"),
              _subTile("Former Board Members"),
            ],
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          // Expandable Services
          ExpansionTile(
            leading: const Icon(Icons.handshake, color: Color(0xFF2D5016)),
            title: const Text("Services"),
            children: [
              _subTile("Education Services"),
              _subTile("Funeral Services"),
              _subTile("Cultural Services"),
              _subTile("Women Services"),
              _subTile("Youth Services"),
              _subTile("Library"),
            ],
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.card_membership,
            title: "Membership",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.store,
            title: "Marketplace",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.book,
            title: "Publication",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.phone,
            title: "Contact",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.attach_money,
            title: "Donation",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.description,
            title: "Terms & Condition",
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),

          _buildTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
        ],
      ),
    );
  }

  // Main Tile
  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = const Color(0xFF2D5016),
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      onTap: onTap,
    );
  }

  // Sub Tile for Services
  Widget _subTile(String title) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 72),
      title: Text(title),
      onTap: () {},
    );
  }
}
