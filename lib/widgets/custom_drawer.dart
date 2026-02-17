import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onCalendarPressed;
  final VoidCallback? onServicesPressed;
  final VoidCallback? onContactPressed;
  final VoidCallback? onDonationPressed;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onLogoutPressed;

  const CustomDrawer({
    super.key,
    this.onHomePressed,
    this.onAboutPressed,
    this.onCalendarPressed,
    this.onServicesPressed,
    this.onContactPressed,
    this.onDonationPressed,
    this.onSettingsPressed,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF2D5016),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 60 * widthScale,
                  width: 60 * widthScale,
                ),
                SizedBox(height: 10 * widthScale),
                Text(
                  'Afghan Canadian',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16 * widthScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Islamic Community',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * widthScale,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onHomePressed != null) {
                onHomePressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onAboutPressed != null) {
                onAboutPressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.event, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Events Calendar',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onCalendarPressed != null) {
                onCalendarPressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.miscellaneous_services_outlined, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Our Services',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onServicesPressed != null) {
                onServicesPressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone_outlined, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Contact Us',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onContactPressed != null) {
                onContactPressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.volunteer_activism_outlined, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Donations',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onDonationPressed != null) {
                onDonationPressed!();
              }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onSettingsPressed != null) {
                onSettingsPressed!();
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: const Color(0xFF2D5016), size: 24 * widthScale),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 16 * widthScale),
            ),
            onTap: () {
              if (onLogoutPressed != null) {
                onLogoutPressed!();
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}