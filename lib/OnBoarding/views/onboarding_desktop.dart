import 'package:kochure_quiz_app/QuizScreen/views/quiz_rules_screen.dart';
import 'package:kochure_quiz_app/QuizScreen/views/quiz_summary_screen.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';

import '../../../app.dart';
import '../../ScoreBoard/leaderboard_screen.dart';

class OnboardScreenDesktop extends StatelessWidget {
  static const String routeName = 'welcome_screen';

  const OnboardScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: QuizAppBackground(
        size: size,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Row(
                      children: [
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Image.asset(
                      kochureLogo,
                      height: Responsive.isDesktop(context)
                          ? size.height * 0.1
                          : size.height * 0.07,
                      width: Responsive.isDesktop(context)
                          ? size.width * 0.1
                          : size.width * 0.15,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Kochure',
                            cursor: '',
                            speed: const Duration(milliseconds: 150),
                            textStyle: GoogleFonts.abrilFatface(
                              fontSize: Responsive.isDesktop(context)
                                  ? size.height * 0.08
                                  : size.height * 0.04,
                              color: BrandColors.colorBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                          .expand((element) => [
                                element,
                                const SizedBox(
                                  width: 20,
                                )
                              ])
                          .toList()),
                ),
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 20,
                    children: [
                      OnBoardingScreenAds(
                        title: 'title',
                        size: size,
                        imgUrl: quizOnBoard2,
                      ),
                      OnBoardingScreenAds(
                        title: 'title',
                        size: size,
                        imgUrl: quizOnBoard1,
                      ),
                      OnBoardingScreenAds(
                        title: 'title',
                        size: size,
                        imgUrl: quizOnBoard3,
                      ),
                      OnBoardingScreenAds(
                        title: 'title',
                        size: size,
                        imgUrl: quizOnBoard4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Responsive.isDesktop(context)
                          ? size.width * 0.01
                          : size.width * 0.08,
                      top: size.height * 0.03,
                      bottom: size.height * 0.1),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: BrandColors.colorPrimaryDark,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: Responsive.isDesktop(context) ? 20 : 10,
                        ),
                      ),
                      onPressed: () {
                        SharedPrefHelper.getUserID().isEmpty
                            ? pushNamed(context, AuthScreenDesktop.routeName)
                            : pushNamed(context, QuizScreenDesktop.routeName);
                      },
                      child: Text(
                        'Next',
                        style: const TextStyle(
                          fontWeight: AppFontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        textScaleFactor:
                            Responsive.isDesktop(context) ? 1.8 : 1.3,
                      ),
                    ),
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
