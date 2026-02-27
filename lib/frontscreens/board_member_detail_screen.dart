import 'package:flutter/material.dart';
import 'package:afghancanadian/models/user_model.dart';
import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/app_routes.dart';

class BoardMemberDetailScreen extends StatelessWidget {
  final User user;

  const BoardMemberDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20 * heightScale),
            Text(
              'BOARD OF DIRECTORS PROFILE',
              style: TextStyle(
                fontSize: 22 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: 24 * heightScale),
            Image.network(
              user.image,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24 * heightScale),
            Text(
              user.name,
              style: TextStyle(
                  fontSize: 26 * widthScale,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark),
            ),
            SizedBox(height: 8 * heightScale),
            Text(
              user.role,
              style: TextStyle(
                  fontSize: 18 * widthScale,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary),
            ),
            SizedBox(height: 24 * heightScale),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(16 * widthScale),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12 * widthScale),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                user.description,
                style: TextStyle(
                    fontSize: 16 * widthScale,
                    height: 1.5,
                    color: AppColors.textPrimary),
              ),
            ),
            SizedBox(height: 40 * heightScale),
          ],
        ),
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