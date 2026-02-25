import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';

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
    final scales = ResponsiveHelper.getScales(context);

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

    return Scaffold(
      body: SafeArea(
        child: pages[_selectedBottomNavIndex],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _selectedBottomNavIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
        scales: scales,
      ),
    );
  }
}

class CustomBottomBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;
  final ResponsiveScales scales;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.scales,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    final heightScale = widget.scales.heightScale;
    final widthScale = widget.scales.widthScale;

    final barHeight = 60 * heightScale;
    final floatingOffset = -15 * heightScale;
    final floatingButtonPadding = 10 * widthScale;
    final floatingButtonIconSize = 20 * widthScale;
    final normalIconSize = 20 * widthScale;
    final fontSize = 9 * widthScale;
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
              bool isSelected = widget.selectedIndex == item.index;
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
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onIndexChanged(index);
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
                padding: EdgeInsets.all(isSelected ? floatingPadding : 6 * widget.scales.widthScale),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6 * widget.scales.widthScale,
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