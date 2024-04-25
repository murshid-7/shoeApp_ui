// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_store/screens/admin_screen.dart';
import 'package:sneaker_store/screens/get_start_page.dart';
import 'package:sneaker_store/widgets/add_products.dart';
import 'package:sneaker_store/screens/product_chart.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Murshid',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          drawerWidget(
            context: context,
            name: 'Admin',
            icon: Icons.person,
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminScreen()));
            },
          ),
          drawerWidget(
            context: context,
            name: 'Product Chart',
            icon: Icons.bar_chart,
            ontap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProductChart()));
            },
          ),
          drawerWidget(
            context: context,
            name: 'Add your Product',
            icon: Icons.add,
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddProduct()));
            },
          ),
          drawerWidget(
            context: context,
            name: 'Logout',
            icon: Icons.logout,
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GetStart()));
            },
          ),
        ],
      ),
    );
  }
}

Widget DrawerBarTop() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        Icon(
          Icons.notifications_outlined,
          size: 25,
        ),
      ],
    );
Widget drawerWidget({
  required context,
  required String name,
  required IconData icon,
  required Function() ontap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(name),
      leading: Icon(icon),
      onTap: () {
        ontap();
      },
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
