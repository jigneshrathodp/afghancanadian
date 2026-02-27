import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/app_routes.dart';

class SignupController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  var isLoading = false.obs;
  var agreeToTerms = false.obs;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  final AuthController authController = Get.find();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> signupUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (!agreeToTerms.value) {
      Get.snackbar(
        'Error',
        'Please agree to the terms and conditions.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock signup - in real app, this would be an API call
      await authController.login(
        userId: emailController.text.trim(),
        userName: '${firstNameController.text} ${lastNameController.text}',
      );

      Get.snackbar(
        'Success',
        'Account created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to home
      Get.offAllNamed(AppRoutes.home);

    } catch (error) {
      Get.snackbar(
        'Error',
        'Signup failed. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void togglePasswordVisibility() => obscurePassword.toggle();
  void toggleConfirmPasswordVisibility() => obscureConfirmPassword.toggle();
  void toggleTermsAgreement() => agreeToTerms.toggle();

  void navigateToSignin() => Get.toNamed(AppRoutes.signin);
  void navigateToTerms() => Get.toNamed(AppRoutes.termsAndConditions);
  void navigateToPrivacy() => Get.toNamed(AppRoutes.privacyPolicy);
}
