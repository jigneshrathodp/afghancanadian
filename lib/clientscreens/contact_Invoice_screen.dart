import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:flutter/material.dart';

class ContactInvoiceScreen extends StatefulWidget {
  const ContactInvoiceScreen({super.key});

  @override
  State<ContactInvoiceScreen> createState() => _ContactInvoiceScreenState();
}

class _ContactInvoiceScreenState extends State<ContactInvoiceScreen> {
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

  final List<Map<String, dynamic>> _invoices = [
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

                // Manage Invoices Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Center(
                    child: Text(
                      'Manage Invoices',
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

                // Invoice List Container
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
                                'Invoice #',
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

                      // Invoice List Items
                      ...List.generate(_invoices.length, (index) {
                        final invoice = _invoices[index];
                        final isExpanded = _expandedItems.contains(index);
                        final hasDetails = invoice['invoiceType'] != null;

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
                                            invoice['date'],
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
                                  // Invoice # Column
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      invoice['invoiceNumber'],
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
                                      invoice['repName'],
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
                                    child: Column(
                                      children: [
                                        // Copy Icon
                                        GestureDetector(
                                          onTap: () {
                                            // Copy action
                                          },
                                          child: Icon(
                                            Icons.content_copy,
                                            size: 18 * widthScale,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        SizedBox(height: 6 * heightScale),
                                        // Record Payment Button
                                        GestureDetector(
                                          onTap: () {
                                            // Navigate to record payment
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 6 * widthScale,
                                              vertical: 4 * heightScale,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1B5E20),
                                              borderRadius: BorderRadius.circular(4 * widthScale),
                                            ),
                                            child: Text(
                                              'Record\nPayment',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 9 * widthScale,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                height: 1.2,
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
                                    // Invoice Type
                                    Row(
                                      children: [
                                        Text(
                                          'Invoice Type : ',
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF1B5E20),
                                          ),
                                        ),
                                        Text(
                                          invoice['invoiceType'],
                                          style: TextStyle(
                                            fontSize: 12 * widthScale,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6 * heightScale),
                                    // Amount
                                    if (invoice['amount'] != null)
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
                                            ': Balance due: \$${invoice['balanceDue']}',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: const Color(0xFFE53935),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (invoice['amount'] != null)
                                      Padding(
                                        padding: EdgeInsets.only(left: 50 * widthScale),
                                        child: Text(
                                          'Total Amount: \$${invoice['totalAmount']}',
                                          style: TextStyle(
                                            fontSize: 11 * widthScale,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 6 * heightScale),
                                    // Status
                                    if (invoice['status'] != null)
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
                                            ': ',
                                            style: TextStyle(
                                              fontSize: 12 * widthScale,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8 * widthScale,
                                              vertical: 2 * heightScale,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(invoice['statusColor']),
                                              borderRadius: BorderRadius.circular(4 * widthScale),
                                            ),
                                            child: Text(
                                              invoice['status'],
                                              style: TextStyle(
                                                fontSize: 11 * widthScale,
                                                fontWeight: FontWeight.w500,
                                                color: Color(invoice['statusTextColor']),
                                              ),
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
                      color: Colors.grey.shade600,
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
