import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Pinjaman"),
      // ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.highlight_off_rounded,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "404",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            "Page Not Found",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      )),
    );
  }
}
