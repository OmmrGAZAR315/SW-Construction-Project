class BasicModel {
  String id;
  String email;
  String web;
  String password;

  BasicModel({
    required this.id,
    required this.email,
    required this.web,
    required this.password,
  });

  Map<String, String> tojson() => {
        "ID": id,
        "Email": email,
        "Web": web,
        "Password": password,
      };

  static BasicModel fromjson(Map json) => BasicModel(
        id: json["ID"],
        email: json["Email"],
        web: json["Web"],
        password: json["Password"],
      );
}
