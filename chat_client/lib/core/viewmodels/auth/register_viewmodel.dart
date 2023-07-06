import 'package:chat_client/core/base/base_viewmodel.dart';
import 'package:chat_client/core/models/auth/dto/user_register_dto.dart';
import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:chat_client/ui/pages/auth/login/login_page.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator<AuthRepository>();
  FormHelper form = FormHelper({
    "userName",
    "email",
    "password",
  });

  Future<void> register() async {
    var result = await _authRepository.register(UserRegisterDto.fromJson(form.toJson()));

    if (!result.success) return;

    SnackbarHelper.success("Kayıt olundu, giriş yapınız.");
    NavigationService.replaceScreen(LoginPage());
  }
}
