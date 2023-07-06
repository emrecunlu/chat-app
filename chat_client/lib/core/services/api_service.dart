import 'package:chat_client/core/base/base_model.dart';
import 'package:chat_client/core/models/common/api_results/api_post_get_list_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_result.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "http://192.168.1.41:3000/api"));

  ApiService() {
    dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers["Authorization"] =
                'Bearer ${StorageService.instance.getString("token")}';

            return handler.next(options);
          },
          onResponse: (e, handler) {
            return handler.resolve(e);
          },
          onError: (e, handler) async {
            if (e.response?.statusCode == 401) {
              var accessToken =
                  await AuthHelper.refresh(StorageService.instance.getString("refreshToken"));

              if (accessToken != null) {
                e.requestOptions.headers["Authorization"] = 'Bearer $accessToken';
                StorageService.instance.setString("token", accessToken);

                return handler.resolve(await dio.fetch(e.requestOptions));
              }
            } else if (e.response?.statusCode == 403) {
              SnackbarHelper.error("Oturum sonlandırıldı!");
              return AuthHelper.signOut();
            }

            SnackbarHelper.error(e.response?.data["message"] ?? e.message);

            return handler.reject(e);
          },
        ),
      );
  }

  Future<ApiGetListResult<T>> getList<T extends BaseModel<T>>(String url, BaseModel model) async {
    try {
      var response = await dio.get(url);

      return ApiGetListResult<T>.fromJson(response.data, model);
    } catch (err) {
      return ApiGetListResult<T>(success: false);
    }
  }

  Future<ApiPostObjectResult<T>> postReturnObject<T extends BaseModel<T>>(
      String url, dynamic obj, BaseModel model) async {
    try {
      var response = await dio.post(url, data: obj);

      return ApiPostObjectResult<T>.fromJson(response.data, model);
    } catch (err) {
      return ApiPostObjectResult<T>(success: false);
    }
  }

  Future<ApiPostResult> post(String url, dynamic obj) async {
    try {
      debugPrint("atıldı");
      var response = await dio.post(url, data: obj);

      return ApiPostResult.fromJson(response.data);
    } catch (err) {
      return ApiPostResult(success: false);
    }
  }
}
