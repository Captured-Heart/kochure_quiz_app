import 'package:kochure_quiz_app/app.dart';

class QuizOptions extends StatelessWidget {
  const QuizOptions({
    Key? key,
    required this.question,
    required this.onTap,
    required this.isCorrect,
    required this.onTapIndex,
    required this.index,
    required this.questionBank,
    required this.questionIndex,
  }) : super(key: key);
  final String question;
  final VoidCallback onTap;
  final bool isCorrect;
  final int onTapIndex;
  final int index, questionIndex;
  final QuestionBank questionBank;

  Color borderColor(int index) {
    if (onTapIndex == 5) {
      return BrandColors.greyScale;
    } else if (onTapIndex == index &&
        questionBank.questionBank[questionIndex].answerId == onTapIndex) {
      return BrandColors.colorGreen;
    } else {
      return BrandColors.greyScale;
    }
  }

  IconData checkIcon(int index) {
    if (onTapIndex == 5) {
      return Icons.remove_circle_outline;
    } else if (onTapIndex == index &&
        questionBank.questionBank[questionIndex].answerId == onTapIndex) {
      return Icons.check;
    } else {
      return Icons.close;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: isCorrect == true
                  ? borderColor(index)
                  : BrandColors.greyScale,
            ),

            // isCorrect == true
            //     ? BrandColors.colorGreen
            //     : BrandColors.colorPink),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question,
              style: TextStyle(color: Colors.grey.shade500),
              textScaleFactor: Responsive.isMobile(context) ? 1 : 2,
            ),
            Icon(
              checkIcon(index),
              color: borderColor(index),
            ),
          ],
        ),
      ),
    );
  }
}
