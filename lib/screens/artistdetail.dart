import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:ccartistapp/provider/postprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistDetails extends StatefulWidget {
  int id;

  ArtistDetails({Key? key, required this.id}) : super(key: key);
  @override
  ArtistDetailsState createState() => ArtistDetailsState();
}

class ArtistDetailsState extends State<ArtistDetails> {
  @override
  Widget build(BuildContext context) {
    var postApi = new PostApi();
    return Scaffold(
        appBar: AppBar(
          title: Text("My Blog"),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
              //future: postAPI.find(widget.userId),
              builder: (context, AsyncSnapshot<Post> snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<PostProvider>(
                        builder: (context, postProvider, child) {
                      return Text("${postProvider.message}");
                    }),
                    Text(snapshot.data!.id.toString()),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Text(
                      "News Headline",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Update tweet",
                          ),
                        ),
                        SizedBox(width: 20.0),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          onPressed: () async {},
                          child: Text(
                            "Delete Tweet",
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      // controller: value.controllerName,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your name'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      // controller: value.controllerEmail,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your email'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      //  controller: value.controllerBody,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your comment'),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Post Comment",
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Back",
                      ),
                    ),
                  ],
                );
              },
            )));
  }
}
