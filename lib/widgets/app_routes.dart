import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import all screens
import '../Auth/forget_password.dart';
import '../Auth/reset_password.dart';
import '../Auth/signin.dart';
import '../Auth/signup.dart';
import '../frontscreens/board_member_detail_screen.dart';
import '../frontscreens/boardofdirectoes_screen.dart';
import '../clientscreens/Contact_membership_screen.dart';
import '../clientscreens/clientside_menu_screen.dart';
import '../clientscreens/contact_Invoice_record_payment_screen.dart';
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

  // ==================== GETX ROUTE PAGES ====================
  static List<GetPage> get getPages => [
    // Auth Routes
    GetPage(name: splash, page: () => const Splashscreen()),
    GetPage(name: signin, page: () => const Signin()),
    GetPage(name: signup, page: () => const Signup()),
    GetPage(name: forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: resetPassword, page: () => const ResetPassword()),
    
    // Main Navigation Routes
    GetPage(name: home, page: () => const Homescreen()),
    GetPage(name: about, page: () => const AboutScreen()),
    GetPage(name: calendar, page: () => const CalendarScreen()),
    GetPage(name: services, page: () => const ServicesScreen()),
    GetPage(name: contact, page: () => const ContactScreen()),
    GetPage(name: donation, page: () => const DonationScreen()),
    
    // Client Side Routes
    GetPage(name: clientsideMenu, page: () => const ClientsideMenuScreen()),
    GetPage(name: contactMembership, page: () => const ContactMembershipScreen()),
    GetPage(name: contactInvoice, page: () => const ContactInvoiceScreen()),
    GetPage(name: contactInvoiceRecordPayment, page: () => const ContactInvoiceRecordPaymentScreen()),
    GetPage(name: contactDonation, page: () => const ContactDonationScreen()),
    GetPage(name: contactPayment, page: () => const ContactPaymentScreen()),
    GetPage(name: creditCardOnFile, page: () => const CreditCardOnFileScreen()),
    GetPage(name: creditChangePassword, page: () => const CreditChangePasswordScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: editProfile, page: () => const EditProfileScreen()),

    // Service Detail Routes
    GetPage(name: culturalService, page: () => const ServiceDetailWrapper(
      title: 'Cultural Services',
      currentNavIndex: 3,
      child: CulturalServiceScreen(),
    )),
    GetPage(name: educationService, page: () => const ServiceDetailWrapper(
      title: 'Education Services',
      currentNavIndex: 3,
      child: EducationServiceScreen(),
    )),
    GetPage(name: funeralService, page: () => const ServiceDetailWrapper(
      title: 'Funeral Services',
      currentNavIndex: 3,
      child: FuneralServiceScreen(),
    )),
    GetPage(name: libraryService, page: () => const ServiceDetailWrapper(
      title: 'Library Services',
      currentNavIndex: 3,
      child: Libraryservicescreen(),
    )),
    GetPage(name: womenService, page: () => const ServiceDetailWrapper(
      title: 'Women Services',
      currentNavIndex: 3,
      child: WomenServiceScreen(),
    )),
    GetPage(name: youthService, page: () => const ServiceDetailWrapper(
      title: 'Youth Programs',
      currentNavIndex: 3,
      child: YouthServiceScreen(),
    )),

    // Other Routes
    GetPage(name: boardOfDirectors, page: () => const BoardOfDirectorsScreen()),
    GetPage(name: boardMemberDetail, page: () {
      final args = Get.arguments as RouteArguments?;
      final user = args?.get<User>('user');
      return BoardMemberDetailScreen(user: user!);
    }),
    GetPage(name: formerBoardMembers, page: () => const DropdownScreen()),
    GetPage(name: form, page: () => const FormScreen()),
    GetPage(name: membership, page: () => const MembershipScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsAndConditions, page: () => const termsandcondtions()),
    GetPage(name: marketplace, page: () => const Marketplace()),
    GetPage(name: publications, page: () => const Publications()),
  ];

  // ==================== TRADITIONAL ROUTE MAP FOR BACKWARD COMPATIBILITY ====================
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
  static Future<T?> navigateTo<T>(String routeName, {Object? arguments}) async {
    return await Get.toNamed<T>(routeName, arguments: arguments);
  }

  /// Navigate to a named route and remove all previous routes
  static Future<T?> navigateAndRemoveUntil<T>(String routeName, {Object? arguments}) async {
    return await Get.offAllNamed<T>(routeName, arguments: arguments);
  }

  /// Navigate to a named route and replace current route
  static Future<T?> navigateAndReplace<T, TO>(String routeName, {Object? arguments}) async {
    return await Get.offAndToNamed<T>(routeName, arguments: arguments);
  }

  /// Navigate back
  static void goBack({dynamic result}) {
    Get.back(result: result);
  }

  /// Navigate back to specific route
  static void goBackUntil(String routeName) {
    Get.until((route) => Get.currentRoute == routeName);
  }

  // ==================== SPECIFIC NAVIGATION METHODS ====================
  
  // Auth Navigation
  static Future<void> goToSignin() => navigateAndRemoveUntil(signin);
  static Future<void> goToSignup() => navigateTo(signup);
  static Future<void> goToForgetPassword() => navigateTo(forgetPassword);
  static Future<void> goToResetPassword() => navigateTo(resetPassword);
  static Future<void> goToClientHome() => navigateAndRemoveUntil(dashboard);

  // Main Navigation
  static Future<void> goToHome() => navigateAndRemoveUntil(home);
  static Future<void> goToAbout() => navigateAndRemoveUntil(about);
  static Future<void> goToCalendar() => navigateAndRemoveUntil(calendar);
  static Future<void> goToServices() => navigateAndRemoveUntil(services);
  static Future<void> goToContact() => navigateAndRemoveUntil(contact);
  static Future<void> goToDonation() => navigateAndRemoveUntil(donation);
  static Future<void> goToClientHomeFromDashboard() => navigateAndRemoveUntil(home);

  // Client Side Navigation
  static Future<void> goToClientsideMenu() => navigateTo(clientsideMenu);
  static Future<void> goToContactMembership() => navigateTo(contactMembership);
  static Future<void> goToContactInvoice() => navigateTo(contactInvoice);
  static Future<void> goToContactInvoiceRecordPayment() => navigateTo(contactInvoiceRecordPayment);
  static Future<void> goToContactDonation() => navigateTo(contactDonation);
  static Future<void> goToContactPayment() => navigateTo(contactPayment);
  static Future<void> goToCreditCardOnFile() => navigateTo(creditCardOnFile);
  static Future<void> goToCreditChangePassword() => navigateTo(creditChangePassword);
  static Future<void> goToDashboard() => navigateTo(dashboard);
  static Future<void> goToEditProfile() => navigateTo(editProfile);
  static Future<void> goToInvoice() => navigateTo(contactInvoice);

  // Service Navigation
  static Future<void> goToCulturalService() => navigateTo(culturalService);
  static Future<void> goToEducationService() => navigateTo(educationService);
  static Future<void> goToFuneralService() => navigateTo(funeralService);
  static Future<void> goToLibraryService() => navigateTo(libraryService);
  static Future<void> goToWomenService() => navigateTo(womenService);
  static Future<void> goToYouthService() => navigateTo(youthService);

  // Other Navigation
  static Future<void> goToBoardOfDirectors() => navigateTo(boardOfDirectors);
  static Future<void> goToBoardMemberDetail(User user) => 
    navigateTo(boardMemberDetail, arguments: RouteArguments(data: {'user': user}));
  static Future<void> goToFormerBoardMembers() => navigateTo(formerBoardMembers);
  static Future<void> goToForm() => navigateTo(form);
  static Future<void> goToMembership() => navigateTo(membership);
  static Future<void> goToPrivacyPolicy() => navigateTo(privacyPolicy);
  static Future<void> goToTermsAndConditions() => navigateTo(termsAndConditions);
  static Future<void> goToMarketplace() => navigateTo(marketplace);
  static Future<void> goToPublications() => navigateTo(publications);
}

/// Route arguments class for passing data between screens
class RouteArguments {
  final Map<String, dynamic> data;

  RouteArguments({required this.data});

  T? get<T>(String key) {
    return data[key] as T?;
  }
}