import 'package:flutter/material.dart';
import 'package:lottery_app/home/prizeScreens/models/prize_model.dart';
import 'package:lottery_app/home/prizeScreens/predictions/screens/prediction_screen.dart';
import 'package:lottery_app/home/prizeScreens/predictions/models/prediction_model.dart';

class Predict_button_prizeScreen extends StatelessWidget {
  const Predict_button_prizeScreen({
    super.key,
    required this.selectedTitle,
    required this.prize,
    this.onPredictionResult,
  });

  final String selectedTitle;
  final PrizeModel prize;
  final Function(PredictionResultModel)? onPredictionResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: SizedBox(
        height: 22, // button height
        width: 70, // button width
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PredictionScreen(
                  selectedTitle:
                      selectedTitle, // main lottery name (e.g. "Sthree Sakthi")
                  selectedAmount: prize
                      .amount, // ₹80 Lakh
                  selectedImage: prize
                      .image, // same lottery image
                  selectedPrizeTitle: prize
                      .title, // e.g. "FIRST PRIZE"
                ),
              ),
            );
            
            // If we received a prediction result, pass it up
            if (result != null && onPredictionResult != null) {
              onPredictionResult!(result);
            }
          },

          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(
                  255,
                  21,
                  116,
                  194,
                ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(3),
            ),
            padding: EdgeInsets
                .zero, // ensures no extra padding
          ),
          child: const Text(
            "PREDICT",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}