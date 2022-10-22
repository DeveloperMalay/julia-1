import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:julia/views/chat/chat_screen.dart';
import 'package:julia/views/explore/explore.dart';
import 'package:julia/views/home/home_screen.dart';
import 'package:julia/views/my_account/my_account.dart';
import 'package:julia/views/post_products/all_category.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> currentWidget = [
    const HomeScreen(),
    const ChatScreen(),
    const Categories(),
    Explore(),
    const MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentWidget[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                size: 28,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.home_outlined,
                size: 28,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.message,
                size: 28,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.message_outlined,
                size: 28,
                color: Colors.black,
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30,
                child: Icon(
                  Ionicons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              label: 'Create Post',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Ionicons.planet,
                size: 35,
                color: Colors.black,
              ),
              icon: Icon(
                Ionicons.planet_outline,
                size: 35,
                color: Colors.black,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                size: 35,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 28,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
