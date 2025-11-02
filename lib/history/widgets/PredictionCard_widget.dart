import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PredictionCard_history extends StatelessWidget {
  final Map<String, dynamic> item;
  const PredictionCard_history({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isPending = item['status'] == 'Pending';
    final isCloseMatch = item['matchType'] == 'close';

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Plan Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['lottery'],
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        item['status'],
                        style: TextStyle(
                          color: isPending ? Colors.orange : Colors.green,
                          fontWeight: FontWeight.w400,
                          fontSize: 6,
                        ),
                      ),
                      SizedBox(height: 5.w),
                      Container(
                        // width: 38.w,
                        // height: 17.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF2196F3)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            item['plan'],
                            style: TextStyle(
                              color: const Color(0xFF2196F3),
                              fontWeight: FontWeight.w500,
                              fontSize: 9.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 10.sp,
                color: Colors.grey,
              ),
              SizedBox(width: 4.w),
              Text(
                item['date'],
                style: TextStyle(color: const Color.fromARGB(255, 50, 49, 49), fontSize: 9.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            item['prize'],
            style: TextStyle(fontSize: 9.sp, color: Colors.black87),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 332.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2196F3)),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['ticket'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xFF2196F3),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  item['ticketnum'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: const Color.fromARGB(255, 38, 38, 38),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (!isPending) ...[
            SizedBox(height: 8.h),
            Divider(color: Color.fromRGBO(238, 234, 234, 1), thickness: 1),
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 16,
                  color: const Color.fromARGB(255, 25, 118, 210),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Result: ',
                  style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                ),
                Text(
                  ' ${item['result']}',
                  style: TextStyle(
                    color: isCloseMatch ? Colors.green : Colors.grey,
                    fontSize: 9.sp,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
