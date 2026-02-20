import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    // Responsive padding and spacing
    final horizontalPadding = isTablet ? screenWidth * 0.1 : 16.0;
    final cardWidth = isTablet ? screenWidth * 0.8 : screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showMenu: true,
        showProfile: false,
        onMenuPressed: () {
          // Handle menu press
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CONTACT US Header (matching SVG design)
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    "CONTACT US",
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D5016),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: cardWidth,
                child: Column(
                  children: [
                    _buildInputField("Name", isTablet),
                    _buildInputField("Email Address*", isTablet, isRequired: true),
                    _buildInputField("Subject", isTablet),
                    _buildInputField("Message", isTablet, maxLines: 4),
                    _buildInputField("Enter Captcha", isTablet),

                    const SizedBox(height: 20),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 55 : 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D5016),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Contact Info Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: cardWidth,
                padding: EdgeInsets.all(isTablet ? 24 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    // Phone
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          size: isTablet ? 24 : 20,
                          color: const Color(0xFF2D5016),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "416) 757-2553",
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Email
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          size: isTablet ? 24 : 20,
                          color: const Color(0xFF2D5016),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "support@afghancanada.com",
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: isTablet ? 24 : 20,
                          color: const Color(0xFF2D5016),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "22 Hobson Ave, North York, ON M4A 1Y2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isTablet ? 18 : 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Map Section with Google attribution
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: isTablet ? 300 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        color: Colors.grey.shade300,
                        // image: const DecorationImage(
                        //   image: NetworkImage(
                        //     'https://maps.googleapis.com/maps/api/staticmap?center=43.7281,-79.3242&zoom=14&size=600x300&maptype=roadmap&markers=color:green%7C43.7281,-79.3242&key=YOUR_API_KEY',
                        //   ),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Map data ©2026 Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 14 : 12,
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                    ),

                    // Location labels
                    Container(
                      padding: EdgeInsets.all(isTablet ? 16 : 12),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          _buildLocationTag("VICTORIA VILLAGE", isTablet),
                          _buildLocationTag("Walmart Supercentre", isTablet),
                          _buildLocationTag("Aga Khan Museum", isTablet),
                          _buildLocationTag("Panda Mart", isTablet),
                          _buildLocationTag("MINGDON PARK", isTablet),
                          _buildLocationTag("CLAIRLEA - EI", isTablet),
                          _buildLocationTag("Providence Healthcare", isTablet),
                          _buildLocationTag("The Home Depot", isTablet),
                          _buildLocationTag("O'CONNOR", isTablet),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, bool isTablet, {int maxLines = 1, bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint + (isRequired ? "" : ""),
          hintStyle: TextStyle(
            fontSize: isTablet ? 18 : 16,
            color: Colors.grey.shade500,
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: maxLines > 1 ? 16 : 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF2D5016), width: 1.5),
          ),
        ),
        style: TextStyle(
          fontSize: isTablet ? 18 : 16,
        ),
      ),
    );
  }

  Widget _buildLocationTag(String label, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12 : 8,
        vertical: isTablet ? 6 : 4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: isTablet ? 14 : 12,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}

// Include CustomAppBar in the same file or import it
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
            icon: Icon(
              Icons.menu,
              color: const Color(0xFF2D5016),
              size: 24 * widthScale,
            ),
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
          // Use PNG logo instead of SVG
          Container(
            height: 40 * widthScale,
            width: 120 * widthScale,
            color: const Color(0xFF2D5016),
            child: Center(
              child: Text(
                "LOGO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12 * widthScale,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: showProfile
          ? [
        IconButton(
          onPressed: onProfilePressed ?? () {},
          icon: Icon(
            Icons.person,
            color: const Color(0xFF2D5016),
            size: 24 * widthScale,
          ),
        ),
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}