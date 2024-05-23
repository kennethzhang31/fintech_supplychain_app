import 'package:flutter/material.dart';
import 'package:fintech_/views/console.dart';
import 'package:fintech_/views/orders.dart';
import 'package:fintech_/views/inventory.dart';
import 'package:fintech_/views/user_settings.dart';
import 'package:fintech_/views/search.dart';
import 'package:fintech_/views/report.dart';

class sidebarDrawer extends StatelessWidget{
  const sidebarDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 77, 129, 140)
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Main Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
                )),
              ),
            )
          ),
          ListTile(
            leading: const Icon(Icons.computer_rounded),
            title: const Text('Console'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Console()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory_rounded),
            title: const Text('Products and Inventory'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Inventory()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.cases_rounded),
            title: const Text('Orders and Transactions'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Orders()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.search_rounded),
            title: const Text('Search'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const mySearchBar()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Compliance and Documentation'),
            onTap: () => {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.visibility_rounded),
            title: const Text('Reports'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportPage()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_rounded),
            title: const Text('Messaging'),
            onTap: () => {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_stories_rounded),
            title: const Text('RFQs'),
            onTap: () => {
              
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('User Settings'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const User_Settings()))
            },
          ),
        ]
      )
    );
  }
}