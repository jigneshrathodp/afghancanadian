import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';

import 'package:flutter/material.dart';

class ContactDonationAddScreen extends StatefulWidget {
  const ContactDonationAddScreen({super.key});

  @override
  State<ContactDonationAddScreen> createState() => _ContactDonationAddScreenState();
}

class _ContactDonationAddScreenState extends State<ContactDonationAddScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Donation form controllers
  final TextEditingController _donationAmountController = TextEditingController();
  final TextEditingController _donationNoteController = TextEditingController();
  String? _selectedDonationReason;

  // Pledge Donation form controllers
  final TextEditingController _pledgeAmountController = TextEditingController();
  final TextEditingController _pledgeNoteController = TextEditingController();
  String? _selectedPledgeReason;

  // Recurring Donation form controllers
  final TextEditingController _recurringAmountController = TextEditingController();
  String? _selectedRecurringStatus;
  String _emiType = 'Monthly';

  final List<String> _reasons = [
    'General Donation',
    'Zakat',
    'Sadaqah',
    'Charity',
    'Other',
  ];

  final List<String> _statuses = [
    'Active',
    'Inactive',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _donationAmountController.dispose();
    _donationNoteController.dispose();
    _pledgeAmountController.dispose();
    _pledgeNoteController.dispose();
    _recurringAmountController.dispose();
    super.dispose();
  }

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
        child: Column(
          children: [
            // Manage Donations Header
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
              padding: EdgeInsets.symmetric(vertical: 16 * heightScale),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12 * widthScale),
              ),
              child: Center(
                child: Text(
                  'Manage Donations',
                  style: TextStyle(
                    fontSize: 20 * widthScale,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1B5E20),
                  ),
                ),
              ),
            ),

            // Tab Bar
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth > 600;
                  return TabBar(
                    controller: _tabController,
                    isScrollable: false,
                    indicator: BoxDecoration(
                      color: const Color(0xFF1B5E20),
                      borderRadius: BorderRadius.circular(8 * widthScale),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade600,
                    labelStyle: TextStyle(
                      fontSize: isTablet ? 16 * widthScale : 13 * widthScale,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: isTablet ? 16 * widthScale : 13 * widthScale,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        height: isTablet ? 56 * heightScale : null,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Donation',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        height: isTablet ? 56 * heightScale : null,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Pledge Donation',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Tab(
                        height: isTablet ? 56 * heightScale : null,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Recurring Donation',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 16 * heightScale),

            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDonationTab(widthScale, heightScale),
                  _buildPledgeDonationTab(widthScale, heightScale),
                  _buildRecurringDonationTab(widthScale, heightScale),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationTab(double widthScale, double heightScale) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      child: Column(
        children: [
          // Donation Info Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12 * widthScale),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12 * widthScale),
                      topRight: Radius.circular(12 * widthScale),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Donation Info',
                      style: TextStyle(
                        fontSize: 18 * widthScale,
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
                      // Amount Field
                      _buildLabel('Amount*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildAmountField(_donationAmountController, widthScale, heightScale),

                      SizedBox(height: 16 * heightScale),

                      // Reason Dropdown
                      _buildLabel('Reason*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildDropdown(
                        value: _selectedDonationReason,
                        hint: 'Select',
                        items: _reasons,
                        onChanged: (value) {
                          setState(() {
                            _selectedDonationReason = value;
                          });
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),

                      SizedBox(height: 16 * heightScale),

                      // Note Field
                      _buildLabel('Note', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildTextField(
                        controller: _donationNoteController,
                        hint: 'Note',
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),

                      SizedBox(height: 24 * heightScale),

                      // Submit Button
                      _buildSubmitButton(() {
                        // Handle donation submit
                      }, widthScale, heightScale),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24 * heightScale),
        ],
      ),
    );
  }

  Widget _buildPledgeDonationTab(double widthScale, double heightScale) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      child: Column(
        children: [
          // Add Pledge Donation Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12 * widthScale),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12 * widthScale),
                      topRight: Radius.circular(12 * widthScale),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add Pledge Donation',
                      style: TextStyle(
                        fontSize: 18 * widthScale,
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
                      // Amount Field
                      _buildLabel('Amount*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildAmountField(_pledgeAmountController, widthScale, heightScale),

                      SizedBox(height: 16 * heightScale),

                      // Reason Dropdown
                      _buildLabel('Reason*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildDropdown(
                        value: _selectedPledgeReason,
                        hint: 'Select',
                        items: _reasons,
                        onChanged: (value) {
                          setState(() {
                            _selectedPledgeReason = value;
                          });
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),

                      SizedBox(height: 16 * heightScale),

                      // Note Field
                      _buildLabel('Note', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildTextField(
                        controller: _pledgeNoteController,
                        hint: 'Note',
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),

                      SizedBox(height: 24 * heightScale),

                      // Submit Button
                      _buildSubmitButton(() {
                        // Handle pledge donation submit
                      }, widthScale, heightScale),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24 * heightScale),
        ],
      ),
    );
  }

  Widget _buildRecurringDonationTab(double widthScale, double heightScale) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      child: Column(
        children: [
          // Recurring Donation Info Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12 * widthScale),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5E20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12 * widthScale),
                      topRight: Radius.circular(12 * widthScale),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Recurring Donation Info',
                      style: TextStyle(
                        fontSize: 18 * widthScale,
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
                      // Amount Field
                      _buildLabel('Amount*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildAmountField(_recurringAmountController, widthScale, heightScale),

                      SizedBox(height: 16 * heightScale),

                      // EMI Date Label
                      _buildLabel('EMI Date*', widthScale),
                      SizedBox(height: 8 * heightScale),

                      // Radio Buttons
                      Row(
                        children: [
                          _buildRadioButton(
                            value: 'Monthly',
                            groupValue: _emiType,
                            label: 'Monthly',
                            onChanged: (value) {
                              setState(() {
                                _emiType = value!;
                              });
                            },
                            widthScale: widthScale,
                          ),
                          SizedBox(width: 16 * widthScale),
                          _buildRadioButton(
                            value: 'Yearly',
                            groupValue: _emiType,
                            label: 'Yearly',
                            onChanged: (value) {
                              setState(() {
                                _emiType = value!;
                              });
                            },
                            widthScale: widthScale,
                          ),
                        ],
                      ),

                      SizedBox(height: 16 * heightScale),

                      // Status Dropdown
                      _buildLabel('Status*', widthScale),
                      SizedBox(height: 8 * heightScale),
                      _buildDropdown(
                        value: _selectedRecurringStatus,
                        hint: 'Select',
                        items: _statuses,
                        onChanged: (value) {
                          setState(() {
                            _selectedRecurringStatus = value;
                          });
                        },
                        widthScale: widthScale,
                        heightScale: heightScale,
                      ),

                      SizedBox(height: 24 * heightScale),

                      // Submit Button
                      _buildSubmitButton(() {
                        // Handle recurring donation submit
                      }, widthScale, heightScale),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24 * heightScale),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, double widthScale) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14 * widthScale,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildAmountField(TextEditingController controller, double widthScale, double heightScale) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale, vertical: 14 * heightScale),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8 * widthScale),
                bottomLeft: Radius.circular(8 * widthScale),
              ),
              border: Border(
                right: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Text(
              '\$',
              style: TextStyle(
                fontSize: 16 * widthScale,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Amount',
                hintStyle: TextStyle(
                  fontSize: 14 * widthScale,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12 * widthScale, vertical: 14 * heightScale),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required double widthScale,
    required double heightScale,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14 * widthScale,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12 * widthScale, vertical: 14 * heightScale),
          border: InputBorder.none,
          isDense: true,
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
            child: Text(
              hint,
              style: TextStyle(
                fontSize: 14 * widthScale,
                color: Colors.grey,
              ),
            ),
          ),
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20 * widthScale),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14 * widthScale,
                    color: Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildRadioButton({
    required String value,
    required String groupValue,
    required String label,
    required ValueChanged<String?> onChanged,
    required double widthScale,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: const Color(0xFF1B5E20),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14 * widthScale,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(VoidCallback onPressed, double widthScale, double heightScale) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14 * heightScale),
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
    );
  }
}
