import 'package:timer_count_down/timer_count_down.dart';

import '../../../app.dart';

class QuizScreenDesktop extends ConsumerStatefulWidget {
  static const String routeName = 'QuizScreen';
  const QuizScreenDesktop({super.key});

  @override
  QuizScreenDesktopState createState() => QuizScreenDesktopState();
}

class QuizScreenDesktopState extends ConsumerState<QuizScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final no = ref.watch(pageIndexProvider);
    final pageController = ref.watch(pageViewControllerProvider);
    final showButton = ref.watch(showButtonProvider);
    final countController = ref.watch(countDownControllerProvider);
    final double scores = ref.watch(scoreClassNotifierProvider);
    // final timer = ref.watch(timerProvider);

// fina
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: FullScreenLoader(
          //TODO: SET THE LOADING VALUE HERE
          isLoading: false,
          title: 'Submitting...',
          child: QuizAppBackground(
            size: size,
            imgPath: no.isOdd ? kochureBg5 : kochureBg4,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Countdown(
                  seconds: 5,
                  controller: countController,
                  onFinished: () {
                    ref
                        .read(showButtonProvider.notifier)
                        .update((state) => true);
                  },
                  build: (context, time1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        // Timer
                        // const TimerCard(),
                        linearSecsCounter(
                          size,
                          time1,
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
                              textScaleFactor: 3,
                            ),
                          ),
                        ),

                        KochureButton(
                            onTap: () {
                              ref
                                  .read(scoreClassNotifierProvider.notifier)
                                  .increaseScore(30);
                            },
                            text: 'add'),
                        const SizedBox(
                          height: 20,
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
                                text: "/11",
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
                            onPageChanged: (value) {
                              ref
                                  .read(pageIndexProvider.notifier)
                                  .update((state) => value);
                              ref
                                  .read(showButtonProvider.notifier)
                                  .update((state) => false);
                              ref.read(countDownControllerProvider).restart();
                            },
                            controller: pageController,
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return Center(
                                child:
                                    // countController.isCompleted == true
                                    //     ?
                                    //     :
                                    QuestionCard(
                                  questionIndex: index,
                                ),
                              );
                            },
                          ),
                        ),

                        showButton == false &&
                                ref.watch(correctAnswerProvider).isEmpty
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: KochureButton(
                                  onTap: () {},
                                  text: 'Next',
                                  width: size.width * 0.25,
                                  inActiveBtn: true,
                                ),
                              )
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: KochureButton(
                                  //! IF I REMOVE THIS BUTTON, EVERYTHING HERE WILL BE ON THE WHENcOMPLETE METHOD OF MY NETWORK CALL
                                  onTap: () {
                                    ref.invalidate(onTapIndexProvider);
                                    ref.invalidate(correctAnswerProvider);
                                    ref
                                        .read(pageViewControllerProvider)
                                        .jumpToPage(no + 1);
                                  },
                                  text: 'Next',
                                  width: size.width * 0.25,
                                ),
                              ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
