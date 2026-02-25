import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactInvoiceRecordPaymentScreen extends StatefulWidget {
  final Map<String, dynamic>? invoiceData;

  const ContactInvoiceRecordPaymentScreen({
    super.key,
    this.invoiceData,
  });

  @override
  State<ContactInvoiceRecordPaymentScreen> createState() =>
      _ContactInvoiceRecordPaymentScreenState();
}

class _ContactInvoiceRecordPaymentScreenState
    extends State<ContactInvoiceRecordPaymentScreen> {
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expireDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String? _selectedMonth;
  String? _selectedDateRange;

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

  @override
  void dispose() {
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expireDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    // Sample invoice data - in real app this comes from widget.invoiceData
    final invoiceNumber = widget.invoiceData?['invoiceNumber'] ?? '#65';
    final invoiceNote = widget.invoiceData?['note'] ?? '- Note 3';
    final createdDate = widget.invoiceData?['createdDate'] ?? 'Oct, 11 2025';
    final amount = widget.invoiceData?['amount'] ?? '750';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12 * heightScale),

                // Manage Invoices Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                  ),
                  child: Center(
                    child: Text(
                      'Manage Invoices',
                      style: TextStyle(
                        fontSize: 20 * widthScale,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20 * heightScale),

                // Filter and Invoice List Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FBF7),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16 * widthScale),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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

                        // Invoice List Button
                        Center(
                          child: Container(
                            width: 180 * widthScale,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to invoice list
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5E20),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  vertical: 12 * heightScale,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24 * widthScale),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Invoice List',
                                style: TextStyle(
                                  fontSize: 16 * widthScale,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20 * heightScale),

                // Credit Card Info Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FBF7),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Credit Card Info Header
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12 * heightScale,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC8E6C9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12 * widthScale),
                            topRight: Radius.circular(12 * widthScale),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Credit Card Info',
                            style: TextStyle(
                              fontSize: 16 * widthScale,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16 * widthScale),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name on Card
                            Text(
                              'Name on Card',
                              style: TextStyle(
                                fontSize: 14 * widthScale,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8 * heightScale),
                            _buildTextField(
                              controller: _nameOnCardController,
                              hint: 'Name on Card',
                              widthScale: widthScale,
                              heightScale: heightScale,
                            ),

                            SizedBox(height: 16 * heightScale),

                            // Card Number
                            Text(
                              'Card Number',
                              style: TextStyle(
                                fontSize: 14 * widthScale,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8 * heightScale),
                            _buildTextField(
                              controller: _cardNumberController,
                              hint: 'Card Number',
                              widthScale: widthScale,
                              heightScale: heightScale,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                              ],
                            ),

                            SizedBox(height: 16 * heightScale),

                            // Expire Date
                            Text(
                              'Expire Date',
                              style: TextStyle(
                                fontSize: 14 * widthScale,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8 * heightScale),
                            _buildTextField(
                              controller: _expireDateController,
                              hint: 'MM/YY',
                              widthScale: widthScale,
                              heightScale: heightScale,
                              keyboardType: TextInputType.number,
                            ),

                            SizedBox(height: 16 * heightScale),

                            // CVV
                            Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 14 * widthScale,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8 * heightScale),
                            _buildTextField(
                              controller: _cvvController,
                              hint: 'Card CVV Number',
                              widthScale: widthScale,
                              heightScale: heightScale,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20 * heightScale),

                // Details Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FBF7),
                    borderRadius: BorderRadius.circular(12 * widthScale),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Details Header
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12 * heightScale,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC8E6C9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12 * widthScale),
                            topRight: Radius.circular(12 * widthScale),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 16 * widthScale,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16 * widthScale),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Invoice Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Invoice $invoiceNumber',
                                      style: TextStyle(
                                        fontSize: 14 * widthScale,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1B5E20),
                                      ),
                                    ),
                                    SizedBox(height: 4 * heightScale),
                                    Text(
                                      '$invoiceNote Created on : $createdDate',
                                      style: TextStyle(
                                        fontSize: 12 * widthScale,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$$amount',
                                  style: TextStyle(
                                    fontSize: 16 * widthScale,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 12 * heightScale),

                            // Divider
                            Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                            ),

                            SizedBox(height: 12 * heightScale),

                            // Total Amount Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total amount :',
                                  style: TextStyle(
                                    fontSize: 14 * widthScale,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF1B5E20),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$$amount',
                                      style: TextStyle(
                                        fontSize: 16 * widthScale,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      '(CAD)',
                                      style: TextStyle(
                                        fontSize: 12 * widthScale,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24 * heightScale),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    // Handle payment submission
                    _submitPayment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E20),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 14 * heightScale,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24 * widthScale),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16 * widthScale,
                      fontWeight: FontWeight.w600,
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
        horizontal: 12 * widthScale,
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
              fontSize: 14 * widthScale,
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
            fontSize: 14 * widthScale,
            color: Colors.black87,
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item == hint ? null : item,
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14 * widthScale,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required double widthScale,
    required double heightScale,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14 * widthScale,
            color: Colors.grey.shade500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12 * widthScale,
            vertical: 12 * heightScale,
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        style: TextStyle(
          fontSize: 14 * widthScale,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _submitPayment() {
    // Validate fields
    if (_nameOnCardController.text.isEmpty ||
        _cardNumberController.text.isEmpty ||
        _expireDateController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Process payment
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment submitted successfully'),
        backgroundColor: Color(0xFF1B5E20),
      ),
    );
  }
}
