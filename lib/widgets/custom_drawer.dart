import 'package:flutter/material.dart';
class CustomDrawer extends StatelessWidget {

  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ===== HEADER =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F6B2E), Color(0xFF4CAF50)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: const [
                Icon(Icons.mosque, color: Colors.white, size: 60),
                SizedBox(height: 10),
                Text(
                  "Hameed Zarabi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Welcome to Afghan Canadian Islamic Community",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ===== MENU ITEMS =====
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                _buildTile(
                  icon: Icons.home,
                  title: "Home",
                  onTap: () {},
                ),

                _buildTile(
                  icon: Icons.info,
                  title: "About",
                  onTap: () {},
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
              ],
            ),
          ),
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
