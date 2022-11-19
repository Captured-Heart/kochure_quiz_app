import 'package:kochure_quiz_app/app.dart';

class QuizRulesScreen extends StatelessWidget {
  static const String routeName = 'instructions';
  const QuizRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: QuizAppBackground(
        size: size,
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: BrandColors.colorBackground),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '🔔🔔 Game Rules 📢.',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      '1. Register with valid details(Email and Phone no) as winners will be sent a message to retrieve their gifts😇.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Text(
                      "2. Failure to pick an asnwer before time runs out means Zero(0) score for that question😭.",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Text(
                      '3. The quicker your answer the more points you get😊.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Text(
                      '4. Once an answer is picked, the next questions is fetched🕒.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const Text(
                      '5. Please have it in mind that, this game tests for speed and accuracy🚀.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    KochureButton(
                        onTap: () {
                          pushNamed(context, QuizScreenDesktop.routeName);
                        },
                        text: 'Start quiz')
                  ]
                      .expand(
                        (element) => [
                          element,
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: BrandColors.colorBackground,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )
                      .toList()),
            ),
          ),
        ),
      ),
    );
  }
}
