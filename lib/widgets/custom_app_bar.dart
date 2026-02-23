import 'package:afghancanadian/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final String? title;
  final bool showMenu;
  final bool showProfile;

  const CustomAppBar({
    super.key,
    this.onMenuPressed,
    this.onProfilePressed,
    this.title,
    this.showMenu = true,
    this.showProfile = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showMenu
          ? IconButton(
              onPressed: onMenuPressed ?? () {
                final scaffoldState = Scaffold.maybeOf(context);
                if (scaffoldState != null && scaffoldState.hasDrawer) {
                  scaffoldState.openDrawer();
                }
              },
              icon: Container(
                padding: EdgeInsets.all(4 * widthScale),
                decoration: BoxDecoration(
                  color: AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(8 * widthScale),
                ),
                child: Icon(Icons.menu_rounded, color: Colors.white),
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: 18 * widthScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Use PNG logo instead of SVG
                Image.asset('assets/appbarlogo.png', height: 60 * widthScale),
              ],
            ),
      actions: showProfile
          ? [
              IconButton(
                onPressed: onProfilePressed ?? () {},
                icon: Image.asset(
                  'assets/profile.png',
                  height: 24 * widthScale,
                  width: 24 * widthScale,
                  color: AppColors.iconPrimary,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}