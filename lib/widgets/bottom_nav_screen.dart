import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../frontscreens/homescreen.dart';
import '../frontscreens/about_screen.dart';
import '../frontscreens/calendar_screen.dart';
import '../frontscreens/services_screen.dart';
import '../frontscreens/contact_screen.dart';
import '../frontscreens/donation_screen.dart';

class BottomNavScreen extends StatefulWidget {
  final int initialIndex;
  
  const BottomNavScreen({super.key, this.initialIndex = 2});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int _selectedBottomNavIndex;

  @override
  void initState() {
    super.initState();
    _selectedBottomNavIndex = widget.initialIndex;
  }

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

    final widthScale = ResponsiveHelper.getWidthScale(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 26),
        child: pages[_selectedBottomNavIndex],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(widthScale),
    );
  }


  Widget _buildBottomNavigationBar(double widthScale) {
    return Container(
      color: AppColors.navBackground,
      child: Padding(
        padding: EdgeInsets.only(left: 8 * widthScale, right: 8 * widthScale, bottom: 8),
        child: ConvexAppBar(
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
      backgroundColor: AppColors.navBackground,
      color: AppColors.navUnselected,
      activeColor: AppColors.navSelected,
      ),
    ),
  );
}
}