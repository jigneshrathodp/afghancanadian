import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InvoiceRecordPaymentController extends GetxController {
  // Text editing controllers
  final nameOnCardController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expireDateController = TextEditingController();
  final cvvController = TextEditingController();

  // Selected options
  final selectedMonth = Rxn<String>();
  final selectedDateRange = Rxn<String>();
  
  final monthOptions = [
    'Current Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  void onClose() {
    nameOnCardController.dispose();
    cardNumberController.dispose();
    expireDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void submitPayment() {
    // Validate fields
    if (nameOnCardController.text.isEmpty ||
        cardNumberController.text.isEmpty ||
        expireDateController.text.isEmpty ||
        cvvController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Process payment
    Get.snackbar(
      'Success',
      'Payment submitted successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF1B5E20),
      colorText: Colors.white,
    );
  }
}