import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/newcustomdrawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      drawer: NewCustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16 * heightScale),
            // User Profile Card
            _buildUserProfileCard(widthScale, heightScale),
            SizedBox(height: 16 * heightScale),
            // Balance Cards
            _buildBalanceCards(widthScale, heightScale),
            SizedBox(height: 16 * heightScale),
            // Recent Payments Section
            _buildRecentPaymentsSection(widthScale, heightScale),
            SizedBox(height: 16 * heightScale),
            // Pending Invoices Section
            _buildPendingInvoicesSection(widthScale, heightScale),
            SizedBox(height: 80 * heightScale),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfileCard(double widthScale, double heightScale) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 380 * widthScale,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      padding: EdgeInsets.all(16 * widthScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * widthScale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile Icon
          Container(
            width: 60 * widthScale,
            height: 60 * widthScale,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryDark,
            ),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 32 * widthScale,
            ),
          ),
          SizedBox(height: 12 * heightScale),
          // Name
          Text(
            'Hameed Zarabi',
            style: TextStyle(
              fontSize: 20 * widthScale,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4 * heightScale),
          // ID
          Text(
            '54881852',
            style: TextStyle(
              fontSize: 14 * widthScale,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4 * heightScale),
          // Status
          Text(
            'Status: Active',
            style: TextStyle(
              fontSize: 14 * widthScale,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCards(double widthScale, double heightScale) {
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

    return Container(
      width: 380 * widthScale,
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12 * widthScale),
        child: Column(
          children: balanceData.asMap().entries.map((entry) {
            final index = entry.key;
            final data = entry.value;
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16 * widthScale, vertical: 12 * heightScale),
              decoration: BoxDecoration(
                color: data['color'] as Color,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'] as String,
                        style: TextStyle(
                          fontSize: 14 * widthScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2 * heightScale),
                      Text(
                        data['subtitle'] as String,
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SizedBox(height: 4 * heightScale),
                      Text(
                        data['amount'] as String,
                        style: TextStyle(
                          fontSize: 24 * widthScale,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8 * heightScale),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      data['icon'] as String,
                      width: 50 * widthScale,
                      height: 50 * widthScale,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRecentPaymentsSection(double widthScale, double heightScale) {
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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * widthScale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16 * widthScale,
              vertical: 12 * heightScale,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16 * widthScale),
                topRight: Radius.circular(16 * widthScale),
              ),
            ),
            child: Text(
              'Recent Payments',
              style: TextStyle(
                fontSize: 16 * widthScale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Payment Items
          ...payments.map((payment) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12 * widthScale,
                vertical: 6 * heightScale,
              ),
              padding: EdgeInsets.all(12 * widthScale),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12 * widthScale),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        payment['id']!,
                        style: TextStyle(
                          fontSize: 14 * widthScale,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(width: 12 * widthScale),
                      Expanded(
                        child: Text(
                          'Date: ${payment['date']}',
                          style: TextStyle(
                            fontSize: 12 * widthScale,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4 * heightScale),
                  Text(
                    'Details: ${payment['details']}',
                    style: TextStyle(
                      fontSize: 12 * widthScale,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4 * heightScale),
                  Text(
                    'Amount: ${payment['amount']}',
                    style: TextStyle(
                      fontSize: 14 * widthScale,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(height: 12 * heightScale),
        ],
      ),
    );
  }

  Widget _buildPendingInvoicesSection(double widthScale, double heightScale) {
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

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * widthScale),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16 * widthScale,
              vertical: 12 * heightScale,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16 * widthScale),
                topRight: Radius.circular(16 * widthScale),
              ),
            ),
            child: Text(
              'Pending Invoices',
              style: TextStyle(
                fontSize: 16 * widthScale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Invoice Items
          ...invoices.map((invoice) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 12 * widthScale,
                vertical: 6 * heightScale,
              ),
              padding: EdgeInsets.all(12 * widthScale),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12 * widthScale),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        invoice['id']!,
                        style: TextStyle(
                          fontSize: 14 * widthScale,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(width: 12 * widthScale),
                      Expanded(
                        child: Text(
                          'Date: ${invoice['date']}',
                          style: TextStyle(
                            fontSize: 12 * widthScale,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 * widthScale,
                          vertical: 2 * heightScale,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFCDD2),
                          borderRadius: BorderRadius.circular(4 * widthScale),
                        ),
                        child: Text(
                          invoice['status']!,
                          style: TextStyle(
                            fontSize: 10 * widthScale,
                            color: const Color(0xFFE53935),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4 * heightScale),
                  Row(
                    children: [
                      Text(
                        'Details: ',
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          invoice['details']!,
                          style: TextStyle(
                            fontSize: 12 * widthScale,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4 * heightScale),
                  Row(
                    children: [
                      Text(
                        'Balance due: ',
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: const Color(0xFFE53935),
                        ),
                      ),
                      Text(
                        invoice['balanceDue']!,
                        style: TextStyle(
                          fontSize: 14 * widthScale,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFE53935),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2 * heightScale),
                  Row(
                    children: [
                      Text(
                        'Amount: ',
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Text(
                        invoice['amount']!,
                        style: TextStyle(
                          fontSize: 14 * widthScale,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }


}
