
import '../../app.dart';
import '../model/scores_model.dart';

final onTapIndexProvider = StateProvider<int>((ref) {
  return 5;
});
final isCorrectProvider = StateProvider<bool>((ref) {
  return false;
});
final correctAnswerProvider = StateProvider<String>((ref) {
  return '';
});

final scoreProvider = Provider<int>((ref) {
  return 0;
});

class QuestionCard extends ConsumerWidget {
  QuestionCard({
    Key? key,
    required this.questionIndex,
    this.option,
  }) : super(key: key);
  final int questionIndex;
  final QuestionBank question = QuestionBank();
  final Widget? option;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onTapIndex = ref.watch(onTapIndexProvider);
    final isCorrect = ref.watch(isCorrectProvider);
    final pageIndex = ref.watch(pageIndexProvider);
    final correctAnswer = ref.watch(correctAnswerProvider);
    final double scores = ref.watch(scoreClassNotifierProvider);

    return Container(
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
                      child: option ??
                          QuizOptions(
                            question: question
                                .questionBank[questionIndex].options![index],
                            isCorrect: isCorrect,
                            onTapIndex: onTapIndex,
                            index: index,
                            questionBank: question,
                            questionIndex: pageIndex,
                            onTap: () {
                              //! updates the index of option tapped
                              ref
                                  .read(onTapIndexProvider.notifier)
                                  .update((state) => index);

                              //! updates the correct answer
                              ref.read(correctAnswerProvider.notifier).update(
                                  (state) => (question
                                              .questionBank[questionIndex]
                                              .answerId! +
                                          1)
                                      .toString());
                              //! pauses the counter
                              ref.read(countDownControllerProvider).pause();
                              //TODO: LOADING PROVIDER SHOULD BE INITITATED HERE


                              //! if answerID matches the options index
                              if (answerId == index) {
                                // ref
                                //     .read(onTapIndexProvider.notifier)
                                //     .update((state) => index);
                                ref
                                    .read(isCorrectProvider.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(isCorrectProvider.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Correct Option is: ',
                style: TextStyle(
                    fontSize: 20,
                    color: correctAnswer.isEmpty
                        ? BrandColors.colorPrimary
                        : isCorrect == true
                            ? BrandColors.colorGreen
                            : BrandColors.colorPink),
              ),
              Text(
                correctAnswer,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: AppFontWeight.bold,
                    color: correctAnswer.isEmpty
                        ? BrandColors.colorPrimary
                        : isCorrect == true
                            ? BrandColors.colorGreen
                            : BrandColors.colorPink),
                textScaleFactor: 1.8,
              ),
            ],
          )
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
    );
  }
}
