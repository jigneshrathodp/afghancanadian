import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'frontscreens/homescreen.dart';
import 'frontscreens/contact_screen.dart';
import 'frontscreens/donation_screen.dart';
import 'clientside/dashboard_screen.dart';
import 'membership.dart';
import 'clientside/contact_Invoice_screen.dart';

class NewBottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const NewBottomNavScreen({super.key, this.initialIndex = 2});

  @override
  State<NewBottomNavScreen> createState() => _NewBottomNavScreenState();
}

class _NewBottomNavScreenState extends State<NewBottomNavScreen> {
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
      // Dashboard page
      const DashboardScreen(),
      // Membership page
      const MembershipScreen(),
      // Home page
      Homescreen(),
      // Invoice page
      const ContactInvoiceScreen(),
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
            TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
            TabItem(icon: Icons.card_membership_outlined, title: 'Membership'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.receipt_outlined, title: 'Invoice'),
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
