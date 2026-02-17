import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;
  final String? title;
  final bool showMenu;
  final bool showProfile;
  final Widget? drawer;

  const CustomAppBar({
    super.key,
    this.onMenuPressed,
    this.onProfilePressed,
    this.title,
    this.showMenu = true,
    this.showProfile = true,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthScale = (screenWidth / 414).clamp(0.8, 1.2);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showMenu
          ? Builder(
              builder: (context) {
                return IconButton(
                  onPressed: onMenuPressed ?? () {
                    if (drawer != null) {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                  icon: Icon(Icons.menu, color: const Color(0xFF2D5016), size: 24 * widthScale),
                );
              },
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(
                fontSize: 18 * widthScale,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D5016),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 40 * widthScale),
                SizedBox(width: 8 * widthScale),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Afghan Canadian ',
                      style: TextStyle(fontSize: 12 * widthScale, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Islamic Community',
                      style: TextStyle(fontSize: 10 * widthScale, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
      actions: showProfile
          ? [
              IconButton(
                onPressed: onProfilePressed ?? () {},
                icon: Icon(Icons.person_outline_outlined, color: const Color(0xFF2D5016), size: 24 * widthScale),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}