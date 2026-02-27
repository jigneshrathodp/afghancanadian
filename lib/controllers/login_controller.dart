import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  var isLoading = false.obs;
  var rememberMe = false.obs;

  final AuthController authController = Get.find();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      // UI-only simulated login
      await Future.delayed(const Duration(milliseconds: 700));

      isLoading.value = false;

      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Save login state and navigate
      await authController.login(userId: '54881852', userName: 'Hameed Zarabi');

      // Navigate to signed-in flow
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}