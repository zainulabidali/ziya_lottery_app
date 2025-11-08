import 'package:flutter/material.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import 'package:lottery_app/home/prizeScreens/models/prize_model.dart';
import 'package:lottery_app/home/prizeScreens/widgets/Predict_button_prizeScreen.dart';
import 'package:lottery_app/home/prizeScreens/predictions/models/prediction_model.dart';

class Prize_list_prizeScreen extends StatefulWidget {
  final List<PrizeModel> prizes;
  final String selectedTitle;
  final Function(PredictionResultModel)? onPredictionResult;

  const Prize_list_prizeScreen({
    super.key,
    required this.prizes,
    required this.selectedTitle,
    this.onPredictionResult,
  });

  @override
  State<Prize_list_prizeScreen> createState() => _Prize_list_prizeScreenState();
}

class _Prize_list_prizeScreenState extends State<Prize_list_prizeScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.prizes.length,
        itemBuilder: (context, index) {
          final prize = widget.prizes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // 🔹 Main Card Body as Container
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          255,
                          251,
                          250,
                          250,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(
                                      20,
                                    ),
                                  ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Thumbnail Image
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              gradient: LinearGradient(
                                colors: AppColors.kGradientColors,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                    0.15,
                                  ),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                prize.image,
                                height: 36,
                                width: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          // Text Info
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              child: Column(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    prize.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    prize.amount,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    "Draw: ${prize.drawDate}",
                                    style: const TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Predict Button
                          Predict_button_prizeScreen(
                            selectedTitle: widget.selectedTitle, 
                            prize: prize,
                            onPredictionResult: widget.onPredictionResult,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}