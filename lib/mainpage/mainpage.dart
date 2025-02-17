// ignore_for_file: unused_import

import 'package:bagong/error/page404.dart';
import 'package:bagong/home/home.dart';
import 'package:bagong/home/home_alt.dart';
import 'package:bagong/library/library.dart';
import 'package:bagong/login/login.dart';
import 'package:bagong/profile/profile.dart';
import 'package:bagong/search/search.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String? user;

  MainPage({required this.user});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  late String? ur = "";
  // final List<Widget> _pages = [HomeAlt(), Search(), Library(), Profile()];

  Widget paging(var index) {
    String? u = ur;
    switch (index) {
      case 0:
        return HomeAlt(user: u);
      case 1:
        return Search();
      case 2:
        return Library();
      case 3:
        return Profile();
      default:
        return Page404();
    }
  }

  void selectTopRight(String value) {
    Widget page;
    if (value == "logout") {
      // Navigate back to Login Page
      page = LoginObjPage();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } else if (value == "profile") {
      page = Page404();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    } else {
      page = Page404();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    ur = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
              '${_currentIndex == 0 ? "Home" : _currentIndex == 1 ? "Search" : _currentIndex == 2 ? "Library" : "Profile"} Page'),
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu)),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) => selectTopRight(value),
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
        drawer: Drawer(
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "Drawer Header",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Handle navigation or action
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(
                                user: widget.user,
                              )));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  // Handle navigation or action
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page404()));
                },
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Handle logout
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginObjPage()),
                  );
                },
              )
            ],
          ),
        ),
        body: paging(_currentIndex),
        //_pages[_currentIndex],
        // #region
        // Center(
        //   child: Text(
        //     'Welcome to the ${_currentIndex == 0 ? "Home" : _currentIndex == 1 ? "Search" : _currentIndex == 2 ? "Library" : "Profile"} Page!'
        //     "ceritanya ini halaman ${_currentIndex == 0 ? "Home" : _currentIndex == 1 ? "Search" : _currentIndex == 2 ? "Library" : "Profile"} lmao XD",
        //     style: TextStyle(fontSize: 24),
        //   ),
        // ),
        // #endregion
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "Library",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.blue),
          ],
        )
        // #region custom navbar (manual)
        // Container(
        //   color: Colors.blue,
        //   padding: EdgeInsets.symmetric(vertical: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: List.generate(4, (index) {
        //       return GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = index;
        //           });
        //         },
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Icon(
        //                 index == 0
        //                     ? Icons.home
        //                     : index == 1
        //                         ? Icons.search
        //                         : index == 2
        //                             ? Icons.my_library_books
        //                             : Icons.person,
        //                 color: _currentIndex == index
        //                     ? Colors.white
        //                     : Colors.white54),
        //             Text(
        //               index == 0
        //                   ? "Home"
        //                   : index == 1
        //                       ? "Search"
        //                       : index == 2
        //                           ? "Library"
        //                           : "Profile",
        //               style: TextStyle(
        //                   color: _currentIndex == index
        //                       ? Colors.white
        //                       : Colors.white54),
        //             ),
        //           ],
        //         ),
        //       );
        //     }),
        //   ),
        // ),
        // #endregion
        );
  }
}
