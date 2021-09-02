import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/artistdetailsmodel.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  String message = '';
  bool loading = true;

  List<Post> posts = [];
  List<Albuminfo> album = [];

  void getAllPost() async {
    PostApi postApi = PostApi();
    posts = await postApi.findAll();
    loading = false;
    notifyListeners();
  }

  // void getPost() async {
  //   PostApi postApi = PostApi();
  //   album = await postApi.find();
  //   loading = false;
  //   notifyListeners();
  // }

  PostProvider() {
    getAllPost();
    //getPost();
  }
}
