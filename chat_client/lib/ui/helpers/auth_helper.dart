import 'package:chat_client/core/models/auth/token_model.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/pages/auth/login/login_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHelper {
  static StorageService _storageService = StorageService.instance;
  static ApiService _apiService = locator<ApiService>();

  static Future<void> saveToken(TokenModel model) async {
    await _storageService.setString("token", model.accessToken);
    await _storageService.setString("refreshToken", model.refreshToken);
  }

  static int getUserId() {
    return JwtDecoder.decode(_storageService.getString("token"))["id"] ?? 0;
  }

  static bool isLoggedIn() {
    final String token = _storageService.getString("token");

    return !token.isEmpty;
  }

  static Future<void> signOut() async {
    await _storageService.remove("token");
    await _storageService.remove("refreshToken");

    NavigationService.closeAll(LoginPage());
  }

  static Future<String?> refresh(String refreshToken) async {
    try {
      var response = await _apiService.dio.get('/auth/token/$refreshToken');

      return response.data["data"] as String;
    } catch (err) {
      return null;
    }
  }
}
