class LoginPayload {
  String identity;
  String password;

  LoginPayload({
    required this.identity,
    required this.password,
  });

  factory LoginPayload.fromJson(Map<String, dynamic> json) => LoginPayload(
        identity: json["identity"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "identity": identity,
        "password": password,
      };
}
