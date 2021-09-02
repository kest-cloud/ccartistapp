import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/artistdetailsmodel.dart';

import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  String message = '';
  bool loading = true;

  List<Albuminfo> details = [];

  void getPost() async {
    PostApi postApi = PostApi();
    details = await postApi.find(id);
    loading = false;
    notifyListeners();
  }

  DetailsProvider() {
    getPost();
  }
}
