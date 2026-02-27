import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      Get.snackbar(
        'Success',
        'Password reset link sent to your email!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to signin
      Get.offAllNamed(AppRoutes.signin);

    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to send reset link. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToSignin() => Get.toNamed(AppRoutes.signin);
  void navigateToSignup() => Get.toNamed(AppRoutes.signup);
}
