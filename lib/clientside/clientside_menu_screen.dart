import 'package:flutter/material.dart';
import 'package:afghancanadian/widgets/app_colors.dart';

import 'Contact_membership_screen.dart';
import 'contact_Invoice_recode_payment_screen.dart';
import 'contact_Invoice_screen.dart';
import 'contact_donation_add_screen.dart';
import 'contact_donation_screen.dart';
import 'contact_payment_screen.dart';
import 'credit_card_on_file_screen.dart';
import 'credit_change_password_screen.dart';
import 'dashboard_screen.dart';
import 'edit_profile_screen.dart';

class ClientsideMenuScreen extends StatelessWidget {
  const ClientsideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Dashboard',
        'icon': Icons.dashboard,
        'screen': const DashboardScreen(),
      },
      {
        'title': 'Edit Profile',
        'icon': Icons.person,
        'screen': const EditProfileScreen(),
      },
      {
        'title': 'Contact Membership',
        'icon': Icons.card_membership,
        'screen': const ContactMembershipScreen(),
      },
      {
        'title': 'Contact Invoice',
        'icon': Icons.receipt,
        'screen': const ContactInvoiceScreen(),
      },
      {
        'title': 'Invoice Record Payment',
        'icon': Icons.payment,
        'screen': const ContactInvoiceRecordPaymentScreen(),
      },
      {
        'title': 'Contact Donation',
        'icon': Icons.volunteer_activism,
        'screen': const ContactDonationScreen(),
      },
      {
        'title': 'Add Donation',
        'icon': Icons.add_circle,
        'screen': const ContactDonationAddScreen(),
      },
      {
        'title': 'Contact Payment',
        'icon': Icons.credit_card,
        'screen': const ContactPaymentScreen(),
      },
      {
        'title': 'Credit Card on File',
        'icon': Icons.credit_score,
        'screen': const CreditCardOnFileScreen(),
      },
      {
        'title': 'Change Password',
        'icon': Icons.lock,
        'screen': const CreditChangePasswordScreen(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item['screen'],
                    ),
                  );
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
