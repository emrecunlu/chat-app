import 'package:chat_client/core/base/base_model.dart';

class ApiGetListResult<T extends BaseModel<T>> {
  bool success;
  List<T>? data;

  ApiGetListResult({this.success = false, this.data});

  factory ApiGetListResult.fromJson(Map<String, dynamic> json, BaseModel model) {
    return ApiGetListResult(
      data: json["data"]?.map((e) => model.fromJson(e)).cast<T>().toList() ?? [],
      success: json["success"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "success": success,
      };
}
