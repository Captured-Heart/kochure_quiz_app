import 'package:kochure_quiz_app/widgets/question_card.dart';
import 'package:kochure_quiz_app/widgets/timer_card.dart';

import '../../app.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Timer
                const TimerCard(),
                const SizedBox(
                  height: 20,
                ),
                const Text.rich(
                  TextSpan(
                    text: "Question 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    children: [
                      TextSpan(
                        text: "/10",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: BrandColors.colorGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: PageView.builder(itemBuilder: (context, index) => QuestionCard(),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
