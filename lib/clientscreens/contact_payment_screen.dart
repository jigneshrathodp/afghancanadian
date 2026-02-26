import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:afghancanadian/new_bottomNavScreen.dart';

import 'package:flutter/material.dart';

class ContactPaymentScreen extends StatefulWidget {
  const ContactPaymentScreen({super.key});

  @override
  State<ContactPaymentScreen> createState() => _ContactPaymentScreenState();
}

class _ContactPaymentScreenState extends State<ContactPaymentScreen> {
  String? _selectedMonth;
  String? _selectedDateRange;
  final Set<int> _expandedItems = {};

  final List<String> _monthOptions = [
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

  final List<Map<String, dynamic>> _payments = [
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
          padding: EdgeInsets.only(bottom: 80 * heightScale),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12 * heightScale),

                // Manage Payment Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Center(
                    child: Text(
                      'Manage Payment',
                      style: TextStyle(
                        fontSize: 18 * widthScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16 * heightScale),

                // Filter Dropdowns Row
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(
                        value: _selectedMonth,
                        hint: 'Current Month',
                        items: _monthOptions,
                        onChanged: (value) {
                          setState(() {
                            _selectedMonth = value;
                          });
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),
                    ),
                    SizedBox(width: 12 * widthScale),
                    Expanded(
                      child: _buildDropdown(
                        value: _selectedDateRange,
                        hint: 'Start - End Date',
                        items: const ['Start - End Date', 'Last 7 Days', 'Last 30 Days'],
                        onChanged: (value) {
                          setState(() {
                            _selectedDateRange = value;
                          });
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16 * heightScale),

                // Payment List Container
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      // Table Header
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 * widthScale,
                          vertical: 10 * heightScale,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4E8D4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12 * widthScale),
                            topRight: Radius.circular(12 * widthScale),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Rep Name',
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Action',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13 * widthScale,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Payment List Items
                      ...List.generate(_payments.length, (index) {
                        final payment = _payments[index];
                        final isExpanded = _expandedItems.contains(index);
                        final hasDetails = payment['details'] != null;

                        return Column(
                          children: [
                            // Main Row
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8 * widthScale,
                                vertical: 8 * heightScale,
                              ),
                              decoration: BoxDecoration(
                                color: index % 2 == 0 ? Colors.white : const Color(0xFFFAFAFA),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Date Column
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: hasDetails
                                              ? () {
                                                  setState(() {
                                                    if (isExpanded) {
                                                      _expandedItems.remove(index);
                                                    } else {
                                                      _expandedItems.add(index);
                                                    }
                                                  });
                                                }
                                              : null,
                                          child: Container(
                                            width: 18 * widthScale,
                                            height: 18 * widthScale,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: hasDetails
                                                    ? const Color(0xFF1B5E20)
                                                    : Colors.grey.shade400,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                isExpanded
                                                    ? Icons.remove
                                                    : Icons.add,
                                                size: 12 * widthScale,
                                                color: hasDetails
                                                    ? const Color(0xFF1B5E20)
                                                    : Colors.grey.shade400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4 * widthScale),
                                        Expanded(
                                          child: Text(
                                            payment['date'],
                                            style: TextStyle(
                                              fontSize: 11 * widthScale,
                                              color: Colors.black87,
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ID Column
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      payment['id'],
                                      style: TextStyle(
                                        fontSize: 12 * widthScale,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  // Rep Name Column
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      payment['repName'],
                                      style: TextStyle(
                                        fontSize: 11 * widthScale,
                                        color: Colors.black87,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                  // Action Column
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Copy action
                                        },
                                        child: Icon(
                                          Icons.content_copy,
                                          size: 18 * widthScale,
                                          color: const Color(0xFF1B5E20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Expanded Details
                            if (isExpanded && hasDetails)
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8 * widthScale,
                                  vertical: 6 * heightScale,
                                ),
                                padding: EdgeInsets.all(10 * widthScale),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8 * widthScale),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Details Row
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Details',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        SizedBox(width: 8 * widthScale),
                                        Expanded(
                                          child: Text(
                                            ': ${payment['details']}',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: Colors.black87,
                                              height: 1.3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6 * heightScale),
                                    // Amount Row
                                    if (payment['amount'] != null)
                                      Row(
                                        children: [
                                          Text(
                                            'Amt.(\$)',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF1B5E20),
                                            ),
                                          ),
                                          SizedBox(width: 8 * widthScale),
                                          Text(
                                            ': ${payment['amount']}',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: 6 * heightScale),
                                    // Status Row
                                    Row(
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        SizedBox(width: 8 * widthScale),
                                        Text(
                                          ': ${payment['status']}',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),

                SizedBox(height: 16 * heightScale),

                // Showing entries text
                Center(
                  child: Text(
                    'Showing 1 to 10 of 19 entries',
                    style: TextStyle(
                      fontSize: 13 * widthScale,
                      color: const Color(0xFF1B5E20),
                    ),
                  ),
                ),

                SizedBox(height: 12 * heightScale),

                // Load More Button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Load more action
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40 * widthScale,
                        vertical: 12 * heightScale,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B5E20),
                        borderRadius: BorderRadius.circular(24 * widthScale),
                      ),
                      child: Text(
                        'Load More',
                        style: TextStyle(
                          fontSize: 15 * widthScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20 * heightScale),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NewCustomBottomBar(
        selectedIndex: -1, // No selection for payment screen
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

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required double widthScale,
    required double heightScale,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10 * widthScale,
        vertical: 4 * heightScale,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: TextStyle(
              fontSize: 13 * widthScale,
              color: Colors.grey.shade600,
            ),
          ),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey.shade600,
            size: 20 * widthScale,
          ),
          style: TextStyle(
            fontSize: 13 * widthScale,
            color: Colors.black87,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item == hint ? null : item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 13 * widthScale,
                  color: Colors.black87,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
