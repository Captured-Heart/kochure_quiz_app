import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/QuizScreen/model/quiz_model.dart';
import 'package:kochure_quiz_app/QuizScreen/widgets/quiz_options_answers.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';

import '../../AuthScreen/services/post_auth_firebase.dart';
import '../../app.dart';

// final correctAnswerProvider = StateProvider<String>((ref) {
//   return '';
// });

final scoreProvider = Provider<int>((ref) {
  return 0;
});

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

class QuestionCardAnswers extends ConsumerWidget {
  QuestionCardAnswers({
    Key? key,
    required this.questionIndex,
    required this.scoreFromCounter,
    this.isSummary,
    this.option,
  }) : super(key: key);
  final int questionIndex;
  final QuestionBank question = QuestionBank();
  final Widget? option;
  final double scoreFromCounter;
  final bool? isSummary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);
    final loading = ref.watch(loadingProvider);

    // final correctAnswer = ref.watch(correctAnswerProvider);
    // final checkIfClicked = ref.watch(checkIfClickedPageProvider);
    final scoreTotal = ref.watch(scoreClassNotifierProvider);

    return FullScreenLoader(
      //TODO: SET THE LOADING VALUE HERE
      isLoading: loading,
      title: 'Submitting...',
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: Responsive.isMobile(context)
            ? double.maxFinite
            : MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                question.questionBank[questionIndex].question!,
                style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 15 : 30,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            //Options Card

            Flexible(
                child: ListView.builder(
              itemCount: question.questionBank.length,
              itemBuilder: (context, index) => Column(
                children: [
                  QuizOptionsAnswers(
                    question: question.questionBank[questionIndex].options![0],
                    index: index,
                    answerId: question.questionBank[index].answerId!,
                    questionBank: question,
                  ),
                  QuizOptionsAnswers(
                    question: question.questionBank[questionIndex].options![1],
                    index: index,
                    questionBank: question,
                    answerId: question.questionBank[index].answerId!,
                  ),
                  QuizOptionsAnswers(
                    question: question.questionBank[questionIndex].options![2],
                    index: 2,
                    questionBank: question,
                    answerId: question.questionBank[index].answerId!,
                  ),
                  QuizOptionsAnswers(
                    question: question.questionBank[questionIndex].options![3],
                    index: 3,
                    questionBank: question,
                    answerId: question.questionBank[index].answerId!,
                  ),
                ],
              ),
            )

                // ListView.builder(
                //   itemCount: question.questionBank.length,
                //   itemBuilder: (context, index) {
                //     return
                //   },
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
