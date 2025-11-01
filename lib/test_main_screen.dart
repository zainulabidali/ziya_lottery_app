// import 'package:flutter/material.dart';
// import 'package:lottery_app/home/home_screen/home_screen.dart';
// import 'package:lottery_app/result/result_screens/result_screen.dart';
// import 'package:lottery_app/BottomNavBar/bottom_nav_bar.dart';

// class TestMainScreen extends StatefulWidget {
//   const TestMainScreen({super.key});

//   @override
//   State<TestMainScreen> createState() => _TestMainScreenState();
// }

// class _TestMainScreenState extends State<TestMainScreen> {
//   int _selectedIndex = 0;

//   // Updated pages list with proper syntax
//   final List<Widget> pages = [
//     const HomeScreen(),
//     const LotteryResultScreen(),
//     const Center(child: Text("History Screen")),
//     const Center(child: Text("Profile Screen")),
//   ];

//   void _onNavTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_selectedIndex],
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onNavTapped,
//       ),
//     );
//   }
// }