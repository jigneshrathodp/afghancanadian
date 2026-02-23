import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/services/cultural_service_screen.dart';
import 'package:afghancanadian/services/education_service_screen.dart';
import 'package:afghancanadian/services/funeral_service_screen.dart';
import 'package:afghancanadian/services/library_service_screen.dart';
import 'package:afghancanadian/services/women_service_screen.dart';
import 'package:afghancanadian/services/youth_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Cultural Services',
      'svg': '1.svg',
      'screen': 'CulturalServiceScreen',
    },
    {
      'name': 'Youth Programs',
      'svg': '2.svg',
      'screen': 'YouthServiceScreen',
    },
    {
      'name': 'Women Services',
      'svg': '3.svg',
      'screen': 'WomenServiceScreen',
    },
    {
      'name': 'Maktab',
      'svg': '4.svg',
      'screen': 'EducationServiceScreen',
    },
    {
      'name': 'Funeral Service',
      'svg': '21.svg',
      'screen': 'FuneralServiceScreen',
    },
    {
      'name': 'Library',
      'svg': '22.svg',
      'screen': 'LibraryScreen',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive scaling factors
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);
    final heightScale = (screenHeight / 896).clamp(0.8, 1.2);

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
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
                      final hasScreen = service.containsKey('screen');

                      return GestureDetector(
                        onTap: () {
                          if (hasScreen) {
                            final screenName = service['screen'] as String;
                            if (screenName == 'CulturalServiceScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CulturalServiceScreen(),
                                ),
                              );
                            } else if (screenName == 'EducationServiceScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EducationServiceScreen(),
                                ),
                              );
                            } else if (screenName == 'FuneralServiceScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FuneralServiceScreen(),
                                ),
                              );
                            } else if (screenName == 'YouthServiceScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const YouthServiceScreen(),
                                ),
                              );
                            } else if (screenName == 'WomenServiceScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WomenServiceScreen(),
                                ),
                              );
                            } else if (screenName == 'LibraryScreen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Libraryservicescreen(),
                                ),
                              );
                            }
                          }
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
          SizedBox(height: screenHeight * 0.05 > 60 ? 60 : screenHeight * 0.05)
        ],
      ),
    );
  }
}