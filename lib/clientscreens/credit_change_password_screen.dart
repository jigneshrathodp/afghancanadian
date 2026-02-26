import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditChangePasswordScreen extends StatefulWidget {
  const CreditChangePasswordScreen({super.key});

  @override
  State<CreditChangePasswordScreen> createState() =>
      _CreditChangePasswordScreenState();
}

class _CreditChangePasswordScreenState
    extends State<CreditChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * widthScale),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 12 * heightScale),

                  // Main Card Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12 * widthScale),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Change Password Header
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B5E20),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12 * widthScale),
                              topRight: Radius.circular(12 * widthScale),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 20 * widthScale,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(16 * widthScale),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Current Password
                              Text(
                                'Current Password*',
                                style: TextStyle(
                                  fontSize: 14 * widthScale,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8 * heightScale),
                              _buildPasswordField(
                                controller: _currentPasswordController,
                                hint: 'Enter current password',
                                obscureText: _obscureCurrentPassword,
                                onToggleVisibility: () {
                                  setState(() {
                                    _obscureCurrentPassword = !_obscureCurrentPassword;
                                  });
                                },
                                widthScale: widthScale,
                                heightScale: heightScale,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter current password';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 16 * heightScale),

                              // New Password
                              Text(
                                'New Password*',
                                style: TextStyle(
                                  fontSize: 14 * widthScale,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8 * heightScale),
                              _buildPasswordField(
                                controller: _newPasswordController,
                                hint: 'Enter new password',
                                obscureText: _obscureNewPassword,
                                onToggleVisibility: () {
                                  setState(() {
                                    _obscureNewPassword = !_obscureNewPassword;
                                  });
                                },
                                widthScale: widthScale,
                                heightScale: heightScale,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter new password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 16 * heightScale),

                              // Confirm Password
                              Text(
                                'Confirm Password*',
                                style: TextStyle(
                                  fontSize: 14 * widthScale,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8 * heightScale),
                              _buildPasswordField(
                                controller: _confirmPasswordController,
                                hint: 'Confirm new password',
                                obscureText: _obscureConfirmPassword,
                                onToggleVisibility: () {
                                  setState(() {
                                    _obscureConfirmPassword = !_obscureConfirmPassword;
                                  });
                                },
                                widthScale: widthScale,
                                heightScale: heightScale,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm new password';
                                  }
                                  if (value != _newPasswordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 24 * heightScale),

                              // Submit Button
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _submitChangePassword();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5E20),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 48 * widthScale,
                                      vertical: 14 * heightScale,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24 * widthScale),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 16 * widthScale,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20 * heightScale),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: -1, // No selection for change password screen
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToClientHome(context);
              break;
            case 1:
              AppRoutes.goToContactMembership(context);
              break;
            case 2:
              AppRoutes.goToHome(context);
              break;
            case 3:
              AppRoutes.goToContactInvoice(context);
              break;
            case 4:
              AppRoutes.goToContact(context);
              break;
            case 5:
              AppRoutes.goToContactDonation(context);
              break;
          }
        },
        scales: scales,
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required double widthScale,
    required double heightScale,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14 * widthScale,
            color: Colors.grey.shade500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12 * widthScale,
            vertical: 12 * heightScale,
          ),
          border: InputBorder.none,
          isDense: true,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey.shade600,
              size: 20 * widthScale,
            ),
            onPressed: onToggleVisibility,
          ),
        ),
        style: TextStyle(
          fontSize: 14 * widthScale,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _submitChangePassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password changed successfully'),
        backgroundColor: Color(0xFF1B5E20),
      ),
    );

    // Clear fields
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }
}
