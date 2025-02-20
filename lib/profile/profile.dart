import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Center(child: Text('Profile Page di profil')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purple[100],
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " - ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(' - ', style: TextStyle(color: Colors.grey)),
                    ],
                  )),
                  TextButton(
                    onPressed: () {},
                    child: Text('Ubah', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          // Loyalty Code Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.qr_code),
            label: Text('Loyalty Code'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 14),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          // Account Section
          Text('Akun',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ListTile(
            leading: Icon(Icons.star, color: Colors.amber),
            title: Text('OVO Club'),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: Text('Upgrade'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.black),
            title: Text('OVO Points'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
