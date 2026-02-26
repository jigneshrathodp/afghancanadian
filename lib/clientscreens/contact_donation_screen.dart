import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:flutter/material.dart';

class ContactDonationScreen extends StatefulWidget {
  const ContactDonationScreen({super.key});

  @override
  State<ContactDonationScreen> createState() => _ContactDonationScreenState();
}

class _ContactDonationScreenState extends State<ContactDonationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Set<int> _expandedRows = {};

  // Form visibility states
  bool _showDonationForm = false;
  bool _showPledgeForm = false;
  bool _showRecurringForm = false;

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

  // Sample data for Donation tab
  final List<Map<String, dynamic>> donationData = [
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation\nid-12 note',
      'amount': '0.01',
      'isExpandable': true,
    },
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation\nid-12 note',
      'amount': '',
      'isExpandable': false,
    },
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation\nid-12 note',
      'amount': '',
      'isExpandable': false,
    },
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation\nid-12 note',
      'amount': '',
      'isExpandable': false,
    },
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation id-12 note',
      'amount': '',
      'isExpandable': false,
    },
    {
      'id': '00031',
      'date': 'Nov 13, 2025\n06:05am',
      'note': 'Pledge donation\nid-12 note',
      'amount': '',
      'isExpandable': false,
    },
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

  void _toggleRow(int index) {
    setState(() {
      if (_expandedRows.contains(index)) {
        _expandedRows.remove(index);
      } else {
        _expandedRows.add(index);
      }
    });
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
            // Manage Donations Header (same as ContactDonationAddScreen)
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16 * widthScale,
                vertical: 12 * heightScale,
              ),
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
                            'Recurring',
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

            // Tab Content
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

  Widget _buildTab(String text, int index, double widthScale, double heightScale) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        final isSelected = _tabController.index == index;
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 4 * widthScale,
            vertical: 8 * heightScale,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12 * widthScale,
            vertical: 10 * heightScale,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryDark : Colors.transparent,
            borderRadius: BorderRadius.circular(8 * widthScale),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13 * widthScale,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDonationTab(double widthScale, double heightScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Filters Row
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown('November 2025', widthScale, heightScale),
                    ),
                    SizedBox(width: 12 * widthScale),
                    Expanded(
                      child: _buildDropdown('Start - End Date', widthScale, heightScale),
                    ),
                  ],
                ),
                SizedBox(height: 12 * heightScale),
                // Search and Record Button Row
                Row(
                  children: [
                    Expanded(
                      child: _buildSearchField(widthScale, heightScale),
                    ),
                    SizedBox(width: 12 * widthScale),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showDonationForm = !_showDonationForm;
                        });
                      },
                      child: _buildActionButton(
                        'Record A Donation',
                        widthScale,
                        heightScale,
                      ),
                    ),
                  ],
                ),
                // Donation Form Card
                if (_showDonationForm) ...[
                  SizedBox(height: 16 * heightScale),
                  _buildDonationFormCard(widthScale, heightScale),
                ],
                SizedBox(height: 16 * heightScale),
                // Table Header
                _buildTableHeader(widthScale, heightScale),
                // Table Content
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: donationData.length,
                  itemBuilder: (context, index) {
                    return _buildDonationRow(
                      donationData[index],
                      index,
                      widthScale,
                      heightScale,
                    );
                  },
                ),
                SizedBox(height: 12 * heightScale),
                // Showing entries text
                Center(
                  child: Text(
                    'Showing 1 to 10 of 19 entries',
                    style: TextStyle(
                      fontSize: 12 * widthScale,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 12 * heightScale),
                // Load More Button
                Center(
                  child: _buildLoadMoreButton(widthScale, heightScale),
                ),
                SizedBox(height: 24 * heightScale),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPledgeDonationTab(double widthScale, double heightScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search and Pledge Button Row
                Row(
                  children: [
                    Expanded(
                      child: _buildSearchField(widthScale, heightScale),
                    ),
                    SizedBox(width: 12 * widthScale),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPledgeForm = !_showPledgeForm;
                        });
                      },
                      child: _buildActionButton(
                        'Pledge A Donation',
                        widthScale,
                        heightScale,
                      ),
                    ),
                  ],
                ),
                // Pledge Form Card
                if (_showPledgeForm) ...[
                  SizedBox(height: 16 * heightScale),
                  _buildPledgeFormCard(widthScale, heightScale),
                ],
                SizedBox(height: 16 * heightScale),
                // Table Header
                _buildPledgeTableHeader(widthScale, heightScale),
                // Empty Table Content
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40 * heightScale),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      right: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8 * widthScale),
                      bottomRight: Radius.circular(8 * widthScale),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'No data available in table',
                      style: TextStyle(
                        fontSize: 14 * widthScale,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16 * heightScale),
                // Showing entries text
                Center(
                  child: Text(
                    'Showing 0 to 0 of 0 entries',
                    style: TextStyle(
                      fontSize: 12 * widthScale,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 24 * heightScale),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecurringDonationTab(double widthScale, double heightScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search and Record Recurring Button Row
                Row(
                  children: [
                    Expanded(
                      child: _buildSearchField(widthScale, heightScale),
                    ),
                    SizedBox(width: 12 * widthScale),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showRecurringForm = !_showRecurringForm;
                        });
                      },
                      child: _buildActionButton(
                        'Record A Recurring\nDonation',
                        widthScale,
                        heightScale,
                      ),
                    ),
                  ],
                ),
                // Recurring Form Card
                if (_showRecurringForm) ...[
                  SizedBox(height: 16 * heightScale),
                  _buildRecurringFormCard(widthScale, heightScale),
                ],
                SizedBox(height: 16 * heightScale),
                // Table Header
                _buildTableHeader(widthScale, heightScale),
                // Empty Table Content
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40 * heightScale),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      right: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8 * widthScale),
                      bottomRight: Radius.circular(8 * widthScale),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'No data available in table',
                      style: TextStyle(
                        fontSize: 14 * widthScale,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16 * heightScale),
                // Showing entries text
                Center(
                  child: Text(
                    'Showing 0 to 0 of 0 entries',
                    style: TextStyle(
                      fontSize: 12 * widthScale,
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 24 * heightScale),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * widthScale,
        vertical: 10 * heightScale,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              hint,
              style: TextStyle(
                fontSize: 13 * widthScale,
                color: AppColors.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 20 * widthScale,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * widthScale,
        vertical: 10 * heightScale,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: Row(
        children: [
          Text(
            'Search',
            style: TextStyle(
              fontSize: 13 * widthScale,
              color: AppColors.textHint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16 * widthScale,
        vertical: 10 * heightScale,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(8 * widthScale),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12 * widthScale,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLoadMoreButton(double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32 * widthScale,
        vertical: 12 * heightScale,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(24 * widthScale),
      ),
      child: Text(
        'Load More',
        style: TextStyle(
          fontSize: 14 * widthScale,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTableHeader(double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * widthScale,
        vertical: 10 * heightScale,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E8D4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8 * widthScale),
          topRight: Radius.circular(8 * widthScale),
        ),
      ),
      child: Row(
        children: [
          // Space for expand/collapse icon
          SizedBox(width: 22 * widthScale),
          SizedBox(width: 4 * widthScale),
          SizedBox(
            width: 50 * widthScale,
            child: Text(
              'ID',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8 * widthScale),
          SizedBox(
            width: 80 * widthScale,
            child: Text(
              'Date',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8 * widthScale),
          Expanded(
            child: Text(
              'Note',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(
            width: 40 * widthScale,
            child: Text(
              'Action',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPledgeTableHeader(double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12 * widthScale,
        vertical: 10 * heightScale,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E8D4),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8 * widthScale),
          topRight: Radius.circular(8 * widthScale),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40 * widthScale,
            child: Text(
              'ID',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8 * widthScale),
          SizedBox(
            width: 90 * widthScale,
            child: Text(
              'Date',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 8 * widthScale),
          Expanded(
            child: Text(
              'Pledge Amt.(\$)',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(
            width: 50 * widthScale,
            child: Text(
              'Action',
              style: TextStyle(
                fontSize: 12 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationRow(
    Map<String, dynamic> data,
    int index,
    double widthScale,
    double heightScale,
  ) {
    final isExpanded = _expandedRows.contains(index);
    final hasAmount = data['amount'] != null && data['amount'].toString().isNotEmpty;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12 * widthScale,
            vertical: 10 * heightScale,
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey.shade300),
              right: BorderSide(color: Colors.grey.shade300),
              bottom: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expand/Collapse Icon
                  if (data['isExpandable'] == true)
                    GestureDetector(
                      onTap: () => _toggleRow(index),
                      child: Icon(
                        isExpanded
                            ? Icons.remove_circle_outline
                            : Icons.add_circle_outline,
                        size: 18 * widthScale,
                        color: AppColors.primaryDark,
                      ),
                    )
                  else
                    SizedBox(
                      width: 18 * widthScale,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 18 * widthScale,
                        color: Colors.transparent,
                      ),
                    ),
                  SizedBox(width: 4 * widthScale),
                  // ID
                  SizedBox(
                    width: 50 * widthScale,
                    child: Text(
                      data['id'],
                      style: TextStyle(
                        fontSize: 12 * widthScale,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * widthScale),
                  // Date
                  SizedBox(
                    width: 80 * widthScale,
                    child: Text(
                      data['date'],
                      style: TextStyle(
                        fontSize: 11 * widthScale,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * widthScale),
                  // Note - with constrained width
                  Expanded(
                    child: Text(
                      data['note'],
                      style: TextStyle(
                        fontSize: 11 * widthScale,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Action Icon
                  SizedBox(
                    width: 40 * widthScale,
                    child: Center(
                      child: Icon(
                        Icons.print_outlined,
                        size: 20 * widthScale,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                ],
              ),
              // Expanded Amount Field
              if (isExpanded && hasAmount) ...[
                SizedBox(height: 8 * heightScale),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12 * widthScale,
                    vertical: 8 * heightScale,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8 * widthScale),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Amt.(\$)',
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 8 * widthScale),
                      Text(
                        ': ${data['amount']}',
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // Donation Form Card
  Widget _buildDonationFormCard(double widthScale, double heightScale) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * widthScale),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14 * heightScale, horizontal: 16 * widthScale),
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12 * widthScale),
                topRight: Radius.circular(12 * widthScale),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showDonationForm = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24 * widthScale,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Amount Field
                _buildFormLabel('Amount*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildAmountField(_donationAmountController, widthScale, heightScale),
                SizedBox(height: 16 * heightScale),
                // Reason Dropdown
                _buildFormLabel('Reason*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildFormDropdown(
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
                _buildFormLabel('Note', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildFormTextField(
                  controller: _donationNoteController,
                  hint: 'Note',
                  widthScale: widthScale,
                  heightScale: heightScale,
                ),
                SizedBox(height: 24 * heightScale),
                // Submit Button
                _buildFormSubmitButton(() {
                  // Handle donation submit
                }, widthScale, heightScale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Pledge Form Card
  Widget _buildPledgeFormCard(double widthScale, double heightScale) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * widthScale),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14 * heightScale, horizontal: 16 * widthScale),
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12 * widthScale),
                topRight: Radius.circular(12 * widthScale),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPledgeForm = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24 * widthScale,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Amount Field
                _buildFormLabel('Amount*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildAmountField(_pledgeAmountController, widthScale, heightScale),
                SizedBox(height: 16 * heightScale),
                // Reason Dropdown
                _buildFormLabel('Reason*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildFormDropdown(
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
                _buildFormLabel('Note', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildFormTextField(
                  controller: _pledgeNoteController,
                  hint: 'Note',
                  widthScale: widthScale,
                  heightScale: heightScale,
                ),
                SizedBox(height: 24 * heightScale),
                // Submit Button
                _buildFormSubmitButton(() {
                  // Handle pledge donation submit
                }, widthScale, heightScale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Recurring Form Card
  Widget _buildRecurringFormCard(double widthScale, double heightScale) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * widthScale),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14 * heightScale, horizontal: 16 * widthScale),
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12 * widthScale),
                topRight: Radius.circular(12 * widthScale),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showRecurringForm = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24 * widthScale,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16 * widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Amount Field
                _buildFormLabel('Amount*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildAmountField(_recurringAmountController, widthScale, heightScale),
                SizedBox(height: 16 * heightScale),
                // EMI Date Label
                _buildFormLabel('EMI Date*', widthScale),
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
                _buildFormLabel('Status*', widthScale),
                SizedBox(height: 8 * heightScale),
                _buildFormDropdown(
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
                _buildFormSubmitButton(() {
                  // Handle recurring donation submit
                }, widthScale, heightScale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Form Helper Widgets
  Widget _buildFormLabel(String text, double widthScale) {
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

  Widget _buildFormTextField({
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

  Widget _buildFormDropdown({
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

  Widget _buildFormSubmitButton(VoidCallback onPressed, double widthScale, double heightScale) {
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
