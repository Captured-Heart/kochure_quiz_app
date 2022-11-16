import '../../app.dart';

class DesktopMain extends ConsumerWidget {
  static const String routeName = 'Welcome_screen';
  DesktopMain({super.key});
  final List<String> title = [
    'goood',
    'build',
    'doooom',
    'final',
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: OnboardScreenDesktop(),
    );
  }
}

class OnScreenAds extends StatelessWidget {
  const OnScreenAds({
    Key? key,
    required this.title,
    required this.size,
    required this.imgUrl,
  }) : super(key: key);

  final String title;
  final Size size;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          Responsive.isDesktop(context) ? size.width * 0.35 : size.width * 0.38,
      height: Responsive.isDesktop(context)
          ? size.height * 0.38
          : size.height * 0.25,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: BrandColors.colorBackground,
          // elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgUrl,
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
