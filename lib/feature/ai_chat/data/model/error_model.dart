class ErrorModel {
  final String message;
  final int? code;

  ErrorModel({required this.message, this.code});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'] ?? "Unknown error",
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "code": code};
  }
}
