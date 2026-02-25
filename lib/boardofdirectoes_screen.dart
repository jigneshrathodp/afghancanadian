import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_drawer.dart';

class User {
  final String name;
  final String role;
  final String description;
  final String image;

  User({
    required this.name,
    required this.role,
    required this.description,
    required this.image,
  });
}

class BoardOfDirectorsScreen extends StatelessWidget {
  const BoardOfDirectorsScreen({super.key});

  // ✅ 8 Different Users
  static final List<User> users = [
    User(
      name: "Hameed Zarabi",
      role: "President",
      description:
          "Hameed Zarabi was elected as the ACIC president in 2025.",
      image: "https://i.pravatar.cc/300?img=11",
    ),
    User(
      name: "Ali Khan",
      role: "Vice President",
      description: "Ali Khan manages operations and strategic planning.",
      image: "https://i.pravatar.cc/300?img=12",
    ),
    User(
      name: "Sara Ahmed",
      role: "Secretary",
      description: "Sara Ahmed handles official communications.",
      image: "https://i.pravatar.cc/300?img=13",
    ),
    User(
      name: "Omar Sheikh",
      role: "Treasurer",
      description: "Omar Sheikh manages financial records.",
      image: "https://i.pravatar.cc/300?img=14",
    ),
    User(
      name: "Fatima Noor",
      role: "Coordinator",
      description: "Fatima coordinates community events.",
      image: "https://i.pravatar.cc/300?img=15",
    ),
    User(
      name: "Yusuf Pathan",
      role: "Advisor",
      description: "Yusuf provides strategic guidance.",
      image: "https://i.pravatar.cc/300?img=16",
    ),
    User(
      name: "Ayesha Malik",
      role: "Manager",
      description: "Ayesha oversees project execution.",
      image: "https://i.pravatar.cc/300?img=17",
    ),
    User(
      name: "Imran Qureshi",
      role: "Member",
      description: "Imran supports various initiatives.",
      image: "https://i.pravatar.cc/300?img=18",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: Padding(
        padding: EdgeInsets.all(12 * widthScale),
        child: Column(
          children: [
            SizedBox(height: 16 * heightScale),
            Text(
              'BOARD OF DIRECTORS',
              style: TextStyle(
                fontSize: 22 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: 16 * heightScale),
            Expanded(
              child: GridView.builder(
                itemCount: users.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12 * widthScale,
                  mainAxisSpacing: 12 * heightScale,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  return UserCard(user: users[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16 * widthScale),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 12 * heightScale),
          Image.network(
            user.image,
            width: 120 * widthScale,
            height: 120 * widthScale,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 12 * heightScale),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 15 * widthScale,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4 * heightScale),
          Text(
            user.role,
            style: TextStyle(
              fontSize: 13 * widthScale,
              color: AppColors.customGold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12 * heightScale),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12 * widthScale),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(user: user),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  padding: EdgeInsets.symmetric(vertical: 8 * heightScale),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * widthScale),
                  ),
                ),
                child: Text(
                  'View Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11 * widthScale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12 * heightScale),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final User user;

  const DetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20 * heightScale),
            Text(
              'BOARD OF DIRECTORS PROFILE',
              style: TextStyle(
                fontSize: 22 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: 24 * heightScale),
            Image.network(
              user.image,
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24 * heightScale),
            Text(
              user.name,
              style: TextStyle(
                  fontSize: 26 * widthScale,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark),
            ),
            Text(
              user.role,
              style: TextStyle(color: AppColors.customGold, fontSize: 18 * widthScale),
            ),
            SizedBox(height: 20 * heightScale),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24 * widthScale),
              child: Text(
                user.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16 * widthScale,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 40 * heightScale),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final widthScale = ResponsiveHelper.getWidthScale(context);

    return Container(
      height: 55 * widthScale,
      color: AppColors.navBackground,
      child: Padding(
        padding: EdgeInsets.only(left: 8 * widthScale, right: 8 * widthScale, bottom: 8 * widthScale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.info_outline, 'About', 0, context, widthScale),
            _buildNavItem(Icons.calendar_today_outlined, 'Calendar', 1, context, widthScale),
            _buildNavItem(Icons.home, 'Home', 2, context, widthScale),
            _buildNavItem(Icons.miscellaneous_services_outlined, 'Services', 3, context, widthScale),
            _buildNavItem(Icons.contact_phone_outlined, 'Contact', 4, context, widthScale),
            _buildNavItem(Icons.volunteer_activism_outlined, 'Donation', 5, context, widthScale),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, BuildContext context, double widthScale) {
    return GestureDetector(
      onTap: () {
        if (index != 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BottomNavScreen(initialIndex: index),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: index == 2 ? AppColors.navSelected : AppColors.navUnselected,
            size: 24 * widthScale,
          ),
          Text(
            label,
            style: TextStyle(
              color: index == 2 ? AppColors.navSelected : AppColors.navUnselected,
              fontSize: 10 * widthScale,
            ),
          ),
        ],
      ),
    );
  }
}