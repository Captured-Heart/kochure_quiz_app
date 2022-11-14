import 'package:kochure_quiz_app/app.dart';
import 'package:kochure_quiz_app/desktop/view/desktop_main.dart';
import 'package:kochure_quiz_app/mobile/views/mobile_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kochure Quiz',
        theme: ThemeData(
            primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
        home: const Responsive(
          desktop: DesktopMain(),
          mobile: MobileMain(),
          tablet: DesktopMain(),
        )
        // const OnboardScreenDesktop(title: 'Flutter Demo Home Page'),
        );
  }
}

