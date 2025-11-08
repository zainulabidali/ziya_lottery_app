import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/prizeScreens/predictions/screens/prediction_screen.dart';
import 'package:lottery_app/home/prizeScreens/widgets/Predict_button_prizeScreen.dart';
import 'package:lottery_app/home/prizeScreens/widgets/Prize_list_prizeScreen.dart';
import '../models/prize_model.dart';
import '../widgets/prizeScreen_appbarWidget.dart';
import '../predictions/models/prediction_model.dart';

class PrizeScreen extends StatefulWidget {
  final String selectedTitle;
  final String selectedImage;
  final String selectedSubtitle;
  final String Subtitle = "Select a prize to get preditions";

  const PrizeScreen({
    super.key,
    required this.selectedTitle,
    required this.selectedImage,
    required this.selectedSubtitle,
    required String Subtitle,

    // ignore: non_constant_identifier_names
  });

  @override
  State<PrizeScreen> createState() => _PrizeScreenState();
}

class _PrizeScreenState extends State<PrizeScreen> {
  PredictionResultModel? predictionResult;

  @override
  Widget build(BuildContext context) {
    final List<PrizeModel> prizes = [
      PrizeModel(
        title: 'FIRST PRIZE',
        amount: '₹80 Lakh',
        drawDate: '07 Nov 2025',
        image: widget.selectedImage,
        prizeType: 'first',
      ),
      PrizeModel(
        title: 'SECOND PRIZE',
        amount: '₹10 Lakh',
        drawDate: '07 Nov 2025',
        image: widget.selectedImage,
        prizeType: 'second',
      ),
      PrizeModel(
        title: 'THIRD PRIZE',
        amount: '₹1 Lakh',
        drawDate: '07 Nov 2025',
        image: widget.selectedImage,
        prizeType: 'third',
      ),
      PrizeModel(
        title: 'FOURTH PRIZE',
        amount: '₹5,000',
        drawDate: '07 Nov 2025',
        image: widget.selectedImage,
        prizeType: 'fourth',
      ),
      PrizeModel(
        title: 'FIFTH PRIZE',
        amount: '₹1,000',
        drawDate: '07 Nov 2025',
        image: widget.selectedImage,
        prizeType: 'fifth',
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        // If we have a prediction result, pass it back when popping
        if (predictionResult != null) {
          Navigator.pop(context, predictionResult);
          return false; // We've handled the pop manually
        }
        return true; // Allow normal pop
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        appBar: prizeScreen_appbarWidget(selectedImage: widget.selectedImage, selectedTitle: widget.selectedTitle, Subtitle: widget.Subtitle),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 3,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 101, 163),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ), // spacing between bar and text
                          const Text(
                            "AVAILABLE PRIZES CATEGORIES",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    //  Add comma here to separate widgets
                    Prize_list_prizeScreen(
                      prizes: prizes, 
                      selectedTitle: widget.selectedTitle,
                      onPredictionResult: (result) {
                        setState(() {
                          predictionResult = result;
                        });
                        
                        // Pop with the result
                        Navigator.pop(context, result);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}