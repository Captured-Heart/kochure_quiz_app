import '../../app.dart';

class ScoreClassNotifier extends StateNotifier<double> {
  ScoreClassNotifier() : super(0);

  void increaseScore(double newScore) {
    state = state + newScore;
  }
}

final StateNotifierProvider<ScoreClassNotifier, double>
    scoreClassNotifierProvider = StateNotifierProvider((ref) {
  return ScoreClassNotifier();
});
