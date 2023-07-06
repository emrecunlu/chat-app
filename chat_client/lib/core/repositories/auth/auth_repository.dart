import 'package:chat_client/core/base/base_model.dart';
import 'package:chat_client/core/models/auth/dto/user_login_dto.dart';
import 'package:chat_client/core/models/auth/dto/user_register_dto.dart';
import 'package:chat_client/core/models/auth/token_model.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_result.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/locator.dart';

abstract class IAuthRepository {
  Future<ApiPostResult> register(UserRegisterDto model);
  Future<ApiPostObjectResult<TokenModel>> login(UserLoginDto model);
}

class AuthRepository implements IAuthRepository {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<ApiPostResult> register(UserRegisterDto model) async =>
      await _apiService.post('/auth/register', model.toJson());

  @override
  Future<ApiPostObjectResult<TokenModel>> login(UserLoginDto model) async =>
      await _apiService.postReturnObject<TokenModel>('/auth/login', model.toJson(), TokenModel());
}
