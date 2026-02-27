import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_widgets.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Create reactive variables for the state
    final emailController = Get.put(TextEditingController(), tag: 'forget_email');
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

    Future<void> sendResetPasswordEmail() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      isLoading.value = true;

      try {
        // Simulate sending email
        await Future.delayed(const Duration(seconds: 2));

        isLoading.value = false;

        Get.snackbar(
          'Success',
          'Password reset email sent successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Show success dialog
        Get.defaultDialog(
          title: 'Success',
          middleText: 'Password reset link has been sent to your email. Please check your email and follow the instructions to reset your password.',
          confirm: ElevatedButton(
            onPressed: () {
              Get.back(); // Close dialog
              Get.toNamed(AppRoutes.resetPassword); // Navigate to reset password
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
          // Scrollable form on top of header space
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
                              'Forgot Password',
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Email Address*',
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
                                    controller: emailController,
                                    hintText: 'E-mail Address',
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an email';
                                      }
                                      if (!RegExp(
                                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                      ).hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: isSmallScreen ? 20 : 30),
                                  CustomButton(
                                    label: 'Send reset password mail',
                                    onPressed: isLoading.value ? null : sendResetPasswordEmail,
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