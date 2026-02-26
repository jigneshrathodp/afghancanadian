import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav_screen.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;
    final isTablet = ResponsiveHelper.isTablet(context);
    
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16 * widthScale),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Donation",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20 * scales.heightScale),
                _buildInputField("Full Name", isTablet, isRequired: true),
                _buildInputField("Email Address", isTablet, isRequired: true),
                _buildInputField("Phone Number", isTablet),
                _buildInputField("Donation Amount", isTablet, isRequired: true),
                _buildInputField("Message", isTablet, maxLines: 5),
                _buildDropdownField("Payment Frequency", isTablet),
                SizedBox(height: 20 * scales.heightScale),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50 * scales.heightScale),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Donate Now",
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 5, // Donation
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToAbout(context);
              break;
            case 1:
              AppRoutes.goToCalendar(context);
              break;
            case 2:
              AppRoutes.goToHome(context);
              break;
            case 3:
              AppRoutes.goToServices(context);
              break;
            case 4:
              AppRoutes.goToContact(context);
              break;
            case 5:
              AppRoutes.goToDonation(context);
              break;
          }
        },
        scales: scales,
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