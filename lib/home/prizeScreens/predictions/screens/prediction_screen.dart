import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottery_app/home/constants/app_colors.dart';
import '../models/prediction_model.dart';
import '../widgets/prediction_card.dart';
import '../widgets/plan_tabs.dart';
import '../widgets/prediction_header.dart';
import '../widgets/generate_button.dart';

class PredictionScreen extends StatefulWidget {
  final String selectedImage;
  final String selectedTitle;
  final String selectedAmount;
  final String selectedPrizeTitle;

  const PredictionScreen({
    super.key,
    required this.selectedImage,
    required this.selectedTitle,
    required this.selectedAmount,
    required this.selectedPrizeTitle,
  });

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

enum PredictionState { ready, generating, generated }

class _PredictionScreenState extends State<PredictionScreen> {
  PredictionState currentState = PredictionState.ready;
  PredictionModel? predictionData;
  int selectedPlan = 1;

  void generatePredictions() async {
    setState(() {
      currentState = PredictionState.generating;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      predictionData = PredictionModel.sample();
      currentState = PredictionState.generated;
    });
  }

  Widget _buildBody() {
    if (selectedPlan != 1) {
      return const Center(
        child: Text(
          'Sample data center (for demo only)',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    switch (currentState) {
      case PredictionState.ready:
        return _buildReadyView();
      case PredictionState.generating:
        return _buildGeneratingView();
      case PredictionState.generated:
        return _buildGeneratedView();
    }
  }

  Widget _buildReadyView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset('assets/images/gold_star.png', height: 40, width: 40),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Ready to Predict',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          const Text(
            'Generate AI-powered predictions for Sthree Sakthi',
            style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 111, 111, 111)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GenerateButton(
            onPressed: generatePredictions,
            isLoading: currentState == PredictionState.generating,
          ),
        ],
      );

  Widget _buildGeneratingView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Image.asset('assets/images/gif_load.gif', height: 150),
          const SizedBox(height: 20),
          const CircularProgressIndicator(color: Colors.blue),
          const SizedBox(height: 16),
          const Text('Generating AI-powered Predictions...',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 40),
          GenerateButton(
            onPressed: generatePredictions,
            isLoading: true,
          ),
        ],
      );

  Widget _buildGeneratedView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                colors: AppColors.kGradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset('assets/images/gold_star.png', height: 40, width: 40),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Prediction Generated',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text(
            'Here are your AI-powered predictions for Sthree Sakthi',
            style: TextStyle(fontSize: 11, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),




          // containers......predictionData 
          if (predictionData != null)
            Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: predictionData!.predictions
                  .map((e) => PredictionCard(number: e))
                  .toList(),
            ),



          const SizedBox(height: 20),
          const Text(
            'Ai analyzed recent draw patterns and generated predictions. Tap Generate Predictions to start.',
            style: TextStyle(fontSize: 11, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          GenerateButton(
            onPressed: () {
              // Pop with the prediction result 
              Navigator.pop(context, PredictionResultModel(
                lotteryName: widget.selectedTitle,
                prizeType: widget.selectedPrizeTitle,
                numbers: predictionData!.predictions,
              ));
            },
            isLoading: false,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // If we have generated predictions, return them when popping
        if (currentState == PredictionState.generated && predictionData != null) {
          Navigator.pop(context, PredictionResultModel(
            lotteryName: widget.selectedTitle,
            prizeType: widget.selectedPrizeTitle,
            numbers: predictionData!.predictions,
          ));
          return false; // We've handled the pop manually
        }
        return true; // Allow normal pop
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PredictionHeader(
          selectedImage: widget.selectedImage,
          selectedTitle: widget.selectedTitle,
          selectedPrizeTitle: widget.selectedPrizeTitle,
          selectedAmount: widget.selectedAmount,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: AppColors.kGradientColors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/ai_icon.png", height: 30, width: 30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'AI POWERED PREDICTIONS',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                PlanTabs(
                  selectedPlan: selectedPlan,
                  onTabSelected: (plan) => setState(() => selectedPlan = plan),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _buildBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}