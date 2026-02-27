import 'package:get/get.dart';

class InvoiceController extends GetxController {
  // Selected options
  final selectedMonth = Rxn<String>();
  final selectedDateRange = Rxn<String>();
  
  final monthOptions = [
    'Current Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  // Expanded items for invoices
  final expandedItems = <int>{}.obs;

  // Sample invoices data
  final invoices = [
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00065',
      'repName': 'Test Contact\nACIC',
      'invoiceType': 'Import',
      'amount': '750',
      'balanceDue': '750',
      'totalAmount': '750.00',
      'status': 'Unpaid',
      'statusColor': 0xFFFFCDD2,
      'statusTextColor': 0xFFE53935,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00064',
      'repName': 'Test Contact\nACIC',
      'invoiceType': 'Manual Invoice',
      'amount': '100',
      'balanceDue': '100',
      'totalAmount': '100.00',
      'status': 'Void',
      'statusColor': 0xFFE0E0E0,
      'statusTextColor': 0xFF757575,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00063',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00062',
      'repName': 'Test Contact\nACIC',
      'invoiceType': 'Manual Invoice',
      'amount': '11.11',
      'balanceDue': '11.11',
      'totalAmount': '111.11',
      'status': 'Partially Paid',
      'statusColor': 0xFFFFF9C4,
      'statusTextColor': 0xFFFBC02D,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00061',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00060',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00059',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00058',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00057',
      'repName': 'Test Contact\nACIC',
      'invoiceType': 'Membership Changed',
      'amount': '6.25',
      'balanceDue': null,
      'totalAmount': null,
      'status': 'Fully Paid',
      'statusColor': 0xFFC8E6C9,
      'statusTextColor': 0xFF2E7D32,
    },
    {
      'date': 'Nov,\n13,\n2025\n06:05\nam',
      'invoiceNumber': '00056',
      'repName': 'Test Contact\nACIC',
      'invoiceType': null,
      'amount': null,
      'balanceDue': null,
      'totalAmount': null,
      'status': null,
    },
  ];

  void toggleExpandedItem(int index) {
    if (expandedItems.contains(index)) {
      expandedItems.remove(index);
    } else {
      expandedItems.add(index);
    }
  }
}