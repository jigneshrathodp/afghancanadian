import 'package:get/get.dart';

class PaymentController extends GetxController {
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

  // Expanded items for payment details
  final expandedItems = <int>{}.obs;

  final payments = [
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00095',
      'repName': 'Test Contact\nACIC',
      'details': 'Donation #00042 Payment received for pledge donation #42',
      'amount': '121.50',
      'status': '',
      'isPositive': false,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00094',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00093',
      'repName': 'Test Contact\nACIC',
      'details': 'Payment : Cash\nRefund Settled',
      'amount': '-100.15',
      'status': '',
      'isPositive': false,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00092',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00091',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00090',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00089',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00088',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00087',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
    },
    {
      'date': 'Nov,\n14,\n2025\n12:00\nam',
      'id': '00086',
      'repName': 'Test Contact\nACIC',
      'details': null,
      'amount': null,
      'status': null,
      'isPositive': true,
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