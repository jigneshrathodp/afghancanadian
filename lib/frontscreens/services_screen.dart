import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/bottom_nav_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Cultural Services',
      'svg': '1.svg',
      'route': AppRoutes.culturalService,
    },
    {
      'name': 'Youth Programs',
      'svg': '2.svg',
      'route': AppRoutes.youthService,
    },
    {
      'name': 'Women Services',
      'svg': '3.svg',
      'route': AppRoutes.womenService,
    },
    {
      'name': 'Maktab',
      'svg': '4.svg',
      'route': AppRoutes.educationService,
    },
    {
      'name': 'Funeral Service',
      'svg': '21.svg',
      'route': AppRoutes.funeralService,
    },
    {
      'name': 'Library',
      'svg': '22.svg',
      'route': AppRoutes.libraryService,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20 * widthScale, vertical: 20 * heightScale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'OUR SERVICES',
                      style: TextStyle(
                        fontSize: 22 * widthScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 25 * heightScale),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15 * widthScale,
                      mainAxisSpacing: 15 * heightScale,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return GestureDetector(
                        onTap: () {
                          AppRoutes.navigateTo(context, service['route'] as String);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(15 * widthScale),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow,
                                spreadRadius: 1 * widthScale,
                                blurRadius: 5 * widthScale,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/${service['svg']}',
                                width: 50 * widthScale,
                                height: 50 * widthScale,
                              ),
                              SizedBox(height: 10 * heightScale),
                              Text(
                                service['name']! as String,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05 > 60 ? 60 : MediaQuery.of(context).size.height * 0.05)
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 3, // Services
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