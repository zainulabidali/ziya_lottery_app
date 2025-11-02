import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/auth/constants/spacing.dart';
import 'package:lottery_app/history/widgets/PredictionCard_widget.dart';
import 'package:lottery_app/history/widgets/appBar_widget.dart';
import 'package:lottery_app/home/constants/app_colors.dart';

class PredictionHistoryScreen extends StatefulWidget {
  const PredictionHistoryScreen({super.key});

  @override
  State<PredictionHistoryScreen> createState() =>
      _PredictionHistoryScreenState();
}

class _PredictionHistoryScreenState extends State<PredictionHistoryScreen> {
  String selectedTab = 'All';

  final List<Map<String, dynamic>> predictions = [
    {
      'lottery': 'Win Win',
      'date': '25-10-2025',
      'prize': '1st prize',
      'ticket': 'WN',
      'ticketnum': '432456',
      'plan': 'Plan 3',
      'status': 'Drawn',
      'result': 'No Match',
      'matchType': 'normal',
    },
    {
      'lottery': 'Sthree Sakthi',
      'date': '25-10-2025',
      'prize': '2nd prize',
      'ticket': 'AK',
      'ticketnum': '789234',
      'plan': 'Plan 3',
      'status': 'Drawn',
      'result': 'No Match',
      'matchType': 'normal',
    },
    {
      'lottery': 'Karunya Plus',
      'date': '25-10-2025',
      'prize': '1st prize',
      'ticket': 'KR',
      'ticketnum': '567890',
      'plan': 'Plan 3',
      'status': 'Drawn',
      'result': 'Close Match',
      'matchType': 'close',
    },
    {
      'lottery': 'Dhanalakshmi',
      'date': '25-10-2025',
      'prize': '7th Prize',
      'ticket': 'RN',
      'ticketnum': '234567',
      'plan': 'Plan 1',
      'status': 'Pending',
      'result': '',
      'matchType': '',
    },
  ];

 List<Map<String, dynamic>> get filteredList {
  if (selectedTab == 'All') return predictions;
  if (selectedTab == 'Completed') {
    return predictions.where((item) => item['status'] == 'Drawn').toList();
  }
  if (selectedTab == 'Pending') {
    return predictions.where((item) => item['status'] == 'Pending').toList();
  }
  return [];
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ---- Gradient AppBar ----
          Appbar_widget(),

          // ---- White tab section (under gradient) ----
          Spacing.height(10),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Container(
              width: 358,
              height: 26.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab("All"),
                  buildTab("Completed"),
                  buildTab("Pending"),
                ],
              ),
            ),
          ),

          // ---- Prediction List ----
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: filteredList.isEmpty
                  ? Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: PredictionCard_history(item: item),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String label) {
    final bool isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(
        width: 106.w,
        height: 20.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}

