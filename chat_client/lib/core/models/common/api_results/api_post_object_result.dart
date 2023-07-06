import 'package:chat_client/core/base/base_model.dart';

class ApiPostObjectResult<T extends BaseModel<T>> {
  String? message;
  bool success;
  T? data;

  ApiPostObjectResult({
    this.message,
    this.success = false,
    this.data,
  });

  factory ApiPostObjectResult.fromJson(Map<String, dynamic> json, BaseModel model) {
    return ApiPostObjectResult(
      data: json["data"] != null ? model.fromJson(json["data"]) : null,
      message: json["message"],
      success: json["success"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "success": success,
      };
}
