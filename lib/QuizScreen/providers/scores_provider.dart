import 'package:kochure_quiz_app/utils/shared_prefs.dart';

import '../../app.dart';

class ScoreClassNotifier extends StateNotifier<double> {
  ScoreClassNotifier() : super(0);

  void increaseScore(double newScore) {
    state = state + newScore;
    SharedPrefHelper.setScoreTotal(id: state);
  }
}

final StateNotifierProvider<ScoreClassNotifier, double>
    scoreClassNotifierProvider = StateNotifierProvider((ref) {
  return ScoreClassNotifier();
});
