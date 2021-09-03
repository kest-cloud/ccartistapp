import 'dart:convert';
import 'dart:core';
import 'package:ccartistapp/models/artistalbum.dart';
import 'package:ccartistapp/models/artistdetailsmodel.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:http/http.dart' as http;

class PostApi {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> findAll() async {
    var response = await http.get(Uri.parse('$url/users'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      return body.map((users) => Post.fromJson(users)).toList();
      // return body.fromJson(jsonDecode(response.body));
      //return body.map((posts) => Post.fromJson(posts));
    } else {
      throw Exception("Fail to list all artist");
    }
  }

  Future createTweet(Post post) async {
    final response = await http.post(
      Uri.parse('$url/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );
    print(response);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to create new Tweet.');
    }
  }
}

class AlbumPost {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<ArtistAlbum>> findAll() async {
    var response = await http.get(Uri.parse('$url/albums'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      return body.map((albums) => ArtistAlbum.fromJson(albums)).toList();
      // return body.fromJson(jsonDecode(response.body));
      //return body.map((posts) => Post.fromJson(posts));
    } else {
      throw Exception("Fail to list all artist");
    }
  }
}
