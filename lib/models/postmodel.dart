//import 'dart:convert';

class Post {
  int id;

  String name;
  String username;
  String email;
  String phone;
  String website;
  Map address;
  Map company;

  Post({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"] as int,
      name: json["name"] as String,
      username: json["username"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String,
      website: json["website"] as String,
      address: json["address"] as Map,
      company: json["company"] as Map,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "phone": phone,
      "website": website,
      "address": address,
      "company": company,
    };
  }
}
