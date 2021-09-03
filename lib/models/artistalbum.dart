//import 'dart:convert';

class ArtistAlbum {
  int? id;
  int userId;
  String title;

  ArtistAlbum({
    required this.userId,
    required this.title,
    required this.id,
  });

  factory ArtistAlbum.fromJson(Map<String, dynamic> json) {
    return ArtistAlbum(
      id: json["id"] as int,
      userId: json["userId"] as int,
      title: json["title"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
    };
  }
}
