import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:afghancanadian/widgets/custom_app_bar.dart';
import 'package:afghancanadian/widgets/custom_drawer.dart';
import 'package:afghancanadian/widgets/responsive_helper.dart';
import 'package:afghancanadian/widgets/bottom_nav_screen.dart';
import 'package:afghancanadian/widgets/app_routes.dart';
import 'package:flutter/material.dart';

class FormerBoardMember {
  final String name;
  final String joinDate;
  final String outDate;
  final String? imageUrl;
  final String? years;

  FormerBoardMember({
    required this.name,
    required this.joinDate,
    required this.outDate,
    this.imageUrl,
    this.years,
  });
}

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  // Position categories
  final List<String> positions = [
    "President",
    "Vice President",
    "Treasurer",
    "Secretary",
    "Cultural Services",
    "Women Services",
    "Educational Services",
    "Social Services",
    "Youth Services",
    "Internal Communications",
    "Finance & Accounts",
  ];

  // Former board members data by position
  final Map<String, List<FormerBoardMember>> boardMembersData = {
    "President": [
      FormerBoardMember(
        name: "Mohammad Naem Farzam",
        joinDate: "1999",
        outDate: "2000",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "1999-2000 | 1991-1992",
      ),
      FormerBoardMember(
        name: "Mohammad Kazim Bayat",
        joinDate: "1993",
        outDate: "1993",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "1993",
      ),
      FormerBoardMember(
        name: "Abdullah Hamid",
        joinDate: "1994",
        outDate: "1995",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "1994-1995",
      ),
      FormerBoardMember(
        name: "Hamidullah Hamidullah",
        joinDate: "2004",
        outDate: "2006",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "2004-2006",
      ),
      FormerBoardMember(
        name: "Mohammad Asif Abbasi",
        joinDate: "2007",
        outDate: "2017",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "2007-2017 | 2001-2003 | 1996-1998",
      ),
      FormerBoardMember(
        name: "Farhat Najem",
        joinDate: "2018",
        outDate: "2021",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "2018-2021 | 2025-Now",
      ),
      FormerBoardMember(
        name: "Komail Ibrahimi",
        joinDate: "2022",
        outDate: "2024",
        imageUrl: "https://i.imgur.com/BoN9kdC.png",
        years: "2022-2024",
      ),
    ],
    "Vice President": [
      FormerBoardMember(name: "Ahmad Shah", joinDate: "2002", outDate: "2008", years: "2002-2008"),
      FormerBoardMember(name: "Mohammad Ali", joinDate: "2008", outDate: "2014", years: "2008-2014"),
      FormerBoardMember(name: "Hassan Raza", joinDate: "2014", outDate: "2020", years: "2014-2020"),
    ],
    "Treasurer": [
      FormerBoardMember(name: "Khalid Masood", joinDate: "2002", outDate: "2010", years: "2002-2010"),
      FormerBoardMember(name: "Naveed Khan", joinDate: "2010", outDate: "2016", years: "2010-2016"),
      FormerBoardMember(name: "Imran Syed", joinDate: "2016", outDate: "2022", years: "2016-2022"),
    ],
    "Secretary": [
      FormerBoardMember(name: "Rashid Ahmed", joinDate: "2002", outDate: "2006", years: "2002-2006"),
      FormerBoardMember(name: "Tariq Mahmood", joinDate: "2006", outDate: "2012", years: "2006-2012"),
      FormerBoardMember(name: "Bilal Qureshi", joinDate: "2012", outDate: "2018", years: "2012-2018"),
    ],
    "Cultural Services": [
      FormerBoardMember(name: "Samir Hussain", joinDate: "2004", outDate: "2010", years: "2004-2010"),
      FormerBoardMember(name: "Farhan Akhtar", joinDate: "2010", outDate: "2016", years: "2010-2016"),
      FormerBoardMember(name: "Zaid Omar", joinDate: "2016", outDate: "2022", years: "2016-2022"),
    ],
    "Women Services": [
      FormerBoardMember(name: "Sarah Khan", joinDate: "2005", outDate: "2011", years: "2005-2011"),
      FormerBoardMember(name: "Amina Hassan", joinDate: "2011", outDate: "2017", years: "2011-2017"),
      FormerBoardMember(name: "Fatima Zahra", joinDate: "2017", outDate: "2023", years: "2017-2023"),
    ],
    "Educational Services": [
      FormerBoardMember(name: "Dr. Asif Raza", joinDate: "2003", outDate: "2009", years: "2003-2009"),
      FormerBoardMember(name: "Prof. Tariq Ali", joinDate: "2009", outDate: "2015", years: "2009-2015"),
      FormerBoardMember(name: "Dr. Kamran Shah", joinDate: "2015", outDate: "2021", years: "2015-2021"),
    ],
    "Social Services": [
      FormerBoardMember(name: "Jamal Khan", joinDate: "2004", outDate: "2010", years: "2004-2010"),
      FormerBoardMember(name: "Rafiq Ahmed", joinDate: "2010", outDate: "2016", years: "2010-2016"),
      FormerBoardMember(name: "Samiullah", joinDate: "2016", outDate: "2022", years: "2016-2022"),
    ],
    "Youth Services": [
      FormerBoardMember(name: "Omar Farooq", joinDate: "2006", outDate: "2012", years: "2006-2012"),
      FormerBoardMember(name: "Yusuf Khan", joinDate: "2012", outDate: "2018", years: "2012-2018"),
      FormerBoardMember(name: "Hamza Ali", joinDate: "2018", outDate: "2024", years: "2018-2024"),
    ],
    "Internal Communications": [
      FormerBoardMember(name: "Faisal Qureshi", joinDate: "2005", outDate: "2011", years: "2005-2011"),
      FormerBoardMember(name: "Nadeem Akhtar", joinDate: "2011", outDate: "2017", years: "2011-2017"),
      FormerBoardMember(name: "Shahid Raza", joinDate: "2017", outDate: "2023", years: "2017-2023"),
    ],
    "Finance & Accounts": [
      FormerBoardMember(name: "Arif Mahmood", joinDate: "2003", outDate: "2009", years: "2003-2009"),
      FormerBoardMember(name: "Salman Khan", joinDate: "2009", outDate: "2015", years: "2009-2015"),
      FormerBoardMember(name: "Waqar Ahmed", joinDate: "2015", outDate: "2021", years: "2015-2021"),
    ],
  };

  // Track expanded state for each position
  Map<String, bool> expandedPositions = {};

  @override
  Widget build(BuildContext context) {
    final scales = ResponsiveHelper.getScales(context);
    final widthScale = scales.widthScale;
    final heightScale = scales.heightScale;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20 * widthScale,
              vertical: 20 * heightScale,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'FORMER OF BOARD MEMBERS',
                      style: TextStyle(
                        fontSize: 22 * widthScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 25 * heightScale),

                  // Expandable Position List
                  ...positions.map((position) {
                    final isExpanded = expandedPositions[position] ?? false;
                    final members = boardMembersData[position] ?? [];

                    return Column(
                      children: [
                        // Position Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandedPositions[position] = !isExpanded;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(12 * widthScale),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16 * widthScale,
                              vertical: 14 * heightScale,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  position,
                                  style: TextStyle(
                                    fontSize: 18 * widthScale,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 28 * widthScale,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Expanded Members List
                        if (isExpanded) ...[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12 * widthScale),
                                bottomRight: Radius.circular(12 * widthScale),
                              ),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(16 * widthScale),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: members.map((member) {
                                return GestureDetector(
                                  onTap: () => _showProfileDialog(member, position, widthScale, heightScale),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 12 * heightScale,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12 * widthScale,
                                        vertical: 10 * heightScale,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        borderRadius: BorderRadius.circular(8 * widthScale),
                                        border: Border.all(
                                          color: Colors.grey[200]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Member Name with click indicator
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: AppColors.primaryDark,
                                                size: 20 * widthScale,
                                              ),
                                              SizedBox(width: 8 * widthScale),
                                              Expanded(
                                                child: Text(
                                                  member.name,
                                                  style: TextStyle(
                                                    fontSize: 16 * widthScale,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.textPrimary,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: AppColors.primaryDark,
                                                size: 14 * widthScale,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4 * heightScale),
                                          // Years with calendar icon
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color: AppColors.primaryDark,
                                                size: 14 * widthScale,
                                              ),
                                              SizedBox(width: 6 * widthScale),
                                              Text(
                                                member.years ??
                                                    "${member.joinDate}-${member.outDate}",
                                                style: TextStyle(
                                                  fontSize: 14 * widthScale,
                                                  color: AppColors.textSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],

                        SizedBox(height: 10 * heightScale),
                      ],
                    );
                  }),
                  // Bottom padding for keyboard
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom > 0 ? 20 : 0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: -1, // No item selected
        onIndexChanged: (index) {
          switch (index) {
            case 0:
              AppRoutes.goToAbout();
              break;
            case 1:
              AppRoutes.goToCalendar();
              break;
            case 2:
              AppRoutes.goToHome();
              break;
            case 3:
              AppRoutes.goToServices();
              break;
            case 4:
              AppRoutes.goToContact();
              break;
            case 5:
              AppRoutes.goToDonation();
              break;
          }
        },
        scales: scales,
      ),
    );
  }

  Widget _buildMemberCard(
    FormerBoardMember member,
    String position,
    double widthScale,
    double heightScale,
  ) {
    return GestureDetector(
      onTap: () => _showProfileDialog(member, position, widthScale, heightScale),
      child: Container(
        margin: EdgeInsets.only(bottom: 12 * heightScale),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12 * widthScale),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              spreadRadius: 1 * widthScale,
              blurRadius: 5 * widthScale,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16 * widthScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Member Name with click indicator
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.primaryDark,
                    size: 24 * widthScale,
                  ),
                  SizedBox(width: 12 * widthScale),
                  Expanded(
                    child: Text(
                      member.name,
                      style: TextStyle(
                        fontSize: 18 * widthScale,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryDark,
                    size: 16 * widthScale,
                  ),
                ],
              ),
              SizedBox(height: 12 * heightScale),
              Divider(height: 1, color: AppColors.borderPrimary),
              SizedBox(height: 12 * heightScale),
              // Join and Out Dates
              Row(
                children: [
                  Expanded(
                    child: _buildDateInfo(
                      'Joined',
                      member.joinDate,
                      Icons.login,
                      Colors.green,
                      widthScale,
                      heightScale,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40 * heightScale,
                    color: AppColors.borderPrimary,
                  ),
                  Expanded(
                    child: _buildDateInfo(
                      'Left',
                      member.outDate,
                      Icons.logout,
                      Colors.red,
                      widthScale,
                      heightScale,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showProfileDialog(
    FormerBoardMember member,
    String position,
    double widthScale,
    double heightScale,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth > 600 ? 550.0 : screenWidth * 0.92;
    final dialogHeightScale = screenWidth > 600 ? 1.2 : heightScale * 1.2;
    final dialogWidthScale = screenWidth > 600 ? 1.1 : widthScale * 1.1;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: screenWidth > 600 ? 40 : 20,
          vertical: 24,
        ),
        child: Container(
          width: dialogWidth,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16 * dialogWidthScale),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Top Green Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * dialogWidthScale,
                  vertical: 14 * dialogHeightScale,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B5E20),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16 * dialogWidthScale),
                    topRight: Radius.circular(16 * dialogWidthScale),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        member.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * dialogWidthScale,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24 * dialogWidthScale,
                      ),
                    ),
                  ],
                ),
              ),

              /// Body Content - Scrollable
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20 * dialogWidthScale),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16 * dialogWidthScale),
                        child: Image.network(
                          member.imageUrl ?? "https://i.imgur.com/BoN9kdC.png",
                          height: 220 * dialogHeightScale,
                          width: 220 * dialogWidthScale,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 220 * dialogHeightScale,
                              width: 220 * dialogWidthScale,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16 * dialogWidthScale),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 100 * dialogWidthScale,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 20 * dialogHeightScale),

                      /// Position
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Position : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * dialogWidthScale,
                            ),
                          ),
                          Text(
                            position,
                            style: TextStyle(
                              color: AppColors.customGold,
                              fontSize: 16 * dialogWidthScale,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12 * dialogHeightScale),

                      /// Years
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Years : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * dialogWidthScale,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              member.years ?? "${member.joinDate}-${member.outDate}",
                              style: TextStyle(fontSize: 15 * dialogWidthScale),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Divider(height: 1, color: Colors.grey[300]),

              /// Bottom Close Button
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12 * dialogHeightScale,
                  horizontal: 20 * dialogWidthScale,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E20),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32 * dialogWidthScale,
                          vertical: 12 * dialogHeightScale,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24 * dialogWidthScale),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * dialogWidthScale,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateInfo(
    String label,
    String date,
    IconData icon,
    Color color,
    double widthScale,
    double heightScale,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 20 * widthScale,
        ),
        SizedBox(width: 8 * widthScale),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12 * widthScale,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 14 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}