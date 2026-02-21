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

          // ===== MENU ITEMS =====
          _buildTile(
            icon: Icons.home,
            title: "Home",
            onTap: () {},
          ),

          // About section with submenu items
          ExpansionTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text("About"),
            children: [
              _subTile("Our History"),
              _subTile("Board Of Directors"),
              _subTile("Former Board Members"),
            ],
          ),

          // Expandable Services
          ExpansionTile(
            leading: const Icon(Icons.handshake, color: Colors.green),
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

          _buildTile(
            icon: Icons.card_membership,
            title: "Membership",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.store,
            title: "Marketplace",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.book,
            title: "Publication",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.phone,
            title: "Contact",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.attach_money,
            title: "Donation",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.privacy_tip,
            title: "Privacy Policy",
            onTap: () {},
          ),

          _buildTile(
            icon: Icons.description,
            title: "Terms & Condition",
            onTap: () {},
          ),

          const Divider(),

          _buildTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () {},
          ),

          const Divider(color: Colors.black),
        ],
      ),
    );
  }

  // Main Tile
  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.green,
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
