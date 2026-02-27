import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class CalendarController extends GetxController {
  // Reactive variables
  final focusedDate = DateTime.now().obs;
  final selectedDate = Rxn<DateTime>();
  
  // Week days
  final List<String> weekDays = const [
    'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
  ];
  
  // Events data
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Friday Prayers',
      'subtitle': 'Jumu\'ah Prayer - 1:30 PM',
      'backgroundColor': null,
      'icon': Icons.mosque,
    },
    {
      'title': 'Community Iftar',
      'subtitle': 'Ramadan Iftar Dinner - 6:30 PM',
      'backgroundColor': Color(0xFFE8F5E8),
      'icon': Icons.restaurant,
    },
    {
      'title': 'Quran Classes',
      'subtitle': 'Weekend Quran Study - 10:00 AM',
      'backgroundColor': Color(0xFFFFF3E0),
      'icon': Icons.menu_book,
    },
    {
      'title': 'Youth Program',
      'subtitle': 'Youth Sports Activities - 3:00 PM',
      'backgroundColor': Color(0xFFE3F2FD),
      'icon': Icons.sports_soccer,
    },
  ];
  
  // Navigation methods
  void navigateToHome() => Get.toNamed(AppRoutes.home);
  void navigateToAbout() => Get.toNamed(AppRoutes.about);
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
  
  void selectDate(DateTime date) {
    selectedDate.value = date;
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
  
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && 
           date1.month == date2.month && 
           date1.day == date2.day;
  }
}
