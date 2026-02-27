import 'package:get/get.dart';
import '../services/auth_manager.dart';

// Import all controllers
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/about_controller.dart';
import '../controllers/services_controller.dart';
import '../controllers/calendar_controller.dart';
import '../controllers/contact_controller.dart';
import '../controllers/main_donation_controller.dart';
import '../controllers/signin_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/forget_password_controller.dart';
import '../controllers/reset_password_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/invoice_controller.dart';
import '../controllers/invoice_record_payment_controller.dart';
import '../controllers/credit_card_controller.dart';
import '../controllers/change_password_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Core services
    Get.lazyPut(() => AuthManager(), fenix: true);
    
    // Auth controllers
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SigninController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    
    // Main screen controllers
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AboutController(), fenix: true);
    Get.lazyPut(() => ServicesController(), fenix: true);
    Get.lazyPut(() => CalendarController(), fenix: true);
    Get.lazyPut(() => ContactController(), fenix: true);
    Get.lazyPut(() => MainDonationController(), fenix: true);
    
    // Client-side controllers
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
    Get.lazyPut(() => InvoiceController(), fenix: true);
    Get.lazyPut(() => InvoiceRecordPaymentController(), fenix: true);
    Get.lazyPut(() => CreditCardController(), fenix: true);
  }
}