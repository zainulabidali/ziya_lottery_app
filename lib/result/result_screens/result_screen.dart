import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottery_app/home/constants/app_colors.dart' show AppColors;
import 'package:lottery_app/BottomNavBar/bottom_nav_bar.dart';
import 'package:lottery_app/home/home_screen/home_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:lottery_app/result/widgets/Consolation_prize_widget.dart';
import 'package:lottery_app/result/widgets/result_hedding_widget.dart';

class LotteryResultScreen extends StatefulWidget {
  const LotteryResultScreen({super.key});

  @override
  State<LotteryResultScreen> createState() => _LotteryResultScreenState();
}

class _LotteryResultScreenState extends State<LotteryResultScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool _showSuggestions = false;
  final FocusNode _focusNode = FocusNode();

  final List<String> lotteryNumbers = [
    'Bhagyathara',
    'Sthree Sakthi',
    'Dhanalakshmi',
    'Karunya Plus',
  ];

  bool showResults = false;
  int selectedIndex = 1; // Assuming 'Result' is at index 1

  void onNavTapped(int index) {
    // Navigate based on the selected index
    switch (index) {
      case 0: // Home
        // Navigate to home screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => route.isFirst,
        );
        break;
      case 1:
        // Result (current screen)

        // Already on result screen, no navigation needed
        break;
      case 2: // History
        // Show a snackbar indicating this feature is not implemented yet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('History feature coming soon!')),
        );
        break;
      case 3: // Profile
        // Show a snackbar indicating this feature is not implemented yet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile feature coming soon!')),
        );
        break;
    }
  }

  // Sample data
  final Map<String, dynamic> prizeData = {
    "firstPrize": {
      "amount": "₹1,00,00,000",
      "code": "DY86758",
      "place": "Payyannur",
    },
    "secondPrize": {
      "amount": "₹30,00,000",
      "code": "DY86758",
      "place": "Malappuram",
    },
    "thirdPrize": {
      "amount": "₹1,00,000",
      "code": "DY86758",
      "place": "Kozhikode",
    },
    "consolationPrize": {
      "amount": "₹5,000",
      "codes": [
        "DY86758",
        "DY86543",
        "DY86721",
        "DY86712",
        "DY86645",
        "DY86432",
      ],
    },
  };

  // date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.kGradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  result_hedding_widget(),

                  // Search TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color.fromARGB(255, 135, 135, 135),
                        //     blurRadius: 4,
                        //     offset: const Offset(0, 2),
                        //   ),
                        // ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Row(
                          children: [
                            // Blue search icon section
                            Container(
                              height: 55.h,
                              width: 45.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1976D2),
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            // Expanded text field with suggestions
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: TypeAheadField(
                                  builder: (context, controller, focusNode) {
                                    return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      textAlign: TextAlign.center,

                                      decoration: InputDecoration(
                                        hintText: "Enter Number",
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 14.h,
                                          horizontal: 12.w,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _showSuggestions =
                                                  !_showSuggestions;
                                            });
                                            if (_showSuggestions) {
                                              focusNode.requestFocus();
                                            } else {
                                              focusNode.unfocus();
                                            }
                                          },
                                          child: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  suggestionsCallback: (pattern) {
                                    if (pattern.isEmpty && _showSuggestions) {
                                      return lotteryNumbers;
                                    }
                                    return lotteryNumbers
                                        .where(
                                          (item) => item.toLowerCase().contains(
                                            pattern.toLowerCase(),
                                          ),
                                        )
                                        .toList();
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      leading: const Icon(
                                        Icons.confirmation_number,
                                        color: Color(0xFF1976D2),
                                      ),
                                      title: Text(
                                        suggestion,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                  onSelected: (suggestion) {
                                    numberController.text = suggestion;
                                    _focusNode.unfocus();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // Date Picker TextField (Styled)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 18.0,
                    ),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Row(
                          children: [
                            // Blue calendar icon section
                            Container(
                              height: 55.h,
                              width: 45.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF1976D2),
                              ),
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),

                            // Date field (non-editable)
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: Container(
                                    color: Colors.white,
                                    child: TextField(
                                      controller: dateController,
                                      textAlign: TextAlign.center,

                                      decoration: InputDecoration(
                                        hintText: "Select Date",
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 14.h,
                                          horizontal: 12.w,
                                        ),
                                        suffixIcon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Check button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 18.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showResults = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 4, // gives shadow depth
                          shadowColor: const Color.fromARGB(255, 135, 135, 135),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),

                        child: Text(
                          "CHECK",
                          style: TextStyle(
                            color: Color(0xFF1976D2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),
                  Consolation_prize_widget(
                    showResults: showResults,
                    prizeData: prizeData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
