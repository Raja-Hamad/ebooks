import 'package:ebooks/utils/appstyles.dart';
import 'package:ebooks/views/dashboard_view.dart';
import 'package:ebooks/views/qiblah_view.dart';
import 'package:ebooks/views/settings_view.dart';
import 'package:ebooks/views/tasbih_view.dart';
import 'package:flutter/material.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardView(),
    TasbihView(),
    QiblahScreen(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Appstyles.primaryColor2,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xffFCE0D5),
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              color: Colors.white,
              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/tasbih.png",
              color: Colors.white,

              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
            label: 'Tasbih',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/qiblah.png",
              color: Colors.white,

              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
            label: 'Qiblah',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/setting.png",
              color: Colors.white,

              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
