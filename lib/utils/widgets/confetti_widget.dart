import 'package:confetti/confetti.dart';

import '../../app.dart';

class KochureConfettiWidget extends StatelessWidget {
  const KochureConfettiWidget({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: ref.watch(confettiProvider(10)),
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ],
      createParticlePath: drawStar,
    );
  }
}
