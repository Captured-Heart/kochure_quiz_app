import 'package:kochure_quiz_app/app.dart';

class QuizOptions extends StatelessWidget {
  const QuizOptions({
    Key? key,
    required this.question,
    required this.onTap,
    required this.index,
    required this.questionBank,
  }) : super(key: key);
  final String question;
  final VoidCallback onTap;

  final int index;
  final QuestionBank questionBank;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            const Icon(
              Icons.remove_circle_outline,
              color: BrandColors.greyScale,
            ),
          ],
        ),
      ),
    );
  }
}
