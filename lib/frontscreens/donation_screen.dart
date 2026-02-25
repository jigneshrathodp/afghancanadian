import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    // Responsive padding and spacing
    final horizontalPadding = isTablet ? screenWidth * 0.1 : 35.0;
    final cardWidth = isTablet ? screenWidth * 0.8 : screenWidth - 70;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    "Make a difference by sending donation",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: cardWidth,
                child: Column(
                  children: [
                    _buildInputField("Applicant First Name", isTablet, isRequired: true),
                    _buildInputField("Applicant Last Name", isTablet, isRequired: true),
                    _buildInputField("Email Address", isTablet, isRequired: true),
                    _buildInputField("Home/Office Phone Number", isTablet, isRequired: true),
                    _buildInputField("Donate (\$CAD)", isTablet, isRequired: true),
                    _buildDropdownField("Payment frequency", isTablet),
                    _buildInputField("Comment", isTablet, maxLines: 4),
                    const SizedBox(height: 20),

                    // Pay Button
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 55 : 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonPrimary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Pay",
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05 > 60 ? 60 : screenHeight * 0.05)
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, bool isTablet,
      {int maxLines = 1, bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isTablet ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(
                fontSize: isTablet ? 18 : 16,
                color: Colors.grey.shade500,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: maxLines > 1 ? 16 : 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.borderPrimary, width: 2),
              ),
            ),
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, bool isTablet) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTablet ? 16 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: "Select payment Frequency",
              hintStyle: TextStyle(
                fontSize: isTablet ? 18 : 16,
                color: Colors.grey.shade500,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.borderPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColors.borderPrimary, width: 2),
              ),
            ),
            items: const [
              DropdownMenuItem(value: 'one-time', child: Text('One Time')),
              DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
              DropdownMenuItem(value: 'yearly', child: Text('Yearly')),
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}