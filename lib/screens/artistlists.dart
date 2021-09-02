import 'package:ccartistapp/artistapi/postapi.dart';
import 'package:ccartistapp/models/postmodel.dart';
import 'package:ccartistapp/provider/postprovider.dart';
import 'package:ccartistapp/screens/artistdetail.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({Key? key}) : super(key: key);

  @override
  ArtistListPageState createState() => ArtistListPageState();
}

class ArtistListPageState extends State<ArtistListPage> {
  @override
  Widget build(BuildContext context) {
    var postApi = new PostApi();
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Consumer<PostProvider>(builder: (context, postProvider, child) {
          if (postProvider.loading) {
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          } else {
            return ListView.builder(
              //padding: const EdgeInsets.all(8),
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                Post post = postProvider.posts[index];
                return GestureDetector(
                    child: Container(
                      //color: Colors.orangeAccent,
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Text(post.id.toString()),
                          Text(
                            post.name,
                            style: (TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 10.0),
                          Text(post.username),
                          SizedBox(height: 25.0),
                          Text(post.email),
                          SizedBox(height: 10),
                          Text(post.phone),
                          SizedBox(height: 10),
                          Text(post.website),
                          SizedBox(height: 10),
                          Text(post.address.toString()),
                          SizedBox(height: 10),
                          Text(post.company.toString()),
                          SizedBox(height: 10),
                          const Divider(
                            color: Colors.blueGrey,
                            height: 20,
                            thickness: 5,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ArtistDetails(id: post.id)));
                    });
              },
            );
          }
        }),
      ))
    ]));
  }
}
