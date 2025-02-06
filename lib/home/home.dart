import 'package:bagong/utilities/object.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  // #region var declaration
  //final PageController _pageController = PageController(initialPage: 0); // Start in the middle
  late PageController _pageController;
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1000); // Start in the middle

    // Jump to the first item after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController
          .jumpToPage(1000); // Make sure it starts at the "first" logical item
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  // #endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
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
            // #endregion

            // #region menu items
            Expanded(
                child: MenuGrid(menuItems: _menuItems[_selectedTabIndex]!)),
            // #endregion

            // #region carousel
            Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    // itemCount: textItems.length,
                    // onPageChanged: (index) {
                    //   setState(() {
                    //     _currPage = index;
                    //   });
                    // },
                    itemBuilder: (context, index) {
                      // Use modulo to calculate the actual index
                      final actualIndex = index % textItems.length;
                      return Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5)),
                            ],
                          ),
                          child: Text(
                            textItems[actualIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    })),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(textItems.length, (index) {
                  return AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, child) {
                        double page =
                            _pageController.page ?? initialPage.toDouble();
                        final currPage =
                            (page - initialPage) % textItems.length;

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 10,
                          width: (currPage.round() == index) ? 20 : 10,
                          decoration: BoxDecoration(
                            color: (currPage.round() == index)
                                ? Colors.blue
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      });
                })),
            SizedBox(
              height: 20,
            ),
            // #endregion
          ],
        ));
  }
}

// #region menu items related
class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;

  const MenuGrid({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return MenuItemWidget(menuItem: menuItems[index]);
      },
    );
  }
}



class MenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemWidget({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(menuItem.icon, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text(
          menuItem.label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
// #endregion
