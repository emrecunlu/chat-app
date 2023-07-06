import 'package:chat_client/core/base/base_viewmodel.dart';
import 'package:chat_client/core/models/auth/dto/user_login_dto.dart';
import 'package:chat_client/core/models/auth/token_model.dart';
import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:chat_client/ui/pages/chat/chat/chat_page.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator<AuthRepository>();
  FormHelper form = FormHelper({"email", "password"});

  Future<void> signIn() async {
    var result = await _authRepository.login(UserLoginDto.fromJson(form.toJson()));

    if (!result.success) return;

    AuthHelper.saveToken(TokenModel.fromJson(result.data!.toJson()));
    NavigationService.replaceScreen(ChatPage());
  }
}
