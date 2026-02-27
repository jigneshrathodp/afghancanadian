import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: const Center(
        child: Text('Comming soon'),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: -1, // No item selected
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToAbout();
              break;
            case 1:
              AppRoutes.goToCalendar();
              break;
            case 2:
              AppRoutes.goToHome();
              break;
            case 3:
              AppRoutes.goToServices();
              break;
            case 4:
              AppRoutes.goToContact();
              break;
            case 5:
              AppRoutes.goToDonation();
              break;
          }
        },
        scales: scales,
      ),
    );
  }
}
