import 'package:bagong/login/login.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        actions: [
          PopupMenuButton <String>(
            onSelected: (value) {
              if (value == "logout") {
                // Navigate back to Login Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginObjPage()),
                );
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "profile",
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 8),
                    Text("Profile")
                  ],
                ),
              ),
              PopupMenuItem(
                value: "logout",
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Logout")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Main Page!'
          "ceritanya ini halaman utama lmao :D",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}