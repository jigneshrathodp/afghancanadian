import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'widgets/custom_widgets.dart';

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
      final prefs = await SharedPreferences.getInstance();

      // Get stored user data
      final storedEmail = prefs.getString('email');
      final storedPassword = prefs.getString('password');
      final isRegistered = prefs.getBool('isRegistered') ?? false;

      if (!isRegistered) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not registered. Please sign up first.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      // Check if credentials match
      if (_emailController.text.trim() == storedEmail &&
          _passwordController.text == storedPassword) {
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

          // Save login state
          await prefs.setBool('isLoggedIn', true);
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Login successful!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigate to home screen
                        // Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid email or password!'),
              backgroundColor: Colors.red,
            ),
          );
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

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              bottom: isKeyboardOpen ? (20.0 + devicePreviewPadding) : 0.0
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - (isKeyboardOpen ? devicePreviewPadding : 0.0),
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Responsive logo container with adjusted height
                    Container(
                      width: double.infinity,
                      height: isSmallScreen
                          ? screenHeight * 0.18
                          : screenHeight * 0.22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Form Container with adaptive padding and height constraints
                    Expanded(
                      child: Container(
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
                            // Flexible form container that adapts to keyboard
                            Flexible(
                              fit: FlexFit.loose,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Email Field
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
                                    // Password Field
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
                                    // Forgot Password Link
                                    Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Forgot password feature coming soon',
                                              ),
                                            ),
                                          );
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
                                    // Sign In Button
                                    CustomButton(
                                      label: 'Sign In',
                                      onPressed: _isLoading ? null : _loginUser,
                                      isLoading: _isLoading,
                                    ),
                                    SizedBox(height: isSmallScreen ? 12 : 16),
                                    // Sign Up Link
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const Signup(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Create Account',
                                            style: TextStyle(
                                              fontSize: screenWidth < 360
                                                  ? 11.0
                                                  : (screenWidth < 414 ? 12.5 : 14.0),
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF2D5016),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}