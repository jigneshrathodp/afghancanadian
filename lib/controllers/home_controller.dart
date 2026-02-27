import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/app_routes.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  
  // Reactive variables for prayer times
  final tabIndex = 0.obs;
  final focusedDate = DateTime.now().obs;
  
  // Navigation methods
  void navigateToDashboard() {
    if (Get.currentRoute != AppRoutes.dashboard) {
      Get.offAndToNamed(AppRoutes.dashboard);
    }
  }
  
  void navigateToMembership() {
    if (Get.currentRoute != AppRoutes.contactMembership) {
      Get.offAndToNamed(AppRoutes.contactMembership);
    }
  }
  
  void navigateToHome() {
    if (Get.currentRoute != AppRoutes.home) {
      Get.offAndToNamed(AppRoutes.home);
    }
  }
  
  void navigateToInvoice() {
    if (Get.currentRoute != AppRoutes.contactInvoice) {
      Get.offAndToNamed(AppRoutes.contactInvoice);
    }
  }
  
  void navigateToContact() {
    if (Get.currentRoute != AppRoutes.contact) {
      Get.offAndToNamed(AppRoutes.contact);
    }
  }
  
  void navigateToDonation() {
    if (Get.currentRoute != AppRoutes.contactDonation) {
      Get.offAndToNamed(AppRoutes.contactDonation);
    }
  }
  
  // Main navigation methods
  void navigateToAbout() {
    if (Get.currentRoute != AppRoutes.about) {
      Get.offAndToNamed(AppRoutes.about);
    }
  }
  
  void navigateToCalendar() {
    if (Get.currentRoute != AppRoutes.calendar) {
      Get.offAndToNamed(AppRoutes.calendar);
    }
  }
  
  void navigateToServices() {
    if (Get.currentRoute != AppRoutes.services) {
      Get.offAndToNamed(AppRoutes.services);
    }
  }
  
  // Bottom navigation handler
  void onBottomNavChanged(int index) {
    // Check if user is logged in to determine which navigation to use
    if (authController.isLoggedIn.value) {
      // Logged-in user navigation (Dashboard, Membership, Home, Invoice, Contact, Donation)
      switch (index) {
        case 0:
          navigateToDashboard();
          break;
        case 1:
          navigateToMembership();
          break;
        case 2:
          navigateToHome();
          break;
        case 3:
          navigateToInvoice();
          break;
        case 4:
          navigateToContact();
          break;
        case 5:
          navigateToDonation();
          break;
      }
    } else {
      // Non-logged-in user navigation (About, Calendar, Home, Services, Contact, Donation)
      switch (index) {
        case 0:
          navigateToAbout();
          break;
        case 1:
          navigateToCalendar();
          break;
        case 2:
          navigateToHome();
          break;
        case 3:
          navigateToServices();
          break;
        case 4:
          navigateToContact();
          break;
        case 5:
          navigateToDonation();
          break;
      }
    }
  }
  
  // Tab management
  void changeTab(int index) => tabIndex.value = index;
  
  // Date management
  void changeMonth(int direction) {
    final newMonth = focusedDate.value.month + direction;
    final newYear = newMonth > 12 
        ? focusedDate.value.year + 1
        : newMonth < 1 
            ? focusedDate.value.year - 1
            : focusedDate.value.year;
    
    final adjustedMonth = newMonth > 12 ? 1 : newMonth < 1 ? 12 : newMonth;
    
    focusedDate.value = DateTime(newYear, adjustedMonth, 1);
  }
  
  // Helper methods
  String getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
  
  List<DateTime> generateCalendarDays(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final startDate = firstDay.subtract(Duration(days: firstDay.weekday % 7));
    
    final days = <DateTime>[];
    for (int i = 0; i < 42; i++) {
      days.add(startDate.add(Duration(days: i)));
      if (days.length >= 42 && days.last.month != month.month) break;
    }
    return days;
  }
}
