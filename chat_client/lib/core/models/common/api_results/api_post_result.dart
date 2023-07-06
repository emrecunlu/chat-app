class ApiPostResult {
  String? message;
  bool success;

  ApiPostResult({this.message, this.success = false});

  factory ApiPostResult.fromJson(Map<String, dynamic> json) {
    return ApiPostResult(
      message: json["message"],
      success: json["success"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
      };
}
