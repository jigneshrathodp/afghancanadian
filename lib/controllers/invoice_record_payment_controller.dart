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
    if (nameOnCardController.text.trim().isEmpty ||
        cardNumberController.text.trim().isEmpty ||
        expireDateController.text.trim().isEmpty ||
        cvvController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    // Validate card number (should be 16 digits)
    if (cardNumberController.text.length != 16) {
      Get.snackbar(
        'Error',
        'Please enter a valid 16-digit card number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    // Validate expiry date (MM/YY format)
    final expiryRegex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!expiryRegex.hasMatch(expireDateController.text)) {
      Get.snackbar(
        'Error',
        'Please enter expiry date in MM/YY format',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    // Validate CVV (should be 3 or 4 digits)
    if (cvvController.text.length < 3 || cvvController.text.length > 4) {
      Get.snackbar(
        'Error',
        'Please enter a valid CVV (3 or 4 digits)',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    // Show loading
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1B5E20)),
        ),
      ),
      barrierDismissible: false,
    );

    // Simulate payment processing
    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close loading dialog

      // Show success message
      Get.snackbar(
        'Success',
        'Payment submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF1B5E20),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // Navigate back to invoice screen after successful payment
      Future.delayed(const Duration(seconds: 1), () {
        Get.back(); // Go back to invoice screen
      });
    });
  }
}