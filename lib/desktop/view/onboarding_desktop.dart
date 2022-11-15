import '../../app.dart';

class OnboardScreenDesktop extends StatelessWidget {
  static const String routeName = 'welcome_screen';

  const OnboardScreenDesktop({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return QuizAppBackground(
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
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Kochure',
                        cursor: '',
                        speed: const Duration(milliseconds: 150),
                        textStyle: GoogleFonts.abrilFatface(
                          fontSize: Responsive.isDesktop(context)
                              ? size.height * 0.08
                              : size.height * 0.05,
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
                        horizontal: 40,
                        vertical: 20,
                      ),
                    ),
                    onPressed: () {
                      Responsive.isDesktop(context)
                          ? pushNamed(context, AuthScreenDesktop.routeName)
                          : pushNamed(context, AuthScreenMobile.routeName);
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
      ),
    );
  }
}
