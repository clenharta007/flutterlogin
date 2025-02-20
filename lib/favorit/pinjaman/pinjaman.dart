import 'package:flutter/material.dart';

class Pinjaman extends StatefulWidget {
  @override
  _Pinjaman createState() => _Pinjaman();
}

//assets/img/gai.jpg

class _Pinjaman extends State<Pinjaman> {
  String? selectedCarbo = 'Nasi putih';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uang Elektonik"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              'assets/img/gai.jpg',
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 350.0, 16.0, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child:
                //ur content here... 
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  child: Form(
                    //associating global key with the form(It keeps track of the form)
                    // key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("1                                        1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                        Text("1"),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
