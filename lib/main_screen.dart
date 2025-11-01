import 'package:flutter/material.dart';
import 'package:lottery_app/history/history_screens/history_screen.dart';
import 'package:lottery_app/home/home_screen/home_screen.dart';
import 'package:lottery_app/result/result_screens/result_screen.dart';
import 'package:lottery_app/BottomNavBar/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Updated pages list with proper syntax
  final List<Widget> pages = [
    const HomeScreen(),
    const LotteryResultScreen(),
    const PredictionHistoryScreen(),
    const Center(child: Text("Profile Screen")),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onNavTapped,
      ),
    );
  }
}
