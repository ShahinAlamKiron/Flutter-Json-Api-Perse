
import 'dart:convert';

List<Userinfo> userinfoFromJson(String str) => List<Userinfo>.from(json.decode(str).map((x) => Userinfo.fromJson(x)));

String userinfoToJson(List<Userinfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userinfo {
  Userinfo({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
