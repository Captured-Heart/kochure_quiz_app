

import '../../app.dart';

class OnboardScreenDesktop extends StatefulWidget {
  const OnboardScreenDesktop({super.key, required this.title});

  final String title;

  @override
  State<OnboardScreenDesktop> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreenDesktop> {
  List<String> title = [
    'goood',
    'build',
    'doooom',
    'final',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.red,
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
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Kochure',
                      cursor: '',
                      speed: const Duration(milliseconds: 200),
                      textStyle: GoogleFonts.abrilFatface(
                        fontSize: size.height * 0.08,
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
            SizedBox(
              height: size.height * 0.6,
              width: size.width * 0.5,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),

                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      color: BrandColors.colorBackground,
                      // elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('data'),
                          ListTile(
                            title: Text(title[index]),
                            subtitle: const Text('ndsdbhsds'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
