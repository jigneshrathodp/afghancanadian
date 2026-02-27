import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/app_routes.dart';

class SigninController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  var isLoading = false.obs;
  var rememberMe = false.obs;
  var obscurePassword = true.obs;

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
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock login - in real app, this would be an API call
      await authController.login(
        userId: emailController.text.trim(),
        userName: emailController.text.split('@')[0],
      );

      Get.snackbar(
        'Success',
        'Login successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to home
      Get.offAllNamed(AppRoutes.home);

    } catch (error) {
      Get.snackbar(
        'Error',
        'Login failed. Please check your credentials.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() => obscurePassword.toggle();
  void toggleRememberMe() => rememberMe.toggle();

  void navigateToSignup() => Get.toNamed(AppRoutes.signup);
  void navigateToForgetPassword() => Get.toNamed(AppRoutes.forgetPassword);
}
