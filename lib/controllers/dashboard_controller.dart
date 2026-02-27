import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Sample data that was in the original dashboard screen
  final balanceData = [
    {
      'title': 'Balance Owing',
      'subtitle': 'Total Balance Owing',
      'amount': '\$8324',
      'color': const Color(0xFFE57373),
      'iconBgColor': const Color(0xFFFFCDD2),
      'icon': 'assets/Group1.svg',
    },
    {
      'title': 'Balance Owing',
      'subtitle': 'Pledge Donation',
      'amount': '\$8324',
      'color': const Color(0xFFFFB74D),
      'iconBgColor': const Color(0xFFFFE0B2),
      'icon': 'assets/Group2.svg',
    },
    {
      'title': 'Balance Owing',
      'subtitle': 'Membership',
      'amount': '\$8324',
      'color': const Color(0xFF4DB6AC),
      'iconBgColor': const Color(0xFFB2DFDB),
      'icon': 'assets/Group3.svg',
    },
    {
      'title': 'Balance Owing',
      'subtitle': 'Manual Invoices',
      'amount': '\$8324',
      'color': const Color(0xFF9575CD),
      'iconBgColor': const Color(0xFFD1C4E9),
      'icon': 'assets/Group4.svg',
    },
  ];

  final payments = [
    {
      'id': '#00095',
      'date': 'Nov 14, 2025 12:00am',
      'details': 'Donation #00042 - Payment received for pledge donation #42',
      'amount': '\$121.50',
    },
    {
      'id': '#00094',
      'date': 'Nov 13, 2025 12:00am',
      'details': 'Donation #00041 - Payment received for pledge donation #41',
      'amount': '\$121.50',
    },
    {
      'id': '#00093',
      'date': 'Nov 14, 2025 12:00am',
      'details': 'Donation #00040 -',
      'amount': '\$11.11',
    },
    {
      'id': '#00092',
      'date': 'Nov 14, 2025 12:00am',
      'details': 'Donation #00039 -',
      'amount': '\$100.00',
    },
  ];

  final invoices = [
    {
      'id': '#00055',
      'date': 'Nov 15, 2025 12:00am',
      'status': 'Unpaid',
      'details': 'Payment: Membership Application,',
      'balanceDue': '\$6.25',
      'amount': '\$6.25',
    },
    {
      'id': '#00058',
      'date': 'Nov 15, 2025 12:00am',
      'status': 'Unpaid',
      'details': 'Payment: Manual Invoice,',
      'balanceDue': '\$11.11',
      'amount': '\$111.11',
    },
    {
      'id': '#00060',
      'date': 'Nov 15, 2025 12:00am',
      'status': 'Unpaid',
      'details': 'Payment: Manual Invoice,',
      'balanceDue': '\$100.15',
      'amount': '\$100.15',
    },
    {
      'id': '#00061',
      'date': 'Nov 15, 2025 12:00am',
      'status': 'Unpaid',
      'details': 'Payment: Import,',
      'balanceDue': '\$600.00',
      'amount': '\$600.00',
    },
  ];
}