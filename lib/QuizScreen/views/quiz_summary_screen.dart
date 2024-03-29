import 'dart:math';

import 'package:kochure_quiz_app/QuizScreen/services/fetch_quiz_summary.dart';
import 'package:kochure_quiz_app/ScoreBoard/leaderboard_screen.dart';
import 'package:kochure_quiz_app/utils/date_formatter.dart';

import '../../app.dart';

class QuizSummaryScreen extends ConsumerStatefulWidget {
  static const String routeName = 'summary';
  const QuizSummaryScreen({
    super.key,
    //  this.questionIndex,
  });

  @override
  QuizSummaryScreenState createState() => QuizSummaryScreenState();
}

class QuizSummaryScreenState extends ConsumerState<QuizSummaryScreen> {
  @override
  void initState() {
    ref.read(confettiProvider(10)).play();
    super.initState();
  }

  final QuestionBank questionBank = QuestionBank();

  // final int ? questionIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final quizDetails = ref.watch(fetchQuizSummaryProvider);
    return SafeArea(
      child: Scaffold(
        body: QuizAppBackground(
          imgPath: kochureBg4,
          size: size,
          child: Column(
            children: [
              KochureConfettiWidget(ref: ref),
              Container(
                // height: Responsive.isDesktop(context)
                //     ? size.height * 0.5
                //     : size.height * 0.3,
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: BrandColors.colorBackground,
                    width: 0.3,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: BrandColors.colorPrimary.withOpacity(0.8),
                ),
                child: quizDetails.when(
                    data: (data) {
                      return summaryWidgetWithDetails(
                        context: context,
                        score: data.scoreTotal.toString(),
                        email: data.email!,
                        phone: data.phoneNo!,
                        username: data.username!,
                        date: dateFormatted2(data.createdAt!.toDate()),
                      );
                    },
                    error: (e, _) {
                      return Center(
                        child: Text(
                          e.toString(),
                          textScaleFactor: 1.4,
                          style: const TextStyle(color: BrandColors.colorPink),
                        ),
                      );
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Thank You',
                      style: GoogleFonts.merriweather(
                        color: BrandColors.colorBackground,
                      ),
                      textScaleFactor: 3.5,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Center(
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: BrandColors.colorOrange,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              pushNamed(
                                  context, LeaderScoreBoardScreen.routeName);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Click to view the leaderboard',
                                  style: GoogleFonts.abrilFatface(
                                    fontSize: Responsive.isDesktop(context)
                                        ? size.height * 0.04
                                        : size.height * 0.02,
                                    color: BrandColors.colorOrange,
                                  ),
                                ),
                                // AnimatedTextKit(
                                //   animatedTexts: [
                                //     ColorizeAnimatedText(
                                //       'Click to view the leaderboard',
                                //       textStyle: GoogleFonts.abrilFatface(
                                //         fontSize: Responsive.isDesktop(context)
                                //             ? size.height * 0.04
                                //             : size.height * 0.02,
                                //         color: BrandColors.colorBackground,
                                //       ),
                                //       colors: [
                                //         BrandColors.colorOrange,
                                //         BrandColors.colorPink,
                                //         BrandColors.colorOrange,
                                //         BrandColors.colorPink,
                                //         BrandColors.colorGreen,
                                //         BrandColors.instantBuyBalanceText,
                                //       ],
                                //       speed: const Duration(milliseconds: 180),
                                //     ),
                                //   ],
                                //   isRepeatingAnimation: true,
                                //   repeatForever: true,
                                //   onTap: () {
                                //     pushNamed(context,
                                //         LeaderScoreBoardScreen.routeName);
                                //   },
                                // ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '  🚀',
                                  textScaleFactor:
                                      Responsive.isDesktop(context) ? 3 : 1.5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Expanded(
              //   // height: size.height * 0.7,
              //   // width: size.width,
              //   child:

              // ListView.builder(
              //   padding: const EdgeInsets.all(8),
              //   itemCount: questionBank.questionBank.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Column(
              //         children: [
              //           Text(
              //             '${index + 1}.) See how you answered the questions',
              //             style: const TextStyle(
              //                 color: BrandColors.colorBackground,
              //                 fontWeight: AppFontWeight.medium),
              //             textScaleFactor: 1.3,
              //           ),
              //           const SizedBox(
              //             height: 10,
              //           ),
              //           QuestionCard(
              //             questionIndex: index,
              //             scoreFromCounter: 0,
              //             isSummary: true,
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget summaryWidgetWithDetails({
    required BuildContext context,
    required String score,
    required String email,
    required String phone,
    required String username,
    required String date,
  }) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total Score: ',
                  style: const TextStyle(
                    color: BrandColors.colorBackground,
                  ),
                  textScaleFactor: Responsive.isDesktop(context) ? 3 : 1.5,
                ),
                CircleAvatar(
                  radius: Responsive.isDesktop(context) ? 60 : 35,
                  backgroundColor: Colors.purple[300],
                  child: Text(
                    score,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: AppFontWeight.bold,
                    ),
                    textScaleFactor: Responsive.isDesktop(context) ? 3 : 1.2,
                  ),
                )
              ],
            ),
          ),
          summaryScreenDetailsWIdget(
            title: 'Email: ',
            subtitle: email,
            context: context,
          ),
          summaryScreenDetailsWIdget(
            title: 'Phone No: ',
            subtitle: phone,
            context: context,
          ),
          summaryScreenDetailsWIdget(
            title: 'username: ',
            subtitle: username,
            context: context,
          ),
          summaryScreenDetailsWIdget(
            title: 'date: ',
            subtitle: date,
            context: context,
          ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisSize: MainAxisSize.max,
          //     children: [
          //       summaryScreenDetailsWIdget(
          //         title: 'Email: ',
          //         subtitle: email,
          //         context: context,
          //       ),
          //       summaryScreenDetailsWIdget(
          //         title: 'Phone No: ',
          //         subtitle: phone,
          //         context: context,
          //       ),
          //       summaryScreenDetailsWIdget(
          //         title: 'username: ',
          //         subtitle: username,
          //         context: context,
          //       ),
          //       summaryScreenDetailsWIdget(
          //         title: 'date: ',
          //         subtitle: date,
          //         context: context,
          //       ),
          //     ],
          //   ),
          // ),
        ]
            .expand((element) => [
                  element,
                  const SizedBox(
                    height: 10,
                  )
                ])
            .toList());
  }

  Text summaryScreenDetailsWIdget({
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return Text.rich(
      TextSpan(
        text: title,
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              fontWeight: AppFontWeight.regular,
              color: BrandColors.greyScale,
            ),
          )
        ],
        style: TextStyle(
            fontWeight: AppFontWeight.medium,
            color: BrandColors.colorBackground,
            fontSize: Responsive.isDesktop(context) ? 23 : 14),
      ),
      textScaleFactor: 1.4,
    );
  }
}
