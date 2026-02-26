import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/app_routes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

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
                  AppRoutes.navigateTo(context, AppRoutes.boardMemberDetail, 
                    arguments: RouteArguments(data: {
                      'user': user,
                    })
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
