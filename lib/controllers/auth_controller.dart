import 'package:get/get.dart';
import '../services/auth_manager.dart';

class AuthController extends GetxController {
  final AuthManager _authManager = Get.find();

  var isLoggedIn = false.obs;
  var userId = ''.obs;
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate loading
    isLoggedIn.value = _authManager.isLoggedIn;
    userId.value = _authManager.userId ?? '';
    userName.value = _authManager.userName ?? '';
  }

  Future<void> login({required String userId, required String userName}) async {
    try {
      await _authManager.login(userId: userId, userName: userName);
      isLoggedIn.value = true;
      this.userId.value = userId;
      this.userName.value = userName;
      update();
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await _authManager.logout();
      isLoggedIn.value = false;
      this.userId.value = '';
      this.userName.value = '';
      update();
    } catch (e) {
      throw e;
    }
  }

  Future<void> init() async {
    await _authManager.init();
    _loadAuthState();
  }
}