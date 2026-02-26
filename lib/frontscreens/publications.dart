import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';

class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
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
        },
        scales: scales,
      ),
    );
  }
}