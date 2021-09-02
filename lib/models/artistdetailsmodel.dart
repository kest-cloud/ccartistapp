//import 'dart:convert';

class Albuminfo {
  int? id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Albuminfo({
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Albuminfo.fromJson(Map<String, dynamic> json) {
    return Albuminfo(
      albumId: json["albumId"] as int,
      title: json["title"] as String,
      url: json["url"] as String,
      thumbnailUrl: json["thumbnailUrl"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "albumId": albumId,
      "title": title,
      "url": url,
      "thumbnailUrl": thumbnailUrl,
    };
  }
}
