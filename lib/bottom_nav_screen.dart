import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'homescreen.dart';
import 'about_screen.dart';
import 'calendar_screen.dart';
import 'services_screen.dart';
import 'contact_screen.dart';
import 'donation_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedTabIndex = 0;
  int _selectedBottomNavIndex = 2; // Home tab is index 2

  @override
  Widget build(BuildContext context) {
    // Define the pages for each tab
    final List<Widget> pages = [
      // About page
      const AboutScreen(),
      // Calendar page
      const CalendarScreen(),
      // Home page (current content)
      Homescreen(),
      // Services page
      const ServicesScreen(),
      // Contact page
      const ContactScreen(),
      // Donation page
      const DonationScreen(),
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);

    return Scaffold(
      body: pages[_selectedBottomNavIndex],
      bottomNavigationBar: _buildBottomNavigationBar(widthScale),
    );
  }

  Widget _buildDrawer(double widthScale) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFF2D5016),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 60,
                  width: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Afghan Canadian',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Islamic Community',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Color(0xFF2D5016)),
            title: const Text('Home'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 2; // Home index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Color(0xFF2D5016)),
            title: const Text('About Us'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 0; // About index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Color(0xFF2D5016)),
            title: const Text('Events Calendar'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 1; // Calendar index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.miscellaneous_services_outlined, color: Color(0xFF2D5016)),
            title: const Text('Our Services'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 3; // Services index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone_outlined, color: Color(0xFF2D5016)),
            title: const Text('Contact Us'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 4; // Contact index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism_outlined, color: Color(0xFF2D5016)),
            title: const Text('Donations'),
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 5; // Donation index
              });
              Navigator.pop(context); // Close drawer
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF2D5016)),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF2D5016)),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout navigation
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(double widthScale) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.info_outline, title: 'About'),
        TabItem(icon: Icons.calendar_today_outlined, title: 'Calendar'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.miscellaneous_services_outlined, title: 'Services'),
        TabItem(icon: Icons.contact_phone_outlined, title: 'Contact'),
        TabItem(icon: Icons.volunteer_activism_outlined, title: 'Donation'),
      ],
      initialActiveIndex: _selectedBottomNavIndex,
      onTap: (int index) {
        setState(() {
          _selectedBottomNavIndex = index;
        });
      },
      height: 55,
      backgroundColor: const Color(0xFF2D5016), // Dark green for unselected items
      color: Colors.white,
      activeColor: Colors.lightGreen,
      elevation: 5,
    );
  }
}