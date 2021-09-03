import 'package:ccartistapp/screens/artistalbum.dart';
import 'package:ccartistapp/screens/artistlists.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('CC Artist APP'),
            ),
            ListTile(
              title: const Text('Our Artist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtistListPage()),
                );
                // ...
              },
            ),
            ListTile(
              title: const Text('CC Albums'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlbumPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('Chocolate City Artists'),
      ),
      body: Text(
        "Welcome to Chocolate City Artist App",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
