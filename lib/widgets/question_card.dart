

import '../app.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard({
    Key? key,
    required this.questionIndex,
  }) : super(key: key);
  final int questionIndex;
  final QuestionBank question = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            question.questionBank[questionIndex].question!,
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 15 : 25,
              fontWeight: AppFontWeight.medium,
            ),
          ),
          //Options Card
          const SizedBox(
            height: 10,
          ),

          Options(
            question: question.questionBank[questionIndex].options![0],
          ),
          Options(
            question: question.questionBank[questionIndex].options![1],
          ),
          Options(
            question: question.questionBank[questionIndex].options![2],
          ),
          Options(
            question: question.questionBank[questionIndex].options![3],
          ),
          // const Options(),
          // const Options(),
          // const Options(),
        ],
      ),
    );
  }
}
