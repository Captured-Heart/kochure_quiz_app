import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:kochure_quiz_app/app.dart';
import 'package:kochure_quiz_app/desktop/view/quiz_screen_desktop.dart';
import 'package:kochure_quiz_app/general_main.dart';

void main() {
  runApp(ProviderScope(
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochure Quiz',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
      home: const GeneralMain(),
      onGenerateTitle: (context) => 'Kochure Quiz App',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            final size = MediaQuery.of(context).size;

            switch (routeSettings.name) {
              case DesktopMain.routeName:
                return DesktopMain();
              case AuthScreenDesktop.routeName:
                return AuthScreenDesktop();
              case QuizScreen.routeName:
                return const QuizScreen();
              case OnboardScreenDesktop.routeName:
                return OnboardScreenDesktop(size: size);
              case AuthScreenMobile.routeName:
                return AuthScreenMobile();
              case QuizScreenDesktop.routeName:
                return const QuizScreenDesktop();
              default:
                return const GeneralMain();
            }
          },
        );
      },
    );
  }
}
