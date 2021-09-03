import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/artistalbum.dart';
import 'package:flutter/material.dart';

class AlbumProvider extends ChangeNotifier {
  String message = '';
  bool loading = true;

  List<ArtistAlbum> artistalbum = [];

  void getallAlbum() async {
    AlbumPost albumpost = AlbumPost();
    artistalbum = await albumpost.findAll();
    loading = false;
    notifyListeners();
  }

  AlbumProvider() {
    getallAlbum();
  }
}
