import 'package:flutter/material.dart';
import 'package:lottery_app/core/components/spacing.dart';

class VerifySuccess_view extends StatelessWidget {
  const VerifySuccess_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              Text(
                'Verify Successfull',
                style: TextStyle(
                  // A bright blue color is used to match the image
                  color: Colors.blue,
                  fontSize: 28, // Adjusted for prominence
                  fontWeight: FontWeight.bold, // Use bold or semi-bold
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 12,
              ), // Spacing between the title and the first line of subtext
              // --- Email Verified Subtext ---
              Text(
                'Email verified Successfully',
                style: TextStyle(
                  color: Colors.grey, // A lighter color for supporting text
                  fontSize: 16,
                  fontWeight: FontWeight.w400, // Regular weight
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 4), // Spacing between the two lines of subtext

              Text(
                'Your Account Is Ready',
                style: TextStyle(
                  color: Colors.grey, // Same as the line above
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
