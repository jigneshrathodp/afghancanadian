import 'package:flutter/material.dart';

/// Responsive Helper - Tablet support without affecting existing code
/// Usage: Import and use ResponsiveHelper methods in any screen
class ResponsiveHelper {
  // Screen breakpoints
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 1024;
  
  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }
  
  /// Check if device is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }
  
  /// Get responsive width scale
  /// Phone: 0.8 - 1.2
  /// Tablet: 1.2 - 2.0
  static double getWidthScale(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTabletDevice = isTablet(context);
    
    if (isTabletDevice) {
      return (screenWidth / 414).clamp(1.2, 2.0);
    }
    return (screenWidth / 414).clamp(0.8, 1.2);
  }
  
  /// Get responsive height scale
  /// Phone: 0.8 - 1.2
  /// Tablet: 1.0 - 1.5
  static double getHeightScale(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isTabletDevice = isTablet(context);
    
    if (isTabletDevice) {
      return (screenHeight / 896).clamp(1.0, 1.5);
    }
    return (screenHeight / 896).clamp(0.8, 1.2);
  }
  
  /// Get both scales at once (recommended)
  static ResponsiveScales getScales(BuildContext context) {
    return ResponsiveScales(
      widthScale: getWidthScale(context),
      heightScale: getHeightScale(context),
      isTablet: isTablet(context),
    );
  }
  
  /// Get grid cross axis count based on screen width
  /// Phone: 1-3 columns
  /// Tablet: 2-4 columns
  static int getGridCount(BuildContext context, {int phoneCount = 3, int tabletCount = 4}) {
    return isTablet(context) ? tabletCount : phoneCount;
  }
  
  /// Get responsive padding
  /// Phone: default padding
  /// Tablet: larger padding
  static double getPadding(BuildContext context, double basePadding) {
    return isTablet(context) ? basePadding * 1.5 : basePadding;
  }
  
  /// Get max content width
  /// Phone: full width
  /// Tablet: centered with max width
  static double getMaxContentWidth(BuildContext context, {double tabletMaxWidth = 800}) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isTablet(context)) {
      return screenWidth > tabletMaxWidth ? tabletMaxWidth : screenWidth * 0.9;
    }
    return screenWidth * 0.95;
  }
}

/// Helper class to hold scale values
class ResponsiveScales {
  final double widthScale;
  final double heightScale;
  final bool isTablet;
  
  const ResponsiveScales({
    required this.widthScale,
    required this.heightScale,
    required this.isTablet,
  });
}
