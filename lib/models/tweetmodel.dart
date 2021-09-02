//import 'dart:convert';

class Tweets {
  int? id;
  int postId;
  String name;
  String email;
  String body;

  Tweets(
      {required this.postId,
      required this.name,
      required this.email,
      required this.body,
      required this.id});

  factory Tweets.fromJson(Map<String, dynamic> json) {
    return Tweets(
      id: json["id"] as int,
      postId: json["postId"] as int,
      name: json["name"] as String,
      email: json["email"] as String,
      body: json["body"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "postId": postId,
      "name": name,
      "email": email,
      "body": body,
    };
  }
}
