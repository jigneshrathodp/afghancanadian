import 'package:flutter/material.dart';
import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/app_routes.dart';

class ClientsideMenuScreen extends StatelessWidget {
  const ClientsideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Dashboard',
        'icon': Icons.dashboard,
        'route': AppRoutes.dashboard,
      },
      {
        'title': 'Edit Profile',
        'icon': Icons.person,
        'route': AppRoutes.editProfile,
      },
      {
        'title': 'Contact Membership',
        'icon': Icons.card_membership,
        'route': AppRoutes.contactMembership,
      },
      {
        'title': 'Contact Invoice',
        'icon': Icons.receipt,
        'route': AppRoutes.contactInvoice,
      },
      {
        'title': 'Invoice Record Payment',
        'icon': Icons.payment,
        'route': AppRoutes.contactInvoiceRecordPayment,
      },
      {
        'title': 'Contact Donation',
        'icon': Icons.volunteer_activism,
        'route': AppRoutes.contactDonation,
      },
      {
        'title': 'Contact Payment',
        'icon': Icons.credit_card,
        'route': AppRoutes.contactPayment,
      },
      {
        'title': 'Credit Card on File',
        'icon': Icons.credit_score,
        'route': AppRoutes.creditCardOnFile,
      },
      {
        'title': 'Change Password',
        'icon': Icons.lock,
        'route': AppRoutes.creditChangePassword,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Client Side Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  AppRoutes.navigateTo(context, item['route']);
                },
                icon: Icon(item['icon'], color: Colors.white),
                label: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
