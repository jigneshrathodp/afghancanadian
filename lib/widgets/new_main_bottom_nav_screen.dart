import 'package:afghancanadian/new_bottomNavScreen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/clientscreens/dashboard_screen.dart';
import 'package:afghancanadian/frontscreens/membership.dart';
import 'package:afghancanadian/frontscreens/homescreen.dart';
import 'package:afghancanadian/clientscreens/contact_Invoice_screen.dart';
import 'package:afghancanadian/frontscreens/contact_screen.dart';
import 'package:afghancanadian/clientscreens/contact_donation_screen.dart';
import 'package:flutter/material.dart';

class NewMainBottomNavScreen extends StatefulWidget {
  const NewMainBottomNavScreen({super.key});

  @override
  State<NewMainBottomNavScreen> createState() => _NewMainBottomNavScreenState();
}

class _NewMainBottomNavScreenState extends State<NewMainBottomNavScreen> {
  int _currentIndex = 2; // Default to Home screen
  final PageController _pageController = PageController(initialPage: 2);

  final List<Widget> _screens = [
    const DashboardScreen(),
    const MembershipScreen(),
    const Homescreen(),
    const ContactInvoiceScreen(),
    const ContactScreen(),
    const ContactDonationScreen(),
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
      drawer: const NewCustomDrawer(),
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
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: _currentIndex,
        onIndexChanged: _onItemTapped,
        scales: scales,
      ),
    );
  }
}