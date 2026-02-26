import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_widgets.dart';
import '../services/auth_manager.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // UI-only simulated login
      await Future.delayed(const Duration(milliseconds: 700));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );

        // Save login state and navigate
        await AuthManager().login(userId: '54881852', userName: 'Hameed Zarabi');
        
        // Navigate to signed-in flow
        if (mounted) {
          AppRoutes.goToClientHome(context);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Skip login - navigate to home without authentication
              AppRoutes.goToHome(context);
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          // Scrollable form placed below header space
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
                              : (isCompactWidth ? 18.0 : 22.0)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const StyledText(
                              'Sign In',
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            Form(
                              key: _formKey,
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
                                    controller: _emailController,
                                    hintText: 'E-mail Address',
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
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
                                  SizedBox(height: isSmallScreen ? 15 : 20),
                                  Text(
                                    'Password*',
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
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  SizedBox(height: isSmallScreen ? 8 : 12),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        AppRoutes.goToForgetPassword(context);
                                      },
                                      child: Text(
                                        'Forgot you password?',
                                        style: TextStyle(
                                          fontSize: screenWidth < 360
                                              ? 11.0
                                              : (screenWidth < 414 ? 12.5 : 14.0),
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: isSmallScreen ? 20 : 30),
                                  CustomButton(
                                    label: 'Sign In',
                                    onPressed: _isLoading ? null : _loginUser,
                                    isLoading: _isLoading,
                                  ),
                                  SizedBox(height: isSmallScreen ? 12 : 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have account ",
                                        style: TextStyle(
                                          fontSize: screenWidth < 360
                                              ? 11.0
                                              : (screenWidth < 414 ? 12.5 : 14.0),
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          AppRoutes.goToSignup(context);
                                        },
                                        child: Text(
                                          'Create Account',
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
                        ),
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