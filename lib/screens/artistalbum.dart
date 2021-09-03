import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/artistalbum.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:ccartistapp/provider/albumprovider.dart';
import 'package:ccartistapp/provider/postprovider.dart';
import 'package:ccartistapp/screens/artistalbum.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  AlbumPageState createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    var albumApi = new AlbumPost();
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child:
            Consumer<AlbumProvider>(builder: (context, albumProvider, child) {
          if (albumProvider.loading) {
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          } else {
            return ListView.builder(
              //padding: const EdgeInsets.all(8),
              itemCount: albumProvider.artistalbum.length,
              itemBuilder: (context, index) {
                ArtistAlbum artistalbum = albumProvider.artistalbum[index];
                return GestureDetector(
                    child: Container(
                      //color: Colors.orangeAccent,
                      child: Column(
                        children: [
                          Text(
                            artistalbum.id.toString(),
                            style: (TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 10.0),
                          Text(artistalbum.userId.toString()),
                          SizedBox(height: 25.0),
                          Text(artistalbum.title),
                          SizedBox(height: 10),
                          const Divider(
                            color: Colors.blueGrey,
                            height: 20,
                            thickness: 5,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {});
              },
            );
          }
        }),
      ))
    ]));
  }
}
