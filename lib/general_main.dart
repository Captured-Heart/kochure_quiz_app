import 'app.dart';

class GeneralMain extends StatelessWidget {
  const GeneralMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopMain(),
      mobile: const MobileMain(),
      tablet: DesktopMain(),
    );
  }
}
