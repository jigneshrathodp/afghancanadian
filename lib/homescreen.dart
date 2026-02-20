import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

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
      appBar: CustomAppBar(
        drawer: CustomDrawer(),
      ),
      drawer: CustomDrawer(),
      body: _buildHomeContent(),
    );
  }

  Widget _buildHomeContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Calculate responsive scaling factors
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);
    final heightScale = (screenHeight / 896).clamp(0.8, 1.2);
    
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
        ],
      ),
    );
  }

  Widget _buildWelcomeSection(double widthScale, double heightScale) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 * widthScale),
      padding: EdgeInsets.all(20 * widthScale),
      decoration: BoxDecoration(
        color: const Color(0xFF2D5016),
        borderRadius: BorderRadius.circular(20 * widthScale),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10 * heightScale),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24 * widthScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8 * heightScale),
                Text(
                  'Afghan Canadian Islamic Community',
                  style: TextStyle(
                    fontSize: 16 * widthScale,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'where faith, culture, and community\ncome together.',
                      style: TextStyle(
                        fontSize: 12 * widthScale,
                        color: Colors.white70,
                      ),
                    ),
                    // Welcome image
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/welcome.png',
                        width: 100 * widthScale,
                        height: 100 * widthScale,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10 * heightScale),
              ],
            ),
          ),
          // Mosque illustration

        ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20 * widthScale),
        border: Border.all(color: const Color(0xFF2D5016), width: 1),
      ),
      child: Column(
        children: [
          Text(
            '06/02/2026',
            style: TextStyle(fontSize: 14 * widthScale, color: const Color(0xFF2D5016)),
          ),
          SizedBox(height: 8 * heightScale),
          Text(
            'NEXT ADHAAN',
            style: TextStyle(
              fontSize: 16 * widthScale,
              color: const Color(0xFF2D5016),
            ),
          ),
          SizedBox(height: 5 * heightScale),
          Text(
            '6:02 AM',
            style: TextStyle(
              fontSize: 40 * widthScale,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20 * widthScale),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1 * widthScale,
            blurRadius: 5 * widthScale,
            offset: const Offset(0, 2),
          ),
        ],
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
                        color: _selectedTabIndex == 0 ? const Color(0xFF2D5016) : Colors.grey,
                        fontWeight: _selectedTabIndex == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  // Underline indicator
                  Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: _selectedTabIndex == 0 ? const Color(0xFF2D5016) : Colors.transparent,
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
                        color: _selectedTabIndex == 1 ? const Color(0xFF2D5016) : Colors.grey,
                        fontWeight: _selectedTabIndex == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  // Underline indicator
                  Container(
                    height: 2 * heightScale,
                    width: 80 * widthScale,
                    color: _selectedTabIndex == 1 ? const Color(0xFF2D5016) : Colors.transparent,
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
      {'name': 'Imsak', 'time': '06:00:00', 'icon': Icons.nights_stay_outlined},
      {'name': 'Fajr', 'time': '06:05:00', 'icon': Icons.wb_twilight_outlined},
      {'name': 'Sunrise', 'time': '07:32:00', 'icon': Icons.wb_sunny_outlined},
      {'name': 'Dhuhr', 'time': '12:32:00', 'icon': Icons.wb_sunny_outlined},
      {'name': 'Sunset', 'time': '05:32:00', 'icon': Icons.wb_twilight_outlined},
      {'name': 'Maghrib', 'time': '05:47:00', 'icon': Icons.nights_stay_outlined},
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
                  color: isFajr ? const Color(0xFF2D5016).withOpacity(0.1) : Colors.white,
                  borderRadius: BorderRadius.circular(10 * widthScale),
                  border: Border.all(color: const Color(0xFF2D5016), width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0 * widthScale),
                  child: Row(
                    children: [
                      Icon(
                        prayer['icon'] as IconData,
                        size: 28 * widthScale,
                        color: isFajr ? const Color(0xFF2D5016) : Colors.grey[600],
                      ),
                      SizedBox(width: 15 * widthScale),
                      Expanded(
                        child: Text(
                          prayer['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isFajr ? const Color(0xFF2D5016) : Colors.black,
                            fontSize: 14 * widthScale,
                          ),
                        ),
                      ),
                      Text(
                        prayer['time'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isFajr ? const Color(0xFF2D5016) : Colors.black,
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
              color: const Color(0xFF2D5016),
              borderRadius: BorderRadius.circular(30 * widthScale),
            ),
            child: Text(
              'View Monthly Timings',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
      padding: EdgeInsets.all(20 * widthScale),
      child: Center(
        child: Text(
          'No upcoming events',
          style: TextStyle(color: Colors.grey, fontSize: 14 * widthScale),
        ),
      ),
    );
  }

  Widget _buildOurServicesSection(double widthScale, double heightScale) {
    final services = [
      {'name': 'Cultural Services', 'icon': Icons.diversity_3_outlined},
      {'name': 'Youth Programs', 'icon': Icons.groups_outlined},
      {'name': 'Social Services', 'icon': Icons.support_outlined},
      {'name': 'Maktab', 'icon': Icons.menu_book_outlined},
      {'name': 'Social Services', 'icon': Icons.volunteer_activism_outlined},
      {'name': 'Social Services', 'icon': Icons.handshake_outlined},
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
                color: const Color(0xFF2D5016),
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
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF2D5016).withOpacity(0.3), width: 1),
                  borderRadius: BorderRadius.circular(15 * widthScale),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      services[index]['icon'] as IconData,
                      size: 22 * widthScale,
                      color: Colors.grey[600],
                    ),
                    SizedBox(height: 8 * heightScale),
                    Text(
                      services[index]['name'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10 * widthScale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }


}