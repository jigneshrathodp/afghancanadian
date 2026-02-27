import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class AboutController extends GetxController {
  // Navigation methods
  void navigateToHome() => Get.toNamed(AppRoutes.home);
  void navigateToCalendar() => Get.toNamed(AppRoutes.calendar);
  void navigateToServices() => Get.toNamed(AppRoutes.services);
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
