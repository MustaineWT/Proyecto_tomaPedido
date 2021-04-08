class RequestToken {
  final bool status;
  final String? token;
  final DateTime? createAt;
  final int? expire;
  final int? personid;
  final String? message;

  RequestToken({
    required this.status,
    this.token,
    this.createAt,
    this.expire,
    this.personid,
    this.message,
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        status: json["status"],
        token: json["token"],
        createAt: json["createAt"] == null
            ? json["createAt"]
            : DateTime.parse(json["createAt"]),
        expire: json["expire"],
        personid: json["personid"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "createAt": createAt!.toIso8601String(),
        "expire": expire,
        "personid": personid,
        "message": message,
      };
}
