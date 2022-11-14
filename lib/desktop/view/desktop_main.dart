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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: OnboardScreenDesktop(size: size),
    );
  }
}

class OnScreenAds extends StatelessWidget {
  const OnScreenAds({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  final String title;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.35,
      height: size.height * 0.28,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: BrandColors.colorBackground,
        // elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
