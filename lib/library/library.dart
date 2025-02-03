import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;

class Library extends StatefulWidget {
  @override
  _Library createState() => _Library();
}

class _Library extends State<Library> {
  // #region var declaration
  //final PageController _pageController = PageController(initialPage: 0); // Start in the middle
  // late PageController _pageController;
  final initialPage = 1000;
  double balance = 77851.0; // Initial balance
  int points = 2000; // Initial points
  int _selectedTabIndex = 0;
  // #endregion

  //#region obj declaration
  final List<String> _tabs = [
    'Favorit',
    'Pilihan Lain',
    'Grab',
    'Finansial',
  ];

  final Map<int, List<MenuItem>> _menuItems = {
    0: [
      MenuItem(icon: Icons.money, label: 'Pinjaman'),
      MenuItem(icon: Icons.account_balance_wallet, label: 'Uang Elektronik'),
      MenuItem(icon: Icons.payment, label: 'Angsuran Kredit'),
      MenuItem(icon: Icons.phone_android, label: 'Pulsa/Paket Data'),
      MenuItem(icon: Icons.play_arrow, label: 'Film'),
    ],
    1: [
      MenuItem(icon: Icons.flash_on, label: 'PLN'),
      MenuItem(icon: Icons.water_drop, label: 'Air PDAM'),
      MenuItem(icon: Icons.tv, label: 'Internet & TV Kabel'),
      MenuItem(icon: Icons.health_and_safety, label: 'BPJS Kesehatan'),
    ],
    2: [
      MenuItem(icon: Icons.local_taxi, label: 'Transportasi'),
      MenuItem(icon: Icons.delivery_dining, label: 'Makanan'),
      MenuItem(icon: Icons.shopping_cart, label: 'Belanja'),
      MenuItem(icon: Icons.local_gas_station, label: 'BBM'),
    ],
    3: [
      MenuItem(icon: Icons.savings, label: 'Tabungan'),
      MenuItem(icon: Icons.attach_money, label: 'Investasi'),
      MenuItem(icon: Icons.account_balance, label: 'Asuransi'),
      MenuItem(icon: Icons.credit_card, label: 'Kartu Kredit'),
    ],
  };

  final List<String> textItems = [
    "Slide 2: Welcome to the Carousel!",
    "Slide 1: Swipe to navigate.",
    "Slide 3: Enjoy creating in Flutter!",
  ];
  // #endregion

  // #region func declaration
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

  void redeemPoints(int amount) {
    setState(() {
      if (points >= amount) points -= amount;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(initialPage: 1000); // Start in the middle

  //   // Jump to the first item after the first frame
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _pageController
  //         .jumpToPage(1000); // Make sure it starts at the "first" logical item
  //   });
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }
  // #endregion

  // Center(child: Text('Library Page gtw buat apaan')),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // #region wallet
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          addToBalance(5000); // Example: Add 5000 to balance
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 24),
                            SizedBox(height: 4),
                            Text(
                              "Top Up",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: Size(60, 60),
                        ),
                        onPressed: () {
                          // Add your action here
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.send, size: 20),
                            SizedBox(height: 2),
                            Text("Transfer", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: Size(60, 60),
                        ),
                        onPressed: () {
                          // Add your action here
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.download, size: 20),
                            SizedBox(height: 2),
                            Text("Withdraw", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Define action for history
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.history, size: 20),
                            SizedBox(height: 2),
                            Text("History", style: TextStyle(fontSize: 10)),
                          ],
                        ),
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
          
          // #region tab menu
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  _tabs.length,
                  (index) => GestureDetector(
                      onTap: () => _onTabSelected(index),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            color: index == _selectedTabIndex
                                ? Colors.purple[100]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                              fontWeight: index == _selectedTabIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index == _selectedTabIndex
                                  ? Colors.blue
                                  : Colors.black),
                        ),
                      ))),
            ),
          ),
          // MenuGrid(menuItems: _menuItems[_selectedTabIndex]!),
          // #endregion
          
          // #region menugrid
          SizedBox(
            // duration: Duration(seconds: 1),
            // curve: Curves.easeInOut,
            height: (_menuItems[_selectedTabIndex]!.length / 3).ceil() * 100,
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
                    onTap: () {
                      print("${item.label} clicked");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            item.icon,
                            color: Colors.blue,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
          ),
          // #endregion
          
          // #region simple carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: textItems.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      textItems[index],
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
          // #endregion
          
          // #region carousel slider
          CarouselSlider(
            options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true),
            items: textItems.map((item) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
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
        ],
      ),
    ));
  }
}

class MenuItem {
  final IconData icon;
  final String label;

  MenuItem({required this.icon, required this.label});
}
