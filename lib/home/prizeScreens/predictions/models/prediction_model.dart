class PredictionModel {
  final List<int> predictions;

  PredictionModel({required this.predictions});

  // Dummy data (later you can fetch from backend)
  static PredictionModel sample() {
    return PredictionModel(predictions: [8123, 4567, 9876, 3459]);
  }
}


class PredictionResultModel {
  final String lotteryName;
  final String prizeType;
  final List<int> numbers;

  PredictionResultModel({
    required this.lotteryName,
    required this.prizeType,
    required this.numbers,
  });
}
