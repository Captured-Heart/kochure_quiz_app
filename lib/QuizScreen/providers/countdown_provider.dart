import '../../app.dart';

final countDownControllerProvider = Provider<CountdownController>((ref) {
  return CountdownController(autoStart: true);
});
