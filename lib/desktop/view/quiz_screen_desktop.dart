import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../app.dart';

// final timerProvider = Provider<Timer>((ref) {
//   final stopWatch = Stopwatch()..start();

//   return Timer.periodic(
//     const Duration(seconds: 1),
//     (value) {
//       if (stopWatch.elapsedMilliseconds >= 10000) {
//         log('onbooo');
//       }
//     },
//   );
// });

final showButtonProvider = StateProvider<bool>((ref) {
  return false;
});
final countDownControllerProvider = Provider<CountdownController>((ref) {
  return CountdownController(autoStart: true);
});

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
    // final timer = ref.watch(timerProvider);

// fina
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          imgPath: no.isOdd ? kochureBg5 : kochureBg4,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                // Timer
                // const TimerCard(),
                Countdown(
                  seconds: 10,
                  onFinished: () {
                    ref
                        .read(showButtonProvider.notifier)
                        .update((state) => true);
                  },
                  build: (context, time1) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: size.width * 0.5,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: BrandColors.colorBackground,
                              width: 3,
                            )),
                        padding: const EdgeInsets.only(left: 1),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: LinearProgressIndicator(
                                minHeight: 40,
                                value: time1 / 10,
                                // snapshot.data! / 10,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    BrandColors.colorPrimaryDark),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    '$time1 secs',
                                    style: const TextStyle(
                                        color: BrandColors.colorBackground),
                                    textScaleFactor: 1.5,
                                  ),
                                  const Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
                          fontSize: Responsive.isMobile(context) ? 18 : 25,
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
                    },
                    controller: pageController,
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return Center(
                        child: QuestionCard(
                          questionIndex: index,
                        ),
                      );
                    },
                  ),
                ),

                showButton == false
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
                          onTap: () {
                            ref
                                .read(pageViewControllerProvider)
                                .jumpToPage(no + 1);
                          },
                          text: 'Next',
                          width: size.width * 0.25,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
