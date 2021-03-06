import 'package:ccartistapp/app.dart';
import 'package:ccartistapp/provider/albumprovider.dart';
import 'package:ccartistapp/provider/postprovider.dart';
import 'package:ccartistapp/screens/artistalbum.dart';
import 'package:ccartistapp/screens/artistlists.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//import 'package:mini_app/provider/postprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PostProvider()),
      ChangeNotifierProvider(create: (context) => AlbumProvider())
    ],
    child: ArtistApp(),
  ));
}

// ignore: must_be_immutable
class ArtistApp extends StatelessWidget {
  var navigator = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator,
      title: "Artist List",
      theme: ThemeData(
        primaryColor: Colors.brown[400],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CC Artist List"),
        ),
        body: Homepage(),
      ),
    );
  }
}
