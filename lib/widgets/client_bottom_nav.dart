import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../frontscreens/homescreen.dart';
import '../frontscreens/contact_screen.dart';
import '../frontscreens/donation_screen.dart';
import '../clientside/dashboard_screen.dart';
import '../membership.dart';
import '../clientside/contact_Invoice_screen.dart';
import '../new_bottomNavScreen.dart';

class ClientBottomNav extends StatelessWidget {
  final int currentIndex;

  const ClientBottomNav({
    super.key,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 0)),
          (route) => false,
        );
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 1)),
          (route) => false,
        );
        break;
      case 2:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 2)),
          (route) => false,
        );
        break;
      case 3:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 3)),
          (route) => false,
        );
        break;
      case 4:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 4)),
          (route) => false,
        );
        break;
      case 5:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NewBottomNavScreen(initialIndex: 5)),
          (route) => false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final widthScale = ResponsiveHelper.getWidthScale(context);

    return Container(
      color: AppColors.navBackground,
      child: Padding(
        padding: EdgeInsets.only(left: 8 * widthScale, right: 8 * widthScale, bottom: 8),
        child: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
            TabItem(icon: Icons.card_membership_outlined, title: 'Membership'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.receipt_outlined, title: 'Invoice'),
            TabItem(icon: Icons.contact_phone_outlined, title: 'Contact'),
            TabItem(icon: Icons.volunteer_activism_outlined, title: 'Donation'),
          ],
          initialActiveIndex: currentIndex,
          onTap: (int index) => _onItemTapped(context, index),
          height: 55,
          backgroundColor: AppColors.navBackground,
          color: AppColors.navUnselected,
          activeColor: AppColors.navSelected,
        ),
      ),
    );
  }
}
