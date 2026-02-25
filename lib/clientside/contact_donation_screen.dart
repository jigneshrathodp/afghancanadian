import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
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
    return Padding(
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
              _buildActionButton(
                'Record A Donation',
                widthScale,
                heightScale,
              ),
            ],
          ),
          SizedBox(height: 16 * heightScale),
          // Table Header
          _buildTableHeader(widthScale, heightScale),
          // Table Content
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
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
        ],
      ),
    );
  }

  Widget _buildPledgeDonationTab(double widthScale, double heightScale) {
    return Padding(
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
              _buildActionButton(
                'Pledge A Donation',
                widthScale,
                heightScale,
              ),
            ],
          ),
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
        ],
      ),
    );
  }

  Widget _buildRecurringDonationTab(double widthScale, double heightScale) {
    return Padding(
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
              _buildActionButton(
                'Record A Recurring\nDonation',
                widthScale,
                heightScale,
              ),
            ],
          ),
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
        ],
      ),
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
}
