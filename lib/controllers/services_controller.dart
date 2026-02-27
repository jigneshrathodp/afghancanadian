import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class ServicesController extends GetxController {
  // Services list
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
  
  // Navigation methods
  void navigateToService(String route) => Get.toNamed(route);
  void navigateToHome() => Get.toNamed(AppRoutes.home);
  void navigateToAbout() => Get.toNamed(AppRoutes.about);
  void navigateToCalendar() => Get.toNamed(AppRoutes.calendar);
  void navigateToContact() => Get.toNamed(AppRoutes.contact);
  void navigateToDonation() => Get.toNamed(AppRoutes.donation);
  
  // Bottom navigation
  void onBottomNavChanged(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.about);
        break;
      case 1:
        Get.toNamed(AppRoutes.calendar);
        break;
      case 2:
        Get.toNamed(AppRoutes.home);
        break;
      case 3:
        Get.toNamed(AppRoutes.services);
        break;
      case 4:
        Get.toNamed(AppRoutes.contact);
        break;
      case 5:
        Get.toNamed(AppRoutes.donation);
        break;
    }
  }
}
