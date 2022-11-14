import '../../app.dart';

class MobileMain extends ConsumerWidget {
    static const String routeName = 'Welcome_Screen';


  const MobileMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: QuizAppBackground(
        size: size,
        child: OnboardScreenDesktop(
          size: size,
        ),
      ),
    );
  }
}
