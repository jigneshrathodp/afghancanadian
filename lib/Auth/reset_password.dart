import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_widgets.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Create reactive variables for the state
    final newPasswordController = Get.put(TextEditingController(), tag: 'reset_new_password');
    final confirmPasswordController = Get.put(TextEditingController(), tag: 'reset_confirm_password');
    final formKey = GlobalKey<FormState>();
    final isLoading = false.obs;

    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;
    final screenWidth = MediaQuery.of(context).size.width;
    final isCompactWidth = screenWidth < 400;

    // Calculate available height considering both real and simulated keyboard
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = bottomPadding > 0;

    // Additional padding for device preview virtual keyboard
    final devicePreviewPadding = isKeyboardOpen ? 30.0 : 0.0;

    // Adjust header height for tablets - larger height for better visibility
    final isTablet = screenWidth >= 600;
    final headerHeight = isTablet ? screenHeight * 0.45 : screenHeight * 0.35;

    Future<void> resetPassword() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      if (newPasswordController.text != confirmPasswordController.text) {
        Get.snackbar(
          'Error',
          'Passwords do not match!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }

      isLoading.value = true;

      try {
        // Simulate password reset
        await Future.delayed(const Duration(seconds: 2));

        isLoading.value = false;

        Get.snackbar(
          'Success',
          'Password reset successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Show success dialog
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Your password has been reset successfully. You can now log in with your new password.',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back(); // Close dialog
              Get.offAllNamed(AppRoutes.signin); // Navigate to sign in
            },
            child: const Text('OK'),
          ),
        );
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

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Scrollable form below header space
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.only(
                  bottom: isKeyboardOpen ? (20.0 + devicePreviewPadding) : 0.0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - (isKeyboardOpen ? devicePreviewPadding : 0.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: headerHeight,
                        child: Image.asset(
                          'assets/Group.png',
                          fit: BoxFit.fill,
                          semanticLabel: 'App Logo',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          isSmallScreen
                              ? (isCompactWidth ? 10.0 : 12.0)
                              : (isCompactWidth ? 18.0 : 22.0),
                        ),
                        child: Obx(() => Column(  // Using Obx to react to reactive variables
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const StyledText(
                              'Reset Password',
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'New Password*',
                                    style: TextStyle(
                                      fontSize: screenWidth < 360
                                          ? 12.0
                                          : (screenWidth < 414 ? 13.5 : 15.0),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: isSmallScreen ? 6 : 8),
                                  CustomTextFormField(
                                    controller: newPasswordController,
                                    hintText: 'New Password',
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a new password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: isSmallScreen ? 15 : 20),
                                  Text(
                                    'Confirm Password*',
                                    style: TextStyle(
                                      fontSize: screenWidth < 360
                                          ? 12.0
                                          : (screenWidth < 414 ? 13.5 : 15.0),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: isSmallScreen ? 6 : 8),
                                  CustomTextFormField(
                                    controller: confirmPasswordController,
                                    hintText: 'Confirm Password',
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: isSmallScreen ? 20 : 30),
                                  CustomButton(
                                    label: 'Submit',
                                    onPressed: isLoading.value ? null : resetPassword,
                                    isLoading: isLoading.value,
                                  ),
                                  SizedBox(height: isSmallScreen ? 12 : 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Back To Sign In',
                                          style: TextStyle(
                                            fontSize: screenWidth < 360
                                                ? 11.0
                                                : (screenWidth < 414 ? 12.5 : 14.0),
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ));
            },
          ),
        ],
      ),
    );
  }
}