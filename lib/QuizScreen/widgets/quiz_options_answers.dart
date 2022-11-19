import 'package:kochure_quiz_app/app.dart';

class QuizOptionsAnswers extends StatelessWidget {
  const QuizOptionsAnswers({
    Key? key,
    required this.question,
    required this.index,
    required this.questionBank, required this.answerId,
  }) : super(key: key);
  final String question;
  final int answerId;

  final int index;
  final QuestionBank questionBank;
  Color iconColor() {
    if (index != answerId) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: BrandColors.greyScale,
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
            index.toString() ==
                    questionBank.questionBank.map((e) => e.answerId).toString()
                ? Icons.remove_circle_outline
                : Icons.access_alarm_sharp,
            color:iconColor()
          ),
        ],
      ),
    );
  }
}
