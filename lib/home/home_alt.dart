// ignore_for_file: unnecessary_breaks
import 'package:bagong/error/page404.dart';
import 'package:bagong/favorit/pinjaman/pinjaman.dart';
import 'package:bagong/favorit/uang_elektronik/uang_elektronik.dart';
import 'package:bagong/home/constants/menu.dart';
import 'package:bagong/utilities/object.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeAlt extends StatefulWidget {
  final String? user;
  HomeAlt({required this.user});
  @override
  _HomeAlt createState() => _HomeAlt();
}

class _HomeAlt extends State<HomeAlt> {
  // late PageController _pageController;
  List<Map<int, List<MenuItem>>> item = [];
  List<dynamic> tab = [];
  final initialPage = 1000;
  double balance = 77851.0; // Initial balance
  int points = 2000; // Initial points
  int _selectedTabIndex = 0;

  final List<String> tabs = Menu().tabs;
  final Map<int, List<MenuItem>> _menuItems = Menu().menuItems;
  final List<Map<String, dynamic>> textItems = Menu().carousel;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void addToBalance(double amount) {
    setState(() {
      balance += amount;
    });
  }

  void reduceBalance(double amount) {
    setState(() {
      balance -= amount;
      points += ((amount / 1000) / 2).floor();
    });
  }

  void redeemPoints(int amount) {
    setState(() {
      if (points >= amount) points -= amount;
    });
  }

  void navigator(BuildContext context, String label) {
    Widget page;
    print('Tapped on $label');
    switch (label) {
      case 'Pinjaman':
        page = Pinjaman();
        break;
      case 'Uang Elektronik':
        page = UangElektronik();
        break;
      default:
        page = Page404();
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 22, top: 8),
            child: Text(
              "Welcome, ${widget.user ?? " - "}!",
              textAlign: TextAlign.left,
            ),
          ),

          // #region wallet box
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 350, // Adjust to your desired width
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OVO Cash",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Total Saldo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp ${balance.toStringAsFixed(0)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: IconButton(
                                onPressed: () {
                                  addToBalance(5000);
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Top Up",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: IconButton(
                                onPressed: () {
                                  reduceBalance(5000);
                                },
                                icon: Icon(
                                  Icons.send,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Transfer",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: IconButton(
                                onPressed: () {
                                  reduceBalance(5000);
                                },
                                icon: Icon(
                                  Icons.download,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Withdraw",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: IconButton(
                                onPressed: () {
                                  // addToBalance(5000);
                                },
                                icon: Icon(
                                  Icons.history,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("History",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          redeemPoints(500);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "$points Points",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // #endregion

          // #region border
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5)),
          ),
          // #endregion

          // scroll view
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      tabs.length,
                      (index) => GestureDetector(
                            onTap: () => _onTabSelected(index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: index == _selectedTabIndex
                                      ? Colors.purple[100]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                    fontWeight: index == _selectedTabIndex
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: index == _selectedTabIndex
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(
                height:
                    (_menuItems[_selectedTabIndex]!.length / 3).ceil() * 100,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    itemCount: _menuItems[_selectedTabIndex]!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      final item = _menuItems[_selectedTabIndex]![index];
                      return GestureDetector(
                        onTap: () => navigator(context, item.label),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[200],
                              child:
                                  Icon(item.icon, color: Colors.blue, size: 15),
                            ),
                            SizedBox(height: 5),
                            Text(item.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      );
                    }),
              ),
              // #region carousel slider
              CarouselSlider(
                options: CarouselOptions(
                    height: 200,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOut,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true),
                items: textItems.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  item['route'] ?? Page404()));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  item['image'] ?? "assets/img/noimage.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: Colors.purpleAccent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              item['text'] ?? "No Title",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
              // #endregion
              Container(
                  height: 200,
                  color: Colors.green,
                  child: Center(child: Text('Red Box'))),
              Container(
                  height: 200,
                  color: Colors.orange,
                  child: Center(child: Text('Red Box'))),
              Container(
                  height: 200,
                  color: Colors.orange,
                  child: Center(child: Text('Red Box'))),
            ]),
          ))
        ],
      ),
    );
  }
}

// List.generate(
//   30,
//   (index) => ListTile(
//     title: Text("Item $index"),
//   ),
//   ),
