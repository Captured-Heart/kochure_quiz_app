import '../app.dart';

class DesktopMain extends ConsumerWidget {
  static const String routeName = 'Welcome_screen';
  const DesktopMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: OnboardScreenDesktop(),
    );
  }
}
