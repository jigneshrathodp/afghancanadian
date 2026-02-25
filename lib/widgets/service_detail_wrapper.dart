import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

/// Wrapper widget that displays service detail content with BottomNavbar
/// This allows service screens to show the bottom navigation
class ServiceDetailWrapper extends StatefulWidget {
  final Widget child;
  final String title;
  final int currentNavIndex;

  const ServiceDetailWrapper({
    super.key,
    required this.child,
    required this.title,
    this.currentNavIndex = 3, // Default to Services tab
  });

  @override
  State<ServiceDetailWrapper> createState() => _ServiceDetailWrapperState();
}

class _ServiceDetailWrapperState extends State<ServiceDetailWrapper> {
  @override
  Widget build(BuildContext context) {
    final widthScale = ResponsiveHelper.getWidthScale(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigationBar(widthScale),
    );
  }

  Widget _buildBottomNavigationBar(double widthScale) {
    return Container(
      color: AppColors.navBackground,
      child: Padding(
        padding: EdgeInsets.only(left: 8 * widthScale, right: 8 * widthScale, bottom: 8),
        child: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.info_outline, title: 'About'),
            TabItem(icon: Icons.calendar_today_outlined, title: 'Calendar'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.miscellaneous_services_outlined, title: 'Services'),
            TabItem(icon: Icons.contact_phone_outlined, title: 'Contact'),
            TabItem(icon: Icons.volunteer_activism_outlined, title: 'Donation'),
          ],
          initialActiveIndex: widget.currentNavIndex,
          onTap: (int index) {
            if (index != widget.currentNavIndex) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavScreen(initialIndex: index),
                ),
                (route) => false,
              );
            }
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
