import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:afghancanadian/frontscreens/about_screen.dart';
import 'package:afghancanadian/frontscreens/calendar_screen.dart';
import 'package:afghancanadian/frontscreens/homescreen.dart';
import 'package:afghancanadian/frontscreens/services_screen.dart';
import 'package:afghancanadian/frontscreens/contact_screen.dart';
import 'package:afghancanadian/frontscreens/donation_screen.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 2; // Default to Home screen
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> _screens = [
    const AboutScreen(),
    const CalendarScreen(),
    const Homescreen(),
    const ServicesScreen(),
    const ContactScreen(),
    const DonationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: _currentIndex,
        onIndexChanged: _onItemTapped,
        scales: scales,
      ),
    );
  }
}