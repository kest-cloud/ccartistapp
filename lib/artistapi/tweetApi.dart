import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ccartistapp/models/postmodel.dart';

class TweetApi {
  String url = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> findAll() async {
    var response = await http.get(Uri.parse('$url/comments'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      return body.map((posts) => Post.fromJson(posts)).toList();
      // return body.fromJson(jsonDecode(response.body));
      //return body.map((posts) => Post.fromJson(posts));
    } else {
      throw Exception("Fail to create a Post");
    }
  }

  Future updateTweet(Post post) async {
    final response = await http.post(
      Uri.parse('$url/comments/${post.id!}'),
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
      throw Exception('Failed to update tweet.');
    }
  }

  Future deleteTweet(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$url/comments/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // then throw an exception.
      throw Exception('Failed to Delete Tweet.');
    }
  }
}
