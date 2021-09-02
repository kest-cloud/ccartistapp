import 'dart:convert';
import 'dart:core';
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

  Future<Post> find(int id) async {
    // ignore: unnecessary_brace_in_string_interps
    var response = await http.get(Uri.parse('$url/albums/${id}/photos'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fail load albums");
    }
  }
}
