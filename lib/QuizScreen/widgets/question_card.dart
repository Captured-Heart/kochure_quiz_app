import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/QuizScreen/model/quiz_model.dart';
import 'package:kochure_quiz_app/QuizScreen/widgets/quiz_options_answers.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';

import '../../AuthScreen/services/post_auth_firebase.dart';
import '../../app.dart';
import '../views/quiz_summary_screen.dart';

// final correctAnswerProvider = StateProvider<String>((ref) {
//   return '';
// });

final scoreProvider = Provider<int>((ref) {
  return 0;
});

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

class QuestionCard extends ConsumerWidget {
  QuestionCard({
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
                itemCount: 4,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                itemBuilder: (context, index) {
                  int answerId = question.questionBank[questionIndex].answerId!;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(fontWeight: AppFontWeight.bold),
                        textScaleFactor: 1.4,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child:
                            // isSummary == true
                            //     ? QuizOptionsAnswers(
                            //         question: question.questionBank[questionIndex]
                            //             .options![index],
                            //         index: index,
                            //         questionBank: question,
                            //       )
                            //     :

                            QuizOptions(
                          question: question
                              .questionBank[questionIndex].options![index],
                          index: index,
                          questionBank: question,
                          onTap: () async {
                            //! pauses the counter
                            ref.read(countDownControllerProvider).pause();
                            ref
                                .read(loadingProvider.notifier)
                                .update((state) => true);
                            if (answerId == index) {
                              log('answers are correct');

                              ref
                                  .read(scoreClassNotifierProvider.notifier)
                                  .increaseScore(scoreFromCounter);
                              Map quizMap = QuizModel(
                                userId: SharedPrefHelper.getUserID(),
                                score: scoreFromCounter,
                                scoreTotal: SharedPrefHelper.getScoreTotal(),
                                questionNo: pageIndex + 1,
                                createdAt: Timestamp.now(),
                              ).toJson();

                              inspect(quizMap);
                              await updateFinalScore(
                                SharedPrefHelper.getScoreTotal(),
                              );
                              await postParticipantsScore(ref, quizMap)
                                  .whenComplete(() {
                                ref
                                    .read(loadingProvider.notifier)
                                    .update((state) => false);
                                ref
                                    .read(pageViewControllerProvider)
                                    .jumpToPage(pageIndex + 1);
                              });
                            } else {
                              Map quizMap = QuizModel(
                                userId: SharedPrefHelper.getUserID(),
                                score: 0,
                                scoreTotal: SharedPrefHelper.getScoreTotal(),
                                questionNo: pageIndex + 1,
                                createdAt: Timestamp.now(),
                              ).toJson();

                              inspect(quizMap);
                              await updateFinalScore(
                                SharedPrefHelper.getScoreTotal(),
                              );
                              await postParticipantsScore(ref, quizMap)
                                  .whenComplete(() {
                                ref
                                    .read(loadingProvider.notifier)
                                    .update((state) => false);
                                ref
                                    .read(pageViewControllerProvider)
                                    .jumpToPage(pageIndex + 1);
                              });
                            }

                           
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Options(
            //   question: question.questionBank[questionIndex].options![0],
            //   isCorrect: true,
            //   onTap: () {},
            // ),
            // Options(
            //   question: question.questionBank[questionIndex].options![1],
            //   isCorrect: true,
            //   onTap: () {},
            // ),
            // Options(
            //   question: question.questionBank[questionIndex].options![2],
            //   isCorrect: true,
            //   onTap: () {},
            // ),
            // Options(
            //   question: question.questionBank[questionIndex].options![3],
            //   isCorrect: false,
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
