import '../../app.dart';

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
final pageViewControllerProvider = Provider<PageController>((ref) {
  return PageController(initialPage: 0);
});
