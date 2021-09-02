import 'package:ccartistapp/artistapi/postapi.dart';
//import 'package:ccartistapp/models/artistdetailsmodel.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:ccartistapp/provider/postprovider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ArtistDetailsPage extends StatefulWidget {
  Post? post;
  int? id;

  ArtistDetailsPage(id, {Key? key, required this.id}) : super(key: key);

  @override
  ArtistDetailsPageState createState() => ArtistDetailsPageState();
}

class ArtistDetailsPageState extends State<ArtistDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var postApi = new PostApi();
    return Scaffold(
        appBar: AppBar(
          title: Text("CC Artist"),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
              //   future: postApi.find(widget.id),
              builder: (context, AsyncSnapshot<Post> snapshot) {
                if (snapshot.hasData) {
                  return ChangeNotifierProvider(
                      create: (context) => PostProvider(),
                      builder: (context, child) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.phone.toString()),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Text(
                                "Artist 'details",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(snapshot.data!.name),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Text(snapshot.data!.username),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Text(snapshot.data!.username),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [])
                            ]);
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
            )));
  }
}
