import 'package:flutter/material.dart';

// Import all screens
import '../Auth/forget_password.dart';
import '../Auth/reset_password.dart';
import '../Auth/signin.dart';
import '../Auth/signup.dart';
import '../frontscreens/board_member_detail_screen.dart';
import '../frontscreens/boardofdirectoes_screen.dart';
import '../clientscreens/Contact_membership_screen.dart';
import '../clientscreens/clientside_menu_screen.dart';
import '../clientscreens/contact_Invoice_recode_payment_screen.dart';
import '../clientscreens/contact_Invoice_screen.dart';
import '../clientscreens/contact_donation_screen.dart';
import '../clientscreens/contact_payment_screen.dart';
import '../clientscreens/credit_card_on_file_screen.dart';
import '../clientscreens/credit_change_password_screen.dart';
import '../clientscreens/dashboard_screen.dart';
import '../clientscreens/edit_profile_screen.dart';
import '../frontscreens/formar_board_member_screen.dart';
import '../frontscreens/about_screen.dart';
import '../frontscreens/calendar_screen.dart';
import '../frontscreens/contact_screen.dart';
import '../frontscreens/donation_screen.dart';
import '../frontscreens/homescreen.dart';
import '../frontscreens/services_screen.dart';
import '../frontscreens/membership.dart';
import '../models/user_model.dart';
import '../frontscreens/privacypolicy.dart';
import '../splashscreen.dart';
import '../frontscreens/termsandcondtions.dart';
import '../services/cultural_service_screen.dart';
import '../services/education_service_screen.dart';
import '../services/funeral_service_screen.dart';
import '../services/library_service_screen.dart';
import '../services/women_service_screen.dart';
import '../services/youth_service_screen.dart';
import 'service_detail_wrapper.dart';
import '../frontscreens/form.dart';
import '../frontscreens/Marketplace.dart';
import '../frontscreens/publications.dart';

/// AppRoutes - Centralized route management for the entire app
/// All route names should be defined here and used throughout the app
class AppRoutes {
  // Private constructor to prevent instantiation
  AppRoutes._();

  // ==================== AUTH ROUTES ====================
  static const String splash = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';

  // ==================== MAIN NAVIGATION ROUTES ====================
  static const String home = '/home';
  static const String about = '/about';
  static const String calendar = '/calendar';
  static const String services = '/services';
  static const String contact = '/contact';
  static const String donation = '/donation';

  // ==================== CLIENT SIDE ROUTES ====================
  static const String clientsideMenu = '/clientscreens-menu';
  static const String contactMembership = '/contact-membership';
  static const String contactInvoice = '/contact-invoice';
  static const String contactInvoiceRecordPayment = '/contact-invoice-record-payment';
  static const String contactDonation = '/contact-donation';
  static const String contactPayment = '/contact-payment';
  static const String creditCardOnFile = '/credit-card-on-file';
  static const String creditChangePassword = '/credit-change-password';
  static const String dashboard = '/dashboard';
  static const String editProfile = '/edit-profile';

  // ==================== SERVICES ROUTES ====================
  static const String culturalService = '/cultural-service';
  static const String educationService = '/education-service';
  static const String funeralService = '/funeral-service';
  static const String libraryService = '/library-service';
  static const String womenService = '/women-service';
  static const String youthService = '/youth-service';

  // ==================== OTHER ROUTES ====================
  static const String boardOfDirectors = '/board-of-directors';
  static const String boardMemberDetail = '/board-member-detail';
  static const String formerBoardMembers = '/former-board-members';
  static const String form = '/form';
  static const String membership = '/membership';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String house = '/house';
  static const String marketplace = '/marketplace';
  static const String publications = '/publications';

  // ==================== ROUTE MAP ====================
  /// Returns the route map for MaterialApp
  static Map<String, WidgetBuilder> get routes => {
    // Auth Routes
    splash: (context) => const Splashscreen(),
    signin: (context) => const Signin(),
    signup: (context) => const Signup(),
    forgetPassword: (context) => const ForgetPassword(),
    resetPassword: (context) => const ResetPassword(),
    
    // Main Navigation Routes
    home: (context) => const Homescreen(),
    about: (context) => const AboutScreen(),
    calendar: (context) => const CalendarScreen(),
    services: (context) => const ServicesScreen(),
    contact: (context) => const ContactScreen(),
    donation: (context) => const DonationScreen(),
    


    // Client Side Routes
    clientsideMenu: (context) => const ClientsideMenuScreen(),
    contactMembership: (context) => const ContactMembershipScreen(),
    contactInvoice: (context) => const ContactInvoiceScreen(),
    contactInvoiceRecordPayment: (context) => const ContactInvoiceRecordPaymentScreen(),
    contactDonation: (context) => const ContactDonationScreen(),
    contactPayment: (context) => const ContactPaymentScreen(),
    creditCardOnFile: (context) => const CreditCardOnFileScreen(),
    creditChangePassword: (context) => const CreditChangePasswordScreen(),
    dashboard: (context) => const DashboardScreen(),
    editProfile: (context) => const EditProfileScreen(),

    // Service Detail Routes
    culturalService: (context) => const ServiceDetailWrapper(
      title: 'Cultural Services',
      currentNavIndex: 3,
      child: CulturalServiceScreen(),
    ),
    educationService: (context) => const ServiceDetailWrapper(
      title: 'Education Services',
      currentNavIndex: 3,
      child: EducationServiceScreen(),
    ),
    funeralService: (context) => const ServiceDetailWrapper(
      title: 'Funeral Services',
      currentNavIndex: 3,
      child: FuneralServiceScreen(),
    ),
    libraryService: (context) => const ServiceDetailWrapper(
      title: 'Library Services',
      currentNavIndex: 3,
      child: Libraryservicescreen(),
    ),
    womenService: (context) => const ServiceDetailWrapper(
      title: 'Women Services',
      currentNavIndex: 3,
      child: WomenServiceScreen(),
    ),
    youthService: (context) => const ServiceDetailWrapper(
      title: 'Youth Programs',
      currentNavIndex: 3,
      child: YouthServiceScreen(),
    ),

    // Other Routes
    boardOfDirectors: (context) => const BoardOfDirectorsScreen(),
    boardMemberDetail: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as RouteArguments?;
      final user = args?.get<User>('user');
      return BoardMemberDetailScreen(user: user!);
    },
    formerBoardMembers: (context) => const DropdownScreen(),
    form: (context) => const FormScreen(),
    membership: (context) => const MembershipScreen(),
    privacyPolicy: (context) => const PrivacyPolicyScreen(),
    termsAndConditions: (context) => const termsandcondtions(),
    marketplace: (context) => const Marketplace(),
    publications: (context) => const Publications(),
  };

  // ==================== NAVIGATION HELPERS ====================
  
  /// Navigate to a named route
  static Future<T?> navigateTo<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  /// Navigate to a named route and remove all previous routes
  static Future<T?> navigateAndRemoveUntil<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Navigate to a named route and replace current route
  static Future<T?> navigateAndReplace<T, TO>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed<T, TO>(context, routeName, arguments: arguments);
  }

  /// Navigate back
  static void goBack(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  /// Navigate back to specific route
  static void goBackUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  // ==================== SPECIFIC NAVIGATION METHODS ====================
  
  // Auth Navigation
  static Future<void> goToSignin(BuildContext context) => navigateAndRemoveUntil(context, signin);
  static Future<void> goToSignup(BuildContext context) => navigateTo(context, signup);
  static Future<void> goToForgetPassword(BuildContext context) => navigateTo(context, forgetPassword);
  static Future<void> goToResetPassword(BuildContext context) => navigateTo(context, resetPassword);
  static Future<void> goToClientHome(BuildContext context) => navigateAndRemoveUntil(context, dashboard);

  // Main Navigation
  static Future<void> goToHome(BuildContext context) => navigateAndRemoveUntil(context, home);
  static Future<void> goToAbout(BuildContext context) => navigateAndRemoveUntil(context, about);
  static Future<void> goToCalendar(BuildContext context) => navigateAndRemoveUntil(context, calendar);
  static Future<void> goToServices(BuildContext context) => navigateAndRemoveUntil(context, services);
  static Future<void> goToContact(BuildContext context) => navigateAndRemoveUntil(context, contact);
  static Future<void> goToDonation(BuildContext context) => navigateAndRemoveUntil(context, donation);
  static Future<void> goToClientHomeFromDashboard(BuildContext context) => navigateAndRemoveUntil(context, home);

  // Client Side Navigation
  static Future<void> goToClientsideMenu(BuildContext context) => navigateTo(context, clientsideMenu);
  static Future<void> goToContactMembership(BuildContext context) => navigateTo(context, contactMembership);
  static Future<void> goToContactInvoice(BuildContext context) => navigateTo(context, contactInvoice);
  static Future<void> goToContactInvoiceRecordPayment(BuildContext context) => navigateTo(context, contactInvoiceRecordPayment);
  static Future<void> goToContactDonation(BuildContext context) => navigateTo(context, contactDonation);
  static Future<void> goToContactPayment(BuildContext context) => navigateTo(context, contactPayment);
  static Future<void> goToCreditCardOnFile(BuildContext context) => navigateTo(context, creditCardOnFile);
  static Future<void> goToCreditChangePassword(BuildContext context) => navigateTo(context, creditChangePassword);
  static Future<void> goToDashboard(BuildContext context) => navigateTo(context, dashboard);
  static Future<void> goToEditProfile(BuildContext context) => navigateTo(context, editProfile);
  static Future<void> goToInvoice(BuildContext context) => navigateTo(context, contactInvoice);

  // Service Navigation
  static Future<void> goToCulturalService(BuildContext context) => navigateTo(context, culturalService);
  static Future<void> goToEducationService(BuildContext context) => navigateTo(context, educationService);
  static Future<void> goToFuneralService(BuildContext context) => navigateTo(context, funeralService);
  static Future<void> goToLibraryService(BuildContext context) => navigateTo(context, libraryService);
  static Future<void> goToWomenService(BuildContext context) => navigateTo(context, womenService);
  static Future<void> goToYouthService(BuildContext context) => navigateTo(context, youthService);

  // Other Navigation
  static Future<void> goToBoardOfDirectors(BuildContext context) => navigateTo(context, boardOfDirectors);
  static Future<void> goToBoardMemberDetail(BuildContext context, User user) => 
    navigateTo(context, boardMemberDetail, arguments: RouteArguments(data: {'user': user}));
  static Future<void> goToFormerBoardMembers(BuildContext context) => navigateTo(context, formerBoardMembers);
  static Future<void> goToForm(BuildContext context) => navigateTo(context, form);
  static Future<void> goToMembership(BuildContext context) => navigateTo(context, membership);
  static Future<void> goToPrivacyPolicy(BuildContext context) => navigateTo(context, privacyPolicy);
  static Future<void> goToTermsAndConditions(BuildContext context) => navigateTo(context, termsAndConditions);
  static Future<void> goToHouse(BuildContext context) => navigateTo(context, house);
  static Future<void> goToMarketplace(BuildContext context) => navigateTo(context, marketplace);
  static Future<void> goToPublications(BuildContext context) => navigateTo(context, publications);
}

/// Route arguments class for passing data between screens
class RouteArguments {
  final Map<String, dynamic> data;

  RouteArguments({required this.data});

  T? get<T>(String key) {
    return data[key] as T?;
  }
}
