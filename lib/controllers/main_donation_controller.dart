import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class MainDonationController extends GetxController {
  // Form controllers
  final TextEditingController donationAmountController = TextEditingController();
  final TextEditingController pledgeAmountController = TextEditingController();
  final TextEditingController recurringAmountController = TextEditingController();
  final TextEditingController donorNameController = TextEditingController();
  final TextEditingController donorEmailController = TextEditingController();
  final TextEditingController donorPhoneController = TextEditingController();
  final TextEditingController donationNoteController = TextEditingController();
  final TextEditingController pledgeNoteController = TextEditingController();
  final GlobalKey<FormState> donationFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pledgeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> recurringFormKey = GlobalKey<FormState>();
  
  // Reactive variables
  final showDonationForm = false.obs;
  final showPledgeForm = false.obs;
  final showRecurringForm = false.obs;
  final selectedRecurringStatus = Rxn<String>();
  final selectedDonationReason = Rxn<String>();
  final selectedPledgeReason = Rxn<String>();
  final emiType = 'Monthly'.obs;
  final isLoading = false.obs;
  
  // Donation options
  final List<String> donationAmounts = [
    '\$25', '\$50', '\$100', '\$250', '\$500', '\$1000', 'Other'
  ];
  
  final List<String> pledgeAmounts = [
    '\$500', '\$1000', '\$2500', '\$5000', '\$10000', 'Other'
  ];
  
  final List<String> recurringAmounts = [
    '\$25', '\$50', '\$100', '\$250', '\$500', 'Other'
  ];
  
  final List<String> emiOptions = [
    'Monthly', 'Quarterly', 'Yearly'
  ];
  
  final List<String> recurringStatuses = [
    'One-time', 'Monthly', 'Quarterly', 'Yearly'
  ];
  
  final List<String> reasons = [
    'General Donation',
    'Mosque Construction',
    'Community Programs',
    'Education Fund',
    'Humanitarian Aid',
    'Youth Programs',
    'Cultural Events',
    'Other',
  ];
  
  // Sample donation history
  final donations = [
    {
      'date': '2024-01-15',
      'amount': '\$100',
      'type': 'General Donation',
      'status': 'Completed',
    },
    {
      'date': '2024-01-10',
      'amount': '\$50',
      'type': 'Mosque Construction',
      'status': 'Completed',
    },
    {
      'date': '2024-01-05',
      'amount': '\$25',
      'type': 'Education Fund',
      'status': 'Completed',
    },
  ];
  
  // Expanded rows for donations
  final expandedRows = <int>{}.obs;
  
  // Donation data for ContactDonationScreen
  final List<Map<String, dynamic>> donationData = [
    {
      'id': '001',
      'date': '2024-01-15',
      'name': 'John Doe',
      'amount': '\$100',
      'type': 'General Donation',
      'status': 'Completed',
      'note': 'Monthly donation',
      'isExpandable': true,
    },
    {
      'id': '002',
      'date': '2024-01-10',
      'name': 'Jane Smith',
      'amount': '\$50',
      'type': 'Mosque Construction',
      'status': 'Completed',
      'note': 'One-time donation',
      'isExpandable': true,
    },
    {
      'id': '003',
      'date': '2024-01-05',
      'name': 'Ahmed Khan',
      'amount': '\$25',
      'type': 'Education Fund',
      'status': 'Completed',
      'note': 'Weekly donation',
      'isExpandable': true,
    },
  ];
  
  // Statuses for dropdown
  final List<String> statuses = [
    'Completed',
    'Pending',
    'Failed',
    'Refunded',
  ];
  
  // Navigation methods
  void navigateToHome() => Get.toNamed(AppRoutes.home);
  void navigateToAbout() => Get.toNamed(AppRoutes.about);
  void navigateToCalendar() => Get.toNamed(AppRoutes.calendar);
  void navigateToServices() => Get.toNamed(AppRoutes.services);
  void navigateToContact() => Get.toNamed(AppRoutes.contact);
  
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
  
  // Form visibility methods
  void toggleDonationForm() => showDonationForm.toggle();
  void togglePledgeForm() => showPledgeForm.toggle();
  void toggleRecurringForm() => showRecurringForm.toggle();
  
  // Row expansion method
  void toggleRow(int index) {
    if (expandedRows.contains(index)) {
      expandedRows.remove(index);
    } else {
      expandedRows.add(index);
    }
  }
  
  // Form methods
  void selectRecurringStatus(String status) => selectedRecurringStatus.value = status;
  void selectEmiType(String type) => emiType.value = type;
  
  Future<void> submitDonation() async {
    if (!donationFormKey.currentState!.validate()) {
      return;
    }
    
    isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Clear form
      donationAmountController.clear();
      donorNameController.clear();
      donorEmailController.clear();
      donorPhoneController.clear();
      showDonationForm.value = false;
      
      Get.snackbar(
        'Success',
        'Thank you for your donation!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to process donation. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> submitPledge() async {
    if (!pledgeFormKey.currentState!.validate()) {
      return;
    }
    
    isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Clear form
      pledgeAmountController.clear();
      showPledgeForm.value = false;
      
      Get.snackbar(
        'Success',
        'Thank you for your pledge commitment!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to process pledge. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> submitRecurringDonation() async {
    if (!recurringFormKey.currentState!.validate()) {
      return;
    }
    
    isLoading.value = true;
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Clear form
      recurringAmountController.clear();
      showRecurringForm.value = false;
      
      Get.snackbar(
        'Success',
        'Recurring donation setup successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to setup recurring donation. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  // Expand/collapse donation rows
  void toggleDonationRow(int index) {
    if (expandedRows.contains(index)) {
      expandedRows.remove(index);
    } else {
      expandedRows.add(index);
    }
  }
  
  @override
  void onClose() {
    donationAmountController.dispose();
    pledgeAmountController.dispose();
    recurringAmountController.dispose();
    donorNameController.dispose();
    donorEmailController.dispose();
    donorPhoneController.dispose();
    super.onClose();
  }
}
