import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';
import '../newcustomdrawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_nav_screen.dart';
import '../new_bottomNavScreen.dart';

class Homescreen extends GetView<HomeController> {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate responsive scaling factors
    final scales = ResponsiveHelper.getScales(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Obx(() => controller.authController.isLoggedIn.value ? NewCustomDrawer() : CustomDrawer()),
      drawerEnableOpenDragGesture: false,
      body: _buildHomeContent(context),
      bottomNavigationBar: Obx(() => controller.authController.isLoggedIn.value 
        ? NewCustomBottomBar(
            selectedIndex: 2, // Home
            onIndexChanged: controller.onBottomNavChanged,
            scales: scales,
          )
        : CustomBottomBar(
            selectedIndex: 2, // Home
            onIndexChanged: controller.onBottomNavChanged,
            scales: scales,
          )),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10 * heightScale),
          _buildWelcomeSection(context, widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          _buildNextAdhaanSection(context, widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          _buildPrayerTimesSection(context, widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          // _buildOurServicesSection(context, widthScale, heightScale),
          SizedBox(height: 20 * heightScale),
          SizedBox(height: screenHeight * 0.05 > 60 ? 60 : screenHeight * 0.05)
        ],
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context, double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16 * widthScale),
        child: Image.asset(
        'assets/23.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      ),
    );
  }

  Widget _buildNextAdhaanSection(BuildContext context, double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      padding: EdgeInsets.only(
        left: 10 * widthScale, 
        right: 10 * widthScale, 
        top: 7 * heightScale, 
        bottom: 12 * heightScale
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20 * widthScale),
        border: Border.all(color: AppColors.borderPrimary, width: 1),
      ),
      child: Column(
        children: [
          Text(
            '06/02/2026',
            style: TextStyle(fontSize: 14 * widthScale, color: AppColors.textPrimary),
          ),
          SizedBox(height: 8 * heightScale),
          Text(
            'NEXT ADHAAN',
            style: TextStyle(
              fontSize: 16 * widthScale,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 5 * heightScale),
          Text(
            '6:02 AM',
            style: TextStyle(
              fontSize: 40 * widthScale,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesSection(BuildContext context, double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: Column(
        children: [
          _buildTabBar(context, widthScale, heightScale),
          Obx(() => controller.tabIndex.value == 0 ? _buildPrayerTimesList(context, widthScale, heightScale) : _buildUpcomingEvents(context, widthScale, heightScale)),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeTab(0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
                    child: Obx(() => Text(
                      'Prayer Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (controller.tabIndex.value == 0 ? 16 : 15) * widthScale,
                        color: controller.tabIndex.value == 0 ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: controller.tabIndex.value == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    )),
                  ),
                  // Underline indicator
                  Obx(() => Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: controller.tabIndex.value == 0 ? AppColors.borderPrimary : Colors.transparent,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.changeTab(1),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
                    child: Obx(() => Text(
                      'Upcoming Event',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (controller.tabIndex.value == 1 ? 16 : 15) * widthScale,
                        color: controller.tabIndex.value == 1 ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: controller.tabIndex.value == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    )),
                  ),
                  // Underline indicator
                  Obx(() => Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: controller.tabIndex.value == 1 ? AppColors.borderPrimary : Colors.transparent,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesList(BuildContext context, double widthScale, double heightScale) {
    final prayers = [
      {'name': 'Imsak', 'time': '06:00:00', 'svg': '5.svg'},
      {'name': 'Fajr', 'time': '06:05:00', 'svg': '5.svg'},
      {'name': 'Sunrise', 'time': '07:32:00', 'svg': '6.svg'},
      {'name': 'Dhuhr', 'time': '12:32:00', 'svg': '7.svg'},
      {'name': 'Sunset', 'time': '05:32:00', 'svg': '6.svg'},
      {'name': 'Maghrib', 'time': '05:47:00', 'svg': '8.svg'},
    ];

    return Container(
      padding: EdgeInsets.all(20 * widthScale),
      child: Column(
        children: [
          ...prayers.map((prayer) {
            final isFajr = prayer['name'] == 'Fajr';
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8 * heightScale),
              child: Container(
                decoration: BoxDecoration(
                  color: isFajr ? AppColors.primaryDark.withOpacity(0.1) : AppColors.background,
                  borderRadius: BorderRadius.circular(10 * widthScale),
                  border: Border.all(color: AppColors.borderPrimary, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0 * widthScale),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/${prayer['svg']}',
                        width: 28 * widthScale,
                        height: 28 * widthScale,
                      ),
                      SizedBox(width: 15 * widthScale),
                      Expanded(
                        child: Text(
                          prayer['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontSize: 14 * widthScale,
                          ),
                        ),
                      ),
                      Text(
                        prayer['time'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: 14 * widthScale,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20 * heightScale),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15 * heightScale),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(30 * widthScale),
            ),
            child: Text(
              'View Monthly Timings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
                fontSize: 16 * widthScale,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvents(BuildContext context, double widthScale, double heightScale) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
            padding: EdgeInsets.all(20 * widthScale),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20 * widthScale),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Ramadan',
                      style: TextStyle(
                        fontSize: 24 * widthScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                  SizedBox(height: 6 * heightScale),
                  Align(
                    alignment: Alignment.center,

                    child: Text(
                      'March 1 @ 5:23 am - March 23 @ 6:20 pm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13 * widthScale,
                        color: AppColors.textLightMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildOurServicesSection(BuildContext context, double widthScale, double heightScale) {
  //   final services = [
  //     {'name': 'Cultural Services', 'svg': '1.svg', 'route': AppRoutes.culturalService},
  //     {'name': 'Youth Programs', 'svg': '2.svg', 'route': AppRoutes.youthService},
  //     {'name': 'Women Services', 'svg': '3.svg', 'route': AppRoutes.womenService},
  //     {'name': 'Maktab', 'svg': '4.svg', 'route': AppRoutes.educationService},
  //     {'name': 'Funeral Service', 'svg': '21.svg', 'route': AppRoutes.funeralService},
  //     {'name': 'Library', 'svg': '22.svg', 'route': AppRoutes.libraryService},
  //   ];
  //
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Center(
  //           child: Text(
  //             'OUR SERVICES',
  //             style: TextStyle(
  //               fontSize: 18 * widthScale,
  //               fontWeight: FontWeight.bold,
  //               color: AppColors.textPrimary,
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 15 * heightScale),
  //         GridView.builder(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 3,
  //             crossAxisSpacing: 10 * widthScale,
  //             mainAxisSpacing: 10 * heightScale,
  //             childAspectRatio: 1,
  //           ),
  //           itemCount: services.length,
  //           itemBuilder: (context, index) {
  //             final service = services[index];
  //             return GestureDetector(
  //               onTap: () {
  //                 Get.toNamed(service['route'] as String);
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: AppColors.background,
  //                   borderRadius: BorderRadius.circular(15 * widthScale),
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: AppColors.shadow,
  //                       spreadRadius: 1 * widthScale,
  //                       blurRadius: 5 * widthScale,
  //                       offset: const Offset(0, 2),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     SvgPicture.asset(
  //                       'assets/${service['svg']}',
  //                       width: 45 * widthScale,
  //                       height: 45 * widthScale,
  //                     ),
  //                     SizedBox(height: 8 * heightScale),
  //                     Text(
  //                       service['name'] as String,
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontSize: 12 * widthScale,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}