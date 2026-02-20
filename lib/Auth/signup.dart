import 'package:flutter/material.dart';
import 'signin.dart';
import '../widgets/custom_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // UI-only: simulate registration
      await Future.delayed(const Duration(milliseconds: 600));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful! Please login.'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate back to Sign In screen
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
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

    final headerHeight = screenHeight * 0.35;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Form on top (scrollable)
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
                      // Header image is now inside the scrollable content so it scrolls away
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
                              'Sign Up',
                            ),
                            SizedBox(height: isSmallScreen ? 12 : 20),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'User Name',
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
                                    controller: _userNameController,
                                    hintText: 'User Name',
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a username';
                                      }
                                      if (value.length < 3) {
                                        return 'Username must be at least 3 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: isSmallScreen ? 15 : 20),
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
                                    hintText: 'Email Address',
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
                                    textInputAction: TextInputAction.next,
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
                                    controller: _confirmPasswordController,
                                    hintText: 'Confirm Password',
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  SizedBox(height: isSmallScreen ? 20 : 30),
                                  CustomButton(
                                    label: 'Submit',
                                    onPressed: _registerUser,
                                  ),
                                  SizedBox(height: isSmallScreen ? 10 : 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have account ',
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const Signin(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                            fontSize: screenWidth < 360
                                                ? 11.0
                                                : (screenWidth < 414 ? 12.5 : 14.0),
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF2D5015),
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
