import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardOnFileScreen extends StatefulWidget {
  const CreditCardOnFileScreen({super.key});

  @override
  State<CreditCardOnFileScreen> createState() => _CreditCardOnFileScreenState();
}

class _CreditCardOnFileScreenState extends State<CreditCardOnFileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
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
          padding: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Center(
                child: Text(
                  'Manage Credit Card On File',
                  style: TextStyle(
                    fontSize: 20 * widthScale,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
              SizedBox(height: 20 * heightScale),
              // Main Card Container
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16 * widthScale),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Green Header
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16 * widthScale),
                          topRight: Radius.circular(16 * widthScale),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Add Credit Card On File',
                          style: TextStyle(
                            fontSize: 18 * widthScale,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Form Content
                    Padding(
                      padding: EdgeInsets.all(20 * widthScale),
                      child: Column(
                        children: [
                          // Name on Card Field
                          _buildTextField(
                            controller: _nameController,
                            labelText: 'Name on Card',
                            hintText: 'Enter name on card',
                            widthScale: widthScale,
                            heightScale: heightScale,
                          ),
                          SizedBox(height: 16 * heightScale),
                          // Card Number Field
                          _buildTextField(
                            controller: _cardNumberController,
                            labelText: 'Card Number',
                            hintText: 'Enter card number',
                            widthScale: widthScale,
                            heightScale: heightScale,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16 * heightScale),
                          // Expire Date Field
                          _buildTextField(
                            controller: _expiryController,
                            labelText: 'Expire Date (MM/YY)',
                            hintText: 'MM/YY',
                            widthScale: widthScale,
                            heightScale: heightScale,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16 * heightScale),
                          // CVV Field
                          _buildTextField(
                            controller: _cvvController,
                            labelText: 'CVV',
                            hintText: 'Enter CVV',
                            widthScale: widthScale,
                            heightScale: heightScale,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          ),
                          SizedBox(height: 20 * heightScale),
                          // Credit Card SVG Display
                          Container(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12 * widthScale),
                              child: AspectRatio(
                                aspectRatio: 331 / 142,
                                child: SvgPicture.asset(
                                  'assets/card.svg',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20 * heightScale),
                          // Submit Button
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(30 * widthScale),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 18 * widthScale,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: -1, // No selection for credit card screen
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required double widthScale,
    required double heightScale,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14 * widthScale,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 6 * heightScale),
        // Text Field
        Container(
          width: double.infinity,
          height: 48 * heightScale,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8 * widthScale),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: 14 * widthScale,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14 * widthScale,
                color: Colors.grey.shade500,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16 * widthScale,
                vertical: 12 * heightScale,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
