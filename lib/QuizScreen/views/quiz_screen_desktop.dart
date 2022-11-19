import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/QuizScreen/views/quiz_summary_screen.dart';
import 'package:kochure_quiz_app/ScoreBoard/leaderboard_screen.dart';
import 'package:kochure_quiz_app/utils/top_snack_bar.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../app.dart';
import '../../AuthScreen/services/post_auth_firebase.dart';
import '../../utils/shared_prefs.dart';
import '../model/quiz_model.dart';

class QuizScreenDesktop extends ConsumerStatefulWidget {
  static const String routeName = 'QuizScreen';
  const QuizScreenDesktop({super.key});

  @override
  QuizScreenDesktopState createState() => QuizScreenDesktopState();
}

class QuizScreenDesktopState extends ConsumerState<QuizScreenDesktop> {
  final QuestionBank question = QuestionBank();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final no = ref.watch(pageIndexProvider);
    final pageController = ref.watch(pageViewControllerProvider);
    final countController = ref.watch(countDownControllerProvider);
    final double scores = ref.watch(scoreClassNotifierProvider);
    // final timer = ref.watch(timerProvider);
    ref.listen(showButtonProvider, (previous, next) {
      if (next == true) {
        topSnack(
          context: context,
          message: 'Time is Up, click next',
          isError: true,
          duration: 1500,
        );
      }
    });

// fina
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          imgPath: no.isOdd ? kochureBg5 : kochureBg4,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Countdown(
                seconds: 10,
                controller: countController,
                onFinished: () async {
                  Map quizMap = QuizModel(
                    userId: SharedPrefHelper.getUserID(),
                    score: 0,
                    scoreTotal: SharedPrefHelper.getScoreTotal(),
                    questionNo: ref.watch(pageIndexProvider) + 1,
                    createdAt: Timestamp.now(),
                  ).toJson();
                  await updateFinalScore(
                    SharedPrefHelper.getScoreTotal(),
                  );
                  await postParticipantsScore(ref, quizMap).whenComplete(() {
                    ref.read(pageViewControllerProvider).jumpToPage(no + 1);
                  });
                  // ref.invalidate(countDownControllerProvider);
                },
                build: (context, time1) {
                  double scoreFromCounter() {
                    if (time1 == 10) {
                      return 100;
                    } else if (time1 == 9) {
                      return 90;
                    } else if (time1 == 8) {
                      return 80;
                    } else if (time1 == 7) {
                      return 70;
                    } else if (time1 == 6) {
                      return 60;
                    } else if (time1 == 5) {
                      return 50;
                    } else if (time1 == 4) {
                      return 40;
                    } else if (time1 == 3) {
                      return 30;
                    } else if (time1 == 2) {
                      return 20;
                    } else if (time1 == 1) {
                      return 10;
                    } else {
                      return 0;
                    }
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      // Timer
                      // const TimerCard(),
                      linearSecsCounter(
                        size,
                        time1,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 50,
                          child: Text(
                            'Scores: $scores',
                            style: const TextStyle(
                              color: BrandColors.colorBackground,
                            ),
                            textScaleFactor:
                                Responsive.isDesktop(context) ? 3 : 1.5,
                          ),
                        ),
                      ),

                      Text.rich(
                        TextSpan(
                          text: "Question ${no + 1}",
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 18 : 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: '/${question.questionBank.length}',
                              // "/11",
                              style: TextStyle(
                                fontSize:
                                    Responsive.isMobile(context) ? 18 : 25,
                                color: Colors.white,
                              ),
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
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (value) async {
                            ref
                                .read(pageIndexProvider.notifier)
                                .update((state) => value);
                            ref
                                .read(showButtonProvider.notifier)
                                .update((state) => false);
                            ref.read(countDownControllerProvider).restart();

                            if (value + 1 == question.questionBank.length) {
                              // ignore: use_build_context_synchronously
                              pushNamed(context, QuizSummaryScreen.routeName);
                              await updateFinalScore(
                                SharedPrefHelper.getScoreTotal(),
                              );
                            }
                          },
                          controller: pageController,
                          itemCount: question.questionBank.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: QuestionCard(
                                questionIndex: index,
                                scoreFromCounter: scoreFromCounter(),
                              ),
                            );
                          },
                        ),
                      ),

                      // showButton == false
                      //     ? Align(
                      //         alignment: Alignment.bottomRight,
                      //         child: KochureButton(
                      //           onTap: () {},
                      //           text: 'Next',
                      //           width: size.width * 0.25,
                      //           inActiveBtn: true,
                      //         ),
                      //       )
                      //     : Align(
                      //         alignment: Alignment.bottomRight,
                      //         child: KochureButton(
                      //           //! IF I REMOVE THIS BUTTON, EVERYTHING HERE WILL BE ON THE WHENcOMPLETE METHOD OF MY NETWORK CALL
                      //           onTap: () {
                      //             ref.invalidate(correctAnswerProvider);
                      //             // ref
                      //             //     .read(
                      //             //         checkIfClickedPageProvider.notifier)
                      //             //     .update((state) =>
                      //             //         ref.watch(pageIndexProvider));
                      //             ref
                      //                 .read(pageViewControllerProvider)
                      //                 .jumpToPage(no + 1);
                      //           },
                      //           text: 'Next',
                      //           width: size.width * 0.25,
                      //         ),
                      //       ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
