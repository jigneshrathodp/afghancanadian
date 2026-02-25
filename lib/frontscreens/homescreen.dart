import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/services/cultural_service_screen.dart';
import 'package:afghancanadian/services/education_service_screen.dart';
import 'package:afghancanadian/services/funeral_service_screen.dart';
import 'package:afghancanadian/services/library_service_screen.dart';
import 'package:afghancanadian/services/women_service_screen.dart';
import 'package:afghancanadian/services/youth_service_screen.dart';
import 'package:afghancanadian/widgets/service_detail_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../newcustomdrawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {


    // Calculate responsive scaling factors

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: _buildHomeContent(),
    );
  }

  Widget _buildHomeContent() {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10 * heightScale),
          _buildWelcomeSection(widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          _buildNextAdhaanSection(widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          _buildPrayerTimesSection(widthScale, heightScale),
          SizedBox(height: 15 * heightScale),
          _buildOurServicesSection(widthScale, heightScale),
          SizedBox(height: 20 * heightScale),
          SizedBox(height: screenHeight * 0.05 > 60 ? 60 : screenHeight * 0.05)
        ],
      ),
    );
  }
  Widget _buildWelcomeSection(double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * widthScale),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16 * widthScale),
        child: Image.asset(
        'assets/23.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      ),
    );
  }

  Widget _buildNextAdhaanSection(double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      padding: EdgeInsets.only(
        left: 10 * widthScale, 
        right: 10 * widthScale, 
        top: 7 * heightScale, 
        bottom: 12 * heightScale
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20 * widthScale),
        border: Border.all(color: AppColors.borderPrimary, width: 1),
      ),
      child: Column(
        children: [
          Text(
            '06/02/2026',
            style: TextStyle(fontSize: 14 * widthScale, color: AppColors.textPrimary),
          ),
          SizedBox(height: 8 * heightScale),
          Text(
            'NEXT ADHAAN',
            style: TextStyle(
              fontSize: 16 * widthScale,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 5 * heightScale),
          Text(
            '6:02 AM',
            style: TextStyle(
              fontSize: 40 * widthScale,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesSection(double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: Column(
        children: [
          _buildTabBar(widthScale, heightScale),
          _selectedTabIndex == 0 ? _buildPrayerTimesList(widthScale, heightScale) : _buildUpcomingEvents(widthScale, heightScale),
        ],
      ),
    );
  }

  Widget _buildTabBar(double widthScale, double heightScale) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTabIndex = 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
                    child: Text(
                      'Prayer Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (_selectedTabIndex == 0 ? 16 : 15) * widthScale,
                        color: _selectedTabIndex == 0 ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: _selectedTabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  // Underline indicator
                  Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: _selectedTabIndex == 0 ? AppColors.borderPrimary : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTabIndex = 1),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10 * heightScale),
                    child: Text(
                      'Upcoming Event',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (_selectedTabIndex == 1 ? 16 : 15) * widthScale,
                        color: _selectedTabIndex == 1 ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: _selectedTabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  // Underline indicator
                  Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: _selectedTabIndex == 1 ? AppColors.borderPrimary : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesList(double widthScale, double heightScale) {
    final prayers = [
      {'name': 'Imsak', 'time': '06:00:00', 'svg': '5.svg'},
      {'name': 'Fajr', 'time': '06:05:00', 'svg': '5.svg'},
      {'name': 'Sunrise', 'time': '07:32:00', 'svg': '6.svg'},
      {'name': 'Dhuhr', 'time': '12:32:00', 'svg': '7.svg'},
      {'name': 'Sunset', 'time': '05:32:00', 'svg': '6.svg'},
      {'name': 'Maghrib', 'time': '05:47:00', 'svg': '8.svg'},
    ];

    return Container(
      padding: EdgeInsets.all(20 * widthScale),
      child: Column(
        children: [
          ...prayers.map((prayer) {
            final isFajr = prayer['name'] == 'Fajr';
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8 * heightScale),
              child: Container(
                decoration: BoxDecoration(
                  color: isFajr ? AppColors.primaryDark.withOpacity(0.1) : AppColors.background,
                  borderRadius: BorderRadius.circular(10 * widthScale),
                  border: Border.all(color: AppColors.borderPrimary, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0 * widthScale),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/${prayer['svg']}',
                        width: 28 * widthScale,
                        height: 28 * widthScale,
                      ),
                      SizedBox(width: 15 * widthScale),
                      Expanded(
                        child: Text(
                          prayer['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontSize: 14 * widthScale,
                          ),
                        ),
                      ),
                      Text(
                        prayer['time'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontSize: 14 * widthScale,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20 * heightScale),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15 * heightScale),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(30 * widthScale),
            ),
            child: Text(
              'View Monthly Timings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.bold,
                fontSize: 16 * widthScale,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvents(double widthScale, double heightScale) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
            padding: EdgeInsets.all(20 * widthScale),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20 * widthScale),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Ramadan',
                      style: TextStyle(
                        fontSize: 24 * widthScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                  SizedBox(height: 6 * heightScale),
                  Align(
                    alignment: Alignment.center,

                    child: Text(
                      'March 1 @ 5:23 am - March 23 @ 6:20 pm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13 * widthScale,
                        color: AppColors.textLightMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOurServicesSection(double widthScale, double heightScale) {
    final services = [
      {'name': 'Cultural Services', 'svg': '1.svg', 'screen': const CulturalServiceScreen(), 'title': 'Cultural Services'},
      {'name': 'Youth Programs', 'svg': '2.svg', 'screen': const YouthServiceScreen(), 'title': 'Youth Programs'},
      {'name': 'Women Services', 'svg': '3.svg', 'screen': const WomenServiceScreen(), 'title': 'Women Services'},
      {'name': 'Maktab', 'svg': '4.svg', 'screen': const EducationServiceScreen(), 'title': 'Education Services'},
      {'name': 'Funeral Service', 'svg': '21.svg', 'screen': const FuneralServiceScreen(), 'title': 'Funeral Services'},
      {'name': 'Library', 'svg': '22.svg', 'screen': const Libraryservicescreen(), 'title': 'Library Services'},
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'OUR SERVICES',
              style: TextStyle(
                fontSize: 18 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          SizedBox(height: 15 * heightScale),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10 * widthScale,
              mainAxisSpacing: 10 * heightScale,
              childAspectRatio: 1,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailWrapper(
                        title: service['title'] as String,
                        currentNavIndex: 2, // Home tab
                        child: service['screen'] as Widget,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(15 * widthScale),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        spreadRadius: 1 * widthScale,
                        blurRadius: 5 * widthScale,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/${service['svg']}',
                        width: 45 * widthScale,
                        height: 45 * widthScale,
                      ),
                      SizedBox(height: 8 * heightScale),
                      Text(
                        service['name'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12 * widthScale,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


}