import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

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
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: widget.child,
      bottomNavigationBar: CustomBottomBarWrapper(initialIndex: widget.currentNavIndex),
    );
  }
}

/// CustomBottomBarWrapper - Only shows the bottom navigation bar without page switching
class CustomBottomBarWrapper extends StatefulWidget {
  final int initialIndex;

  const CustomBottomBarWrapper({super.key, this.initialIndex = 3});

  @override
  State<CustomBottomBarWrapper> createState() => _CustomBottomBarWrapperState();
}

class _CustomBottomBarWrapperState extends State<CustomBottomBarWrapper> {
  late int _selectedIndex;
  late double _widthScale;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onNavItemTapped(int index) {
    if (index == _selectedIndex) {
      // Already on this tab, do nothing
      return;
    }

    // Navigate to the selected main screen using named routes
    switch (index) {
      case 0:
        AppRoutes.goToAbout(context);
        break;
      case 1:
        AppRoutes.goToCalendar(context);
        break;
      case 2:
        AppRoutes.goToHome(context);
        break;
      case 3:
        AppRoutes.goToServices(context);
        break;
      case 4:
        AppRoutes.goToContact(context);
        break;
      case 5:
        AppRoutes.goToDonation(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final heightScale = scales.heightScale;
    _widthScale = scales.widthScale;

    final barHeight = 60 * heightScale;
    final floatingOffset = -15 * heightScale;
    final floatingButtonPadding = 10 * _widthScale;
    final floatingButtonIconSize = 20 * _widthScale;
    final normalIconSize = 20 * _widthScale;
    final fontSize = 9 * _widthScale;
    final spacing = 2 * heightScale;

    // Define all nav items
    final navItems = [
      NavItemData(Icons.info_outline, "About", 0),
      NavItemData(Icons.calendar_today_outlined, "Calendar", 1),
      NavItemData(Icons.home, "Home", 2),
      NavItemData(Icons.miscellaneous_services_outlined, "Services", 3),
      NavItemData(Icons.contact_phone_outlined, "Contact", 4),
      NavItemData(Icons.volunteer_activism_outlined, "Donation", 5),
    ];

    return Container(
      color: const Color(0xFF0B5D1E),
      child: SafeArea(
        top: false,
        child: Container(
          height: barHeight,
          color: const Color(0xFF0B5D1E),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navItems.map((item) {
              bool isSelected = _selectedIndex == item.index;
              return Expanded(
                child: _buildItem(
                  item.icon,
                  item.label,
                  item.index,
                  isSelected,
                  floatingOffset,
                  floatingButtonPadding,
                  floatingButtonIconSize,
                  normalIconSize,
                  fontSize,
                  spacing,
                  _widthScale,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    IconData icon,
    String label,
    int index,
    bool isSelected,
    double floatingOffset,
    double floatingPadding,
    double floatingIconSize,
    double normalIconSize,
    double fontSize,
    double spacing,
    double widthScale,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _onNavItemTapped(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: isSelected
            ? Matrix4.translationValues(0, floatingOffset, 0)
            : Matrix4.identity(),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(isSelected ? floatingPadding : 6 * widthScale),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6 * widthScale,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      )
                    : null,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: isSelected ? floatingIconSize : normalIconSize,
                ),
              ),
              SizedBox(height: spacing),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.amber : Colors.white70,
                  fontSize: fontSize,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItemData {
  final IconData icon;
  final String label;
  final int index;

  NavItemData(this.icon, this.label, this.index);
}
