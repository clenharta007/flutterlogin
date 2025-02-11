import 'package:bagong/error/page404.dart';
import 'package:bagong/favorit/pinjaman/pinjaman.dart';
import 'package:bagong/favorit/uang_elektronik/uang_elektronik.dart';
import 'package:bagong/utilities/object.dart';
import 'package:flutter/material.dart';

class Menu {
  List<String> tabs = [
    'Favorit',
    'Pilihan Lain',
    'Grab',
    'Finansial',
  ];

  Map<int, List<MenuItem>> menuItems = {
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

  final List<Map<String, dynamic>> carousel = [
    {
      'text': 'Slide 1: Swipe to navigate.',
      'image': 'assets/img/gai.jpg',
      'route': Pinjaman(),
    },
    {
      'text': 'Slide 2: Welcome to the Carousel!',
      'image': 'assets/img/mai.jpg',
      'route': UangElektronik(),
    },
    {
      'text': 'Slide 3: Enjoy creating in Flutter!',
      'image': 'assets/img/pan.jpg',
      'route': Page404(),
    }
  ];
}
