import 'package:flutter/material.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int selectedIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  List<BottomNavigationBarItem> navigationIcons = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.message_outlined,
        ),
        label: "Messages"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.location_on_outlined,
        ),
        label: "Location"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
        ),
        label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      items: navigationIcons,
      onTap: _onItemTapped,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
    );
  }
}
