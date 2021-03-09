import 'package:FoodAp/utilis/cart_icons.dart';
import 'package:flutter/material.dart';
import '../pages/dashboard_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> _widgetList = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CartIcons.home),
              title: Text(
                'Store',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(CartIcons.cart),
              title: Text(
                'My cart',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(CartIcons.favourites),
              title: Text(
                'Favourties',
                style: TextStyle(),
              )),
          BottomNavigationBarItem(
              icon: Icon(CartIcons.account),
              title: Text(
                ' MyAccount',
                style: TextStyle(),
              )),
        ],
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: false,
      title: Text(
        "Grocery App",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white),
        SizedBox(width: 10),
        Icon(Icons.shopping_cart, color: Colors.white),
        SizedBox(width: 10)
      ],
    );
  }
}
