
import '../../app.dart';

class OnboardScreenDesktop extends StatelessWidget {
  const OnboardScreenDesktop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return QuizAppBackground(
      size: size,
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
                  height: size.height * 0.1,
                  width: size.width * 0.1,
                  fit: BoxFit.fill,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Kochure',
                      cursor: '',
                      speed: const Duration(milliseconds: 150),
                      textStyle: GoogleFonts.abrilFatface(
                        fontSize: size.height * 0.08,
                        color: BrandColors.colorBackground,
                      ),
                    ),
                  ],
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
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                OnScreenAds(
                  title: 'title',
                  size: size,
                ),
                OnScreenAds(
                  title: 'title',
                  size: size,
                ),
                OnScreenAds(
                  title: 'title',
                  size: size,
                ),
                OnScreenAds(
                  title: 'title',
                  size: size,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.08,
                top: size.height * 0.03,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: BrandColors.colorPrimaryDark,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  onPressed: () {
                    pushNamed(context, AuthScreenDesktop.routeName);
                  },
                  child: const Text(
                    'Next',
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
