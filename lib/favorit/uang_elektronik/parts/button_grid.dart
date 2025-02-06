import 'package:flutter/material.dart';

class ButtonGrid extends StatefulWidget {
  final Map<String, dynamic> menuItems;

  ButtonGrid({required this.menuItems});

  @override
  _GridMenuItemState createState() => _GridMenuItemState();
}

class _GridMenuItemState extends State<ButtonGrid> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('${widget.menuItems['label']}');
        },
        onTapDown: (details) {
          setState(() {
            isTap = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            isTap = false;
          });
        },
        child: Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.menuItems["icon"],
                  size: 40,
                  color: isTap ? Colors.purpleAccent : Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.menuItems["label"],
                  style: TextStyle(
                    fontSize: 12,
                    color: isTap ? Colors.purpleAccent : Colors.white,
                  ),
                )
              ],
            )));
  }
}
