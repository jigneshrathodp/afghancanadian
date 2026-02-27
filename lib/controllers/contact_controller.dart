import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class ContactController extends GetxController {
  // Form controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  // Reactive variables
  final isLoading = false.obs;
  final selectedContactType = 'General Inquiry'.obs;
  
  // Contact types
  final List<String> contactTypes = [
    'General Inquiry',
    'Membership Information',
    'Donation Questions',
    'Event Information',
    'Volunteer Opportunities',
    'Technical Support',
  ];
  
  // Contact information
  final Map<String, dynamic> contactInfo = const {
    'address': '123 Main Street, City, Province, Postal Code',
    'phone': '+1 (555) 123-4567',
    'email': 'info@afghancanadian.org',
    'website': 'www.afghancanadian.org',
  };
  
  // Office hours
  final Map<String, String> officeHours = const {
    'Monday - Thursday': '9:00 AM - 5:00 PM',
    'Friday': '9:00 AM - 2:00 PM',
    'Saturday': '10:00 AM - 2:00 PM',
    'Sunday': 'Closed',
  };
  
  // Social media links
  final Map<String, String> socialMedia = const {
    'Facebook': 'https://facebook.com/afghancanadian',
    'Twitter': 'https://twitter.com/afghancanadian',
    'Instagram': 'https://instagram.com/afghancanadian',
    'YouTube': 'https://youtube.com/afghancanadian',
  };
  
  // Navigation methods
  void navigateToHome() => Get.toNamed(AppRoutes.home);
  void navigateToAbout() => Get.toNamed(AppRoutes.about);
  void navigateToCalendar() => Get.toNamed(AppRoutes.calendar);
  void navigateToServices() => Get.toNamed(AppRoutes.services);
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
  
  // Form methods
  void selectContactType(String type) => selectedContactType.value = type;
  
  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Clear form
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      messageController.clear();
      
      Get.snackbar(
        'Success',
        'Your message has been sent successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to send message. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
