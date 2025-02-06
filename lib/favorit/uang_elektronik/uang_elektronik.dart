import 'dart:convert';

import 'package:bagong/favorit/uang_elektronik/parts/button_grid.dart';
import 'package:bagong/utilities/assetsbank.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UangElektronik extends StatefulWidget {
  @override
  _UangElektronik createState() => _UangElektronik();
}

class _UangElektronik extends State<UangElektronik> {
  bool isTap = false;
  List<Map<String, dynamic>> menu = [];

  // Define menu items
  // final List<Map<String, dynamic>> menuItems = [
  //   {'icon': Icons.home, 'label': 'Home'},
  //   {'icon': Icons.person, 'label': 'Profile'},
  //   {'icon': Icons.settings, 'label': 'Settings'},
  //   {'icon': Icons.notifications, 'label': 'Notifications'},
  //   {'icon': Icons.shopping_cart, 'label': 'Cart'},
  //   {'icon': Icons.help, 'label': 'Help'},
  // ];

  Future<void> loadMenuItems() async {
    final String response =
        await rootBundle.loadString('assets/json/uangelektronikmenu.json');
    final List<dynamic> data = jsonDecode(response);

    

    setState(() {
      menu = data.map((item) {
        return {
          "icon": Assetsbank.mapIcon(item["icon"]),
          "label": item["label"]
        };
      }).toList();
    });

    print(menu);
  }

  @override
  void initState() {
    super.initState();
    loadMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uang Elektonik"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final item = menu[index];
                return ButtonGrid(menuItems: item);
              })),
    );
  }
}
